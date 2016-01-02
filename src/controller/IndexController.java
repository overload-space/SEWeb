package controller;

import model.Database;
import model.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;

@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    private Database database;
    @RequestMapping(method = RequestMethod.GET)


    public String get(HttpSession session) {
        ArrayList<Message> messages=null;

        try {
            messages = Message.getAllMessages(database);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        session.setAttribute("messageIndex",messages);

        return "index";
    }
}
