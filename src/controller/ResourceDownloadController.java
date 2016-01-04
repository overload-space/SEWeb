package controller;


import org.springframework.core.io.FileSystemResource;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;

/**
 * Created by user on 2016/1/3.
 */


@Controller
@RequestMapping("downloadfile")
public class ResourceDownloadController {
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public FileSystemResource getFile(HttpServletResponse response, @RequestParam("fileurl") String url) {
        System.out.println(url);
        File file = new File(url);
        response.setContentType("application/force-download");
        response.setContentLength((int)file.length());
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setHeader("Content-Disposition","attachment; filename=\"" +file.getName() +"\"");//fileName);

        return new FileSystemResource(file);
    }
}
