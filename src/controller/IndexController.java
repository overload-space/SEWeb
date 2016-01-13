package controller;

import Common.MessageDAO;
import Common.StudentDAO;
import model.Database;
import model.Message;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.async.StandardServletAsyncWebRequest;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

@Controller
@RequestMapping("/index")
public class IndexController {
    @Autowired
    private Database database;
    File file = new File("D:/course_information.txt");
    @RequestMapping(method = RequestMethod.GET)


    public String get(HttpSession session) {
        List<Message> messages=null;
        List<Student> admins = null;

        messages = MessageDAO.getMessageList(database);
        admins= StudentDAO.getTeacherAndTAList(database);

        session.setAttribute("messageIndex",messages);
        session.setAttribute("admins",admins);

        StringBuilder courseInformation=new StringBuilder();

        Scanner input=null;
        try {
           input = new Scanner(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }

        while(input!=null && input.hasNextLine()) {
            courseInformation.append(input.nextLine()+"\\r");
        }
        System.out.println(courseInformation);
        input.close();
        session.setAttribute("courseInformation",courseInformation.toString());



        return "index";
    }

    @RequestMapping(method = RequestMethod.POST)

    public String post(@RequestParam("textarea") String content,HttpSession session) {

        System.out.println(content);
        PrintWriter printWriter=null;
        try {
           printWriter=new PrintWriter(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        printWriter.print(content);
        printWriter.close();
        session.setAttribute("courseInformation",content);

        return "redirect:index";
    }
}
