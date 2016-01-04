package model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by user on 2016/1/2.
 */


public class Resource {
    private int id;
    private Timestamp time;
    private String fileName;
    private String description;
    private String fileUrl;

    public Resource() {
        SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=dateformat.format(new Date());
        try {
            this.time = new Timestamp(dateformat.parse(time).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        id= this.time.hashCode();
    }
    public Resource(String fileName,String description,String fileUrl){
        SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=dateformat.format(new Date());
        try {
            this.time = new Timestamp(dateformat.parse(time).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        id= this.time.hashCode();
        this.fileName=fileName;
        this.description=description;
        this.fileUrl=fileUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

}
