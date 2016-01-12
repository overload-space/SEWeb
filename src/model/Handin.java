package model;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Handin {
    private int studentID;
    private int homeworkID;
    private int attachmentID;
    private Timestamp submitTime;

    public Handin() {

    }

    public Handin(int studentID, int homeworkID, int attachmentID) {
        this.studentID = studentID;
        this.homeworkID = homeworkID;
        this.attachmentID = attachmentID;
        SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateformat.format(new Date());
        try {
            this.submitTime = new Timestamp(dateformat.parse(time).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public int getHomeworkID() {
        return homeworkID;
    }

    public int getStudentID() {
        return studentID;
    }

    public int getAttachmentID() {
        return attachmentID;
    }

    public Timestamp getSubmitTime() {
        return submitTime;
    }

    public void setHomeworkID(int homeworkID) {
        this.homeworkID = homeworkID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public void setAttachmentID(int attachmentID) {
        this.attachmentID = attachmentID;
    }

    public void setSubmitTime(Timestamp submitTime) {
        this.submitTime = submitTime;
    }
}
