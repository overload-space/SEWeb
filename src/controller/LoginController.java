package controller;

import model.Database;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private Database database;
    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpSession session) {
        System.out.println("get");
        session.setAttribute("studentID","登录");
        session.setAttribute("failed",0);
        return "login";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String post(HttpSession session, Student student) {
        String sql = "select ID from Student where ID=" + student.getId()+" and checked=1 and Password=\""+student.getPassword()+"\"";
      //  System.out.println(sql);
        boolean ret = database.exists(sql);
        if(ret) {
            System.out.println("yes!");
            session.setAttribute("failed",0);
            session.setAttribute("studentID",student.getId()+" 退出");
            return "index";
        }
        else {
            session.setAttribute("studentID","登录");
            session.setAttribute("failed",1);
            return "login";
        }
    }
}
