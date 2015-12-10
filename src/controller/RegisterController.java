package controller;

import model.Database;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
        String SQL = "insert into Student (ID, Name, Email, Password) values ('" + student.getId() + "', '" + student.getName() + "', '" + student.getEmail() + "', '" + student.getPassword() + "')";
        database.insert(SQL);
        return "index";
    }
}
