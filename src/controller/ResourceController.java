package controller;

import model.Database;
import model.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 * Created by user on 2016/1/2.
 */
@Controller
@RequestMapping("resource")
public class ResourceController {
    @Autowired
    private Database database;

    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpSession session) {

        ArrayList<Resource> resources=new ArrayList<Resource>();
        session.setAttribute("resources",resources);

        session.setAttribute("resourcePerPage",10);
        session.setAttribute("resourceBeginNum","1");
        session.setAttribute("isAdmin",true);
        return "resource";
    }
}
