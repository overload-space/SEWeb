package controller;

import Common.ResourceDAO;
import model.Database;
import model.Message;
import model.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("newResource")
public class NewResourceController {

    @Autowired
    private  Database database;

    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpSession session,@RequestParam("type") String type,@RequestParam("id") String id) {
        if(type.equals("new")) {
            session.setAttribute("id",-1);
            return "newResource";
        }
        else if(type.equals("modify")) {
            Resource resource=new Resource();

            resource= ResourceDAO.getResource(database,Integer.parseInt(id));

            session.setAttribute("id",resource.getId());
            session.setAttribute("desp",resource.getDescription());
            return "newResource";
        }
        else if(type.equals("delete")) {
            Resource resource=ResourceDAO.getResource(database,Integer.parseInt(id));
            File file=new File(resource.getFileUrl()+resource.getFileName());
            if(file.delete()) {
                System.out.println(file.getAbsolutePath()+" deleted!");
            }
            ResourceDAO.deleteResource(database,Integer.parseInt(id));
            return "redirect:resource";
        }
        return "resource";
    }

    @RequestMapping(method = RequestMethod.POST)
    public @ResponseBody
    String upload(MultipartHttpServletRequest request,
                          HttpServletResponse response) throws IOException {

        Map<String, MultipartFile> fileMap = request.getFileMap();
        String description=request.getParameter("desp");
        String type = request.getParameter("type");
        String id =request.getParameter("id");

        boolean isModify = type.equals("modify");

        List<Resource> uploadedFiles = new ArrayList<Resource>();

        for (MultipartFile multipartFile : fileMap.values()) {
            saveFileToLocalDisk(multipartFile);                         // file store in disk

            Resource fileInfo = getUploadedFileInfo(multipartFile);         // new file's information
            fileInfo.setDescription(description);

            if(!isModify) {
                ResourceDAO.sendResource(database, fileInfo);               // new file information store in database.
            }
            else {
                Resource resource=ResourceDAO.getResource(database,Integer.parseInt(id));
                new File(resource.getFileUrl()+resource.getFileName()).delete();                // delete origin file in disk.
                ResourceDAO.updateResource(database, Integer.parseInt(id), fileInfo);   // modify file information.

            }

            uploadedFiles.add(fileInfo);
        }

        return "redirect:resource";
    }

    private void saveFileToLocalDisk(MultipartFile multipartFile) throws IOException,
            FileNotFoundException {

        String outputFileName = getOutputFilename(multipartFile);

        FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
    }


    private String getOutputFilename(MultipartFile multipartFile) {

        return getDestinationLocation() + multipartFile.getOriginalFilename();
    }

    private Resource getUploadedFileInfo(MultipartFile multipartFile) throws IOException {

        Resource fileInfo = new Resource();
        fileInfo.setFileName(multipartFile.getOriginalFilename());
        fileInfo.setFileUrl(getDestinationLocation());
        System.out.println(fileInfo.getFileUrl());
        System.out.println(fileInfo.getFileName());

        return fileInfo;
    }

    private String getDestinationLocation() {
        String s = getClass().getName();
        int i = s.lastIndexOf(".");
        if(i > -1) s = s.substring(i + 1);
        s = s + ".class";

        String testPath = this.getClass().getResource(s).toString();

        for(int k=0;k<7;k++) {
            i=testPath.lastIndexOf("/");
            testPath=testPath.substring(0,i);
        }
        testPath+="/Resource/";
        testPath=testPath.substring(6);


        return testPath;
    }
}
