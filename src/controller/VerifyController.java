package controller;

import model.Database;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("verify_token=**")
public class VerifyController {
    @Autowired
    private Database database;
    @RequestMapping(method = RequestMethod.GET)
    public String get(HttpServletRequest request) {
       System.out.println("get it!");

        String url=request.getRequestURL().toString();
         String md5token = url.substring(url.indexOf('=')+1);
        System.out.println(md5token);

        String sql = "update `SEWeb`.`Student` " +
                "set checked=1 " +
                "where md5token = \""+md5token+"\"\n;";
       database.excute(sql);
        return "index";
    }
}
