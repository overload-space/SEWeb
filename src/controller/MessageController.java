package controller;

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
@RequestMapping("message")
public class MessageController {

    @Autowired
    private  Database db;

    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpSession session) {


        ArrayList<Message> messages=null;

        try {
            messages = Message.getAllMessages(db);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        session.setAttribute("messages",messages);
        session.setAttribute("itemPerPage",5);
        session.setAttribute("begin_num","1");
        session.setAttribute("isAdmin",true);

        return "message";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String post(HttpSession session,@RequestParam("postType") String type) {
        ArrayList<Message> messages=null;

        try {
            messages = Message.getAllMessages(db);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("begin:"+type);

        session.setAttribute("messages",messages);
        session.setAttribute("itemPerPage",5);
        session.setAttribute("begin_num",type);

        return "message";
    }
}
