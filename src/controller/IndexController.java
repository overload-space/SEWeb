package controller;

import Common.MessageDAO;
import model.Database;
import model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    private Database database;
    @RequestMapping(method = RequestMethod.GET)


    public String get(HttpSession session) {
        List<Message> messages=null;

        messages = MessageDAO.getMessageList(database);

        session.setAttribute("messageIndex",messages);

        return "index";
    }
}
