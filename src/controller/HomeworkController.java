package controller;

import Common.HomeworkDAO;
import Common.ResourceDAO;
import Common.StudentDAO;
import model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("homework")
public class HomeworkController {
    @Autowired
    private Database database;

    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpSession session, HttpServletRequest request) {
        int page = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            page = Integer.parseInt(pageStr);
        }
        System.err.println(page);
        List<Homework> homeworkList = HomeworkDAO.getHomeworkList(database);
        session.setAttribute("homeworkList", homeworkList);
        session.setAttribute("page", page);
        String idStr = (String)session.getAttribute("studentID");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            Student student = StudentDAO.getStudent(database, id);
            session.setAttribute("isAdmin", student.isAdmin());
        } else {
            session.setAttribute("isAdmin", false);
        }
        return "homework";
    }

    @RequestMapping(value = "newHomework", method = RequestMethod.GET)
    public String newHomework(HttpSession session, @RequestParam("type") String type, @RequestParam("homeworkID") int homeworkID) {
        session.setAttribute("type", type);
        switch (type) {
            case "modify" :
            session.setAttribute("homework", HomeworkDAO.getHomework(database, homeworkID));break;
            case "delete" :
            HomeworkDAO.deleteHomework(database, homeworkID);
            return "redirect:/homework";
            default:break;
        }
        return "newHomework";
    }

    @RequestMapping(value = "newHomework", method = RequestMethod.POST)
    public String newHomeworkPost(MultipartHttpServletRequest request) {
        Timestamp deadline = Timestamp.valueOf(request.getParameter("deadline")+":00");
        Timestamp delaydeadline1 = Timestamp.valueOf(request.getParameter("delaydeadline1")+":00");
        Timestamp delaydeadline2 = Timestamp.valueOf(request.getParameter("delaydeadline2")+":00");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        List<MultipartFile> files = request.getFiles("file");
        boolean hasAttachment = true;
        if (files.size() == 1 && files.get(0).getOriginalFilename().equals("")) {
            hasAttachment = false;
        }
        Homework homework = new Homework(title, content, deadline, hasAttachment);
        homework.setDelayDeadLine1(delaydeadline1);
        homework.setDelayDeadLine2(delaydeadline2);
        File homeworkDir = new File(UploadResource.getDestinationLocation() + homework.getTitle());
        homeworkDir.mkdir();
        File homeworkDelayDir1 = new File(UploadResource.getDestinationLocation() + homework.getTitle() + "_01");
        homeworkDelayDir1.mkdir();
        File homeworkDelayDir2 = new File(UploadResource.getDestinationLocation() + homework.getTitle() + "_02");
        homeworkDelayDir2.mkdir();
        if (hasAttachment) {
            try {
                for (MultipartFile multipartFile : files) {
                    UploadResource.saveFileToLocalDisk(multipartFile, homework);                         // file store in disk
                    Resource fileInfo = UploadResource.getUploadedFileInfo(multipartFile, homework);         // new file's information
                    fileInfo.setHomeworkID(homework.getHomeworkID());
                    ResourceDAO.sendResource(database, fileInfo);               // new file information store in database.
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        HomeworkDAO.newHomwork(database, homework);
        return "redirect:/homework";
    }

    @RequestMapping(value = "modifyHomework", method = RequestMethod.POST)
    public String modifyHomework(MultipartHttpServletRequest request, @RequestParam("homeworkID") int homeworkID) {
        Homework homework = HomeworkDAO.getHomework(database, homeworkID);
        Timestamp deadline = Timestamp.valueOf(request.getParameter("deadline")+":00");
        Timestamp delaydeadline1 = Timestamp.valueOf(request.getParameter("delaydeadline1")+":00");
        Timestamp delaydeadline2 = Timestamp.valueOf(request.getParameter("delaydeadline2")+":00");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        List<MultipartFile> files = request.getFiles("file");
        boolean hasAttachment = true;
        if (files.size() == 1 && files.get(0).getOriginalFilename().equals("")) {
            hasAttachment = false;
        }
        homework.setCreateAt(new Timestamp(new Date().getTime()));
        if (!title.equals(homework.getTitle())) {
            File homeworkDir = new File(UploadResource.getDestinationLocation() + homework.getTitle());
            File homeworkDelayDir1 = new File(UploadResource.getDestinationLocation() + homework.getTitle() + "_01");
            File homeworkDelayDir2 = new File(UploadResource.getDestinationLocation() + homework.getTitle() + "_02");
            homework.setTitle(title);
            File newHomeworkDir = new File(UploadResource.getDestinationLocation() + homework.getTitle());
            homeworkDir.renameTo(newHomeworkDir);
            File newHomeworkDelayDir1 = new File(UploadResource.getDestinationLocation() + homework.getTitle() + "_01");
            homeworkDelayDir1.renameTo(newHomeworkDelayDir1);
            File newHomeworkDelayDir2 = new File(UploadResource.getDestinationLocation() + homework.getTitle() + "_02");
            homeworkDelayDir2.renameTo(newHomeworkDelayDir2);
        }
        homework.setContent(content);
        homework.setDeadline(deadline);
        homework.setDelayDeadLine1(delaydeadline1);
        homework.setDelayDeadLine2(delaydeadline2);
        List<Resource> attachments = HomeworkDAO.getAttachmentList(database, homeworkID);
        if (hasAttachment) {
            homework.setHasAttachment(true);
        }
        if (hasAttachment) {
            for (Resource attachment : attachments) {
                ResourceDAO.deleteResource(database, attachment.getId());
                UploadResource.deleteFileFromDisk(attachment.getFileUrl()+attachment.getFileName());
            }
            try {
                for (MultipartFile multipartFile : files) {
                    UploadResource.saveFileToLocalDisk(multipartFile, homework);                         // file store in disk
                    Resource fileInfo = UploadResource.getUploadedFileInfo(multipartFile, homework);         // new file's information
                    fileInfo.setHomeworkID(homework.getHomeworkID());
                    ResourceDAO.sendResource(database, fileInfo);               // new file information store in database.
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        HomeworkDAO.updateHomework(database, homework);
        return "redirect:/homework";
    }

    @RequestMapping(value = "homeworkDetail", method = RequestMethod.GET)
    public String homeworkDetail(HttpSession session, @RequestParam("homeworkID") int homeworkID, @RequestParam("studentID") int studentID) {
        session.setAttribute("homework", HomeworkDAO.getHomework(database, homeworkID));
        session.setAttribute("attachmentList", HomeworkDAO.getAttachmentList(database, homeworkID));
        try {
            Handin handin = HomeworkDAO.getHandin(database, homeworkID, studentID);
            session.setAttribute("handin", handin);
            session.setAttribute("handinAttachment", ResourceDAO.getResource(database, handin.getAttachmentID()));
        } catch (EmptyResultDataAccessException ex) {
            session.setAttribute("handin", null);
        }
        return "homeworkDetail";
    }

    @RequestMapping(value = "homeworkDetail", method = RequestMethod.POST)
    public String submitHomework(MultipartHttpServletRequest request, @RequestParam("homeworkID") int homeworkID, @RequestParam("studentID") int studentID) {
        Homework homework = HomeworkDAO.getHomework(database, homeworkID);
        Date currentTime = new Date();
        if (currentTime.getTime() > homework.getDeadline().getTime() && currentTime.getTime() <= homework.getDelayDeadLine1().getTime()) {
            homework.setTitle(homework.getTitle()+"_01");
        } else if (currentTime.getTime() > homework.getDelayDeadLine1().getTime() && currentTime.getTime() <= homework.getDelayDeadLine2().getTime()) {
            homework.setTitle(homework.getTitle()+"_02");
        }
        try {
            Handin handin = HomeworkDAO.getHandin(database, homeworkID, studentID);
            MultipartFile file = request.getFile("file");
            try {
                UploadResource.saveFileToLocalDisk(file, homework);                         // file store in disk
                Resource fileInfo = UploadResource.getUploadedFileInfo(file, homework);         // new file's information
                fileInfo.setHomeworkID(-1);
                ResourceDAO.updateResource(database, handin.getAttachmentID(), fileInfo);               // new file information store in database.
                HomeworkDAO.deleteHandin(database, handin);
                handin = new Handin(studentID, homeworkID, fileInfo.getId());
                HomeworkDAO.newHandin(database, handin);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (EmptyResultDataAccessException ex) {
            MultipartFile file = request.getFile("file");
            try {
                UploadResource.saveFileToLocalDisk(file, homework);                         // file store in disk
                Resource fileInfo = UploadResource.getUploadedFileInfo(file, homework);         // new file's information
                fileInfo.setHomeworkID(-1);
                ResourceDAO.sendResource(database, fileInfo);               // new file information store in database.
                Handin handin = new Handin(studentID, homeworkID, fileInfo.getId());
                HomeworkDAO.newHandin(database, handin);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/homework/homeworkDetail?homeworkID=" + homeworkID + "&studentID=" + studentID;
    }
}
