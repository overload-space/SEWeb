package controller;

import Common.StudentDAO;
import model.Database;
import model.Student;
import model.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by user on 2016/1/12.
 */

@Controller
@RequestMapping("modify")
public class InformationModifyController {

    @Autowired
    private Database database;
    private Student student;

    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpSession session) {
        String id=((String)session.getAttribute("studentID"));

        student = StudentDAO.getStudent(database,Integer.parseInt(id));
        session.setAttribute("studentName",student.getName());
        session.setAttribute("studentEmail",student.getEmail());
        session.setAttribute("wrongPassword",0);

        return "modify";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String post(HttpSession session,HttpServletRequest request) {

        String type = request.getParameter("type");
        if(type.equals("information")) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            String id = ((String) session.getAttribute("studentID"));

            String sql = "select ID from Student where ID=" + student.getId() + " and checked=1 and Password=\"" + password + "\"";
            boolean ret = database.exists(sql);
            if (ret) {
                System.out.println("YES!");
                student.setName(name);
                student.setEmail(email);
                session.setAttribute("studentName", student.getName());
                session.setAttribute("studentEmail", student.getEmail());
                StudentDAO.updateStudent(database, Integer.parseInt(id), student);
                session.setAttribute("wrongPassword",0);

            } else {
                System.out.println("NO!");
                session.setAttribute("wrongPassword",1);
            }
        }
        else if(type.equals("password")) {
            String oldpassword=request.getParameter("old_password");
            String newpassword=request.getParameter("password");

            String id = ((String) session.getAttribute("studentID"));

            String sql = "select ID from Student where ID=" + student.getId() + " and checked=1 and Password=\"" + oldpassword + "\"";
            boolean ret = database.exists(sql);
            if (ret) {
                student.setPassword(newpassword);
                session.setAttribute("wrongPassword",0);
                StudentDAO.updateStudent(database,Integer.parseInt(id),student);
            }
            else {
                session.setAttribute("wrongPassword",1);

            }

        }
        return "modify";
    }

}
