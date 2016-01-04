package controller;

import Common.ResourceDAO;
import model.Database;
import model.Message;
import model.Resource;
import model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

        List<Resource> resources=new ArrayList<Resource>();

        resources = ResourceDAO.getResourceList(database);

        session.setAttribute("resources",resources);
        session.setAttribute("resourcePerPage",10);
        session.setAttribute("resourceBeginNum","1");

        String id=(String)session.getAttribute("studentID");
        System.out.println(id);
        session.setAttribute("isAdmin", Student.isAdmin(id));
        return "resource";
    }

}
