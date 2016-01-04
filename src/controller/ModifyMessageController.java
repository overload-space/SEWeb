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
@RequestMapping("modifyMessage")
public class ModifyMessageController {
    @Autowired
    private  Database database;
    @RequestMapping(method = RequestMethod.GET)
    public String get() {
        return "redirect:message";

    }

    @RequestMapping(method = RequestMethod.POST)
    public String post(HttpSession session,@RequestParam("content") String content,@RequestParam("title") String title,@RequestParam("id") String _id) {
        int id = Integer.parseInt(_id);
        Message message=new Message();

        message= MessageDAO.getMessage(database,id);

        message.setSubject(title);
        message.setContent(content);
        MessageDAO.updateMessage(database,id,message);

        return "redirect:message";
    }
}
