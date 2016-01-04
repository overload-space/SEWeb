package controller;

import Common.MessageDAO;
import model.Database;
import model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;

@Controller
@RequestMapping("newMessage")
public class NewMessageController {

    @Autowired
    private  Database database;

    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpSession session,@RequestParam("type") String type,@RequestParam("id") String id) {
        if(type.equals("new")) {
            session.setAttribute("id",-1);
            session.setAttribute("title",null);
            session.setAttribute("content",null);
            return "newMessage";
        }
        else if(type.equals("modify")) {
            Message message=new Message();

            message= MessageDAO.getMessage(database,Integer.parseInt(id));

            System.out.println("id"+id);
            System.out.println(message.getSubject());
            System.out.println(message.getContent());
            session.setAttribute("id",message.getId());
            session.setAttribute("title",message.getSubject());
            session.setAttribute("content",message.getContent());
            return "newMessage";
        }
        else if(type.equals("delete")) {
            System.out.println("delete: "+id);
            MessageDAO.deleteMessage(database,Integer.parseInt(id));
            return "redirect:message";
        }
        return "newMessage";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String post(HttpSession session,@RequestParam("content") String content,@RequestParam("title") String title) {

       System.out.println("content: "+content+"\n title: "+title);
        Message message = new Message(title,content);
        MessageDAO.sendMessage(database,message);
        return "redirect:message";
    }
}
