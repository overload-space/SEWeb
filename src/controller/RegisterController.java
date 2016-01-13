package controller;

import Common.StudentDAO;
import model.Database;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import  Common.SendEmail;
import java.security.*;
@Controller
@RequestMapping("register")
public class RegisterController {
    @Autowired
    private Database database;

    @RequestMapping(method = RequestMethod.GET)
    public String get() {
        return "register";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String post(Student student) {
        student.setChecked(false);

        String token=student.getEmail()+System.currentTimeMillis();
        try {
            byte[] bytesOfMessage = token.getBytes("UTF-8");
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] thedigest = md.digest(bytesOfMessage);
            token=thedigest.toString();
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        student.setMd5token(token);
        student.setLevel(0);
        StudentDAO.newStudent(database, student);
        //new SendEmail("xxx@xxx.com","http://localhost:8080/verify_token="+token);
        return "index";
    }
}
