package controller;

import Common.StudentDAO;
import model.Database;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "studentManager")
public class StudentManagerController {
    @Autowired
    private Database database;

    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpSession session) {
        session.setAttribute("studentList", StudentDAO.getStudentList(database));
        session.setAttribute("notCheckedStudentList", StudentDAO.getNotCheckedStudentList(database));
        session.setAttribute("TAList", StudentDAO.getTAList(database));
        String idStr = (String)session.getAttribute("studentID");
        session.setAttribute("isTeacher", false);
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            Student student = StudentDAO.getStudent(database, id);
            if (student.getLevel() == 100) {
                session.setAttribute("isTeacher", true);
            }
        }
        return "studentManager";
    }

    @RequestMapping(value = "newStudent", method = RequestMethod.POST)
    public String newStudent(Student student) {
        student.setChecked(true);
        StudentDAO.newStudent(database, student);
        return "redirect:/studentManager";
    }

    @RequestMapping(value = "checkStudent", method = RequestMethod.GET)
    public String checkStudent(@RequestParam("type") boolean type, @RequestParam("studentID") int studentID) {
        Student student = StudentDAO.getStudent(database, studentID);
        if (type) {
            student.setChecked(true);
            StudentDAO.updateStudent(database, studentID, student);
        } else {
            StudentDAO.deleteStudent(database, studentID);
        }
        return "redirect:/studentManager";
    }

    @RequestMapping(value = "deleteStudent", method = RequestMethod.GET)
    public String deleteStudent(@RequestParam("studentID") int studentID) {
        StudentDAO.deleteStudent(database, studentID);
        return "redirect:/studentManager";
    }
}
