package model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 * Created by Administrator on 2016/1/2.
 */
public class Message {
    private int id;
    private Timestamp time;
    private String subject;
    private String content;
    private boolean important;
    private boolean read;
    public Message(){
        SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=dateformat.format(new Date());
        try {
            this.time = new Timestamp(dateformat.parse(time).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        id= this.time.hashCode();
        important=false;
        read=false;
    }
    public Message(String subject,String content){
        SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=dateformat.format(new Date());
        try {
            this.time = new Timestamp(dateformat.parse(time).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        id= this.time.hashCode();
        this.subject=subject;
        this.content=content;
        important=false;
        read=false;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean isImportant() {
        return important;
    }

    public void setImportant(boolean important) {
        this.important = important;
    }

    public boolean isRead() {
        return read;
    }

    public void setRead(boolean read) {
        this.read = read;
    }
}
