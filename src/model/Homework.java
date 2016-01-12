package model;

import model.Database;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.io.*;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Vincent Huang on 2016/1/1.
 */



public class Homework {
    private int homeworkID;
    private String title;
    private String content;
    private Timestamp createAt;
    private Timestamp deadline;
    private Timestamp delayDeadLine1;
    private Timestamp delayDeadLine2;
    private boolean hasAttachment;

    //Database database = (Database)new FileSystemXmlApplicationContext("/web/WEB-INF/SEWeb-servlet.xml").getBean("database");

    public Homework() {}

    public Homework(String title, String content, Timestamp deadline, boolean hasAttachment) {
        this.title = title;
        this.content = content;
        this.deadline = deadline;
        this.hasAttachment = hasAttachment;
        SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = dateformat.format(new Date());
        try {
            this.createAt = new Timestamp(dateformat.parse(time).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        homeworkID = this.createAt.hashCode();
    }

    /*获取文件名*/
    public String get_filename(String target){
        File tempFile =new File( target.trim());
        String fileName = tempFile.getName();
        return fileName;
    }

    /*以“keyword_学号_姓名.zip”的格式上传作业*/
    public boolean check_format(Database database, String name,int id){
        String[] s1 = name.split("\\.");//表示用.去切割字符串
        String[] s2 = name.split("\\_");//表示用_去切割字符串
        String form= "."+s1[s1.length-1];//用.连接最后一个字符
        String sql = "select homeworkID from homework where homeworkID='" + id + "' and keyword='" + s2[0] + "';";
        boolean compare = database.exists(sql);
        if(form.equals(".zip")&&s2.length==3&&compare)
        {
            System.out.println("格式正确");
            return true;
        }
        else
        {
            System.out.println("格式错误");
            return false;
        }
    }


    /*上传作业,target为文件位置，destination为需要存入的文件夹目录，delay为延迟次数（以00,01,02记录）,homeworkid 为作业编号，studentid为学生id*/
    public void upload(Database database, String target, String destination,String delay,int homeworkid,int studentid){
        try {
            int bytesum = 0;
            int byteread = 0;
            String sql="";
            File oldfile = new File(target);
            if (oldfile.exists()) { //文件存在时
                InputStream inStream = new FileInputStream(target); //读入原文件
                String name=get_filename(target);
                if(check_format(database,name,homeworkid))
                {
                    String[] s1 = name.split("\\_");
                    File file;
                    if(delay.equals("00")) {
                        file = new File(destination + "//" + s1[0]);
                        destination=destination+"//"+s1[0]+"//"+name;
                        sql="insert into handin values("+studentid+","+homeworkid+","+delay+");";
                    }
                    else if(delay.equals("01")) {
                        file = new File(destination + "//" + s1[0]+"_"+delay);
                        destination=destination+"//"+s1[0]+"_"+delay+"//"+name;
                        sql="insert into handin values("+studentid+","+homeworkid+","+delay+");";
                    }
                    else if(delay.equals("02")) {
                        file = new File(destination + "//" +s1[0] + "_" + delay);
                        destination=destination+"//"+s1[0]+"_"+delay+"//"+name;
                        sql="insert into handin values("+studentid+","+homeworkid+","+delay+");";
                    }
                    else{
                        file = new File(target);
                        destination=target;
                    }
                    database.insert(sql);
                    //如果文件夹不存在则创建
                    if  (!file .exists()  && !file .isDirectory()) {
                        System.out.println("不存在,创建文件夹");
                        file.mkdir();
                    }
                    FileOutputStream fs = new FileOutputStream(destination);
                    byte[] buffer = new byte[1024 * 5];
                    int length;
                    while ((byteread = inStream.read(buffer)) != -1) {
                        bytesum += byteread; //字节数 文件大小
                        System.out.println(bytesum);
                        fs.write(buffer, 0, byteread);
                    }
                    inStream.close();
                }
            }
        }
        catch (Exception e) {
            System.out.println("复制文件操作出错");
            e.printStackTrace();
        }
    }

    /*删除作业*/
    public void delete(Database database, String target,int homeworkid,int studentid){
         File  file = new File(target);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
            String sql="delete from handin where studentID="+studentid+"and homeworkID="+homeworkid+";";
            database.insert(sql);
        }
        else{
            String sql2="select studentID from handin where studentID='"+studentid+"'and homeworkID='"+homeworkid+"';";
            boolean compare=database.exists(sql2);
            if(compare) {
                String sql1 = "delete from handin where studentID=" + studentid + " and homeworkID=" + homeworkid + ";";
                database.insert(sql1);
            }
            System.out.println("删除目标文件不存在");
        }
    }

    /*替换当前作业*/
    public void change(Database database, String target,String destination,String delay,int homeworkid,int studentid){
        String[] s1 = target.split("\\_");
        String[] s2=s1[0].split("\\//");
        delete(database,destination+"//"+s2[1]+"//"+get_filename(target),homeworkid,studentid);
        upload(database,target,destination,delay,homeworkid,studentid);
    }



    public void delete_set(Database database, int homeworkid){
        String sql = "delete from homework where homeworkID="+homeworkid+";";
        database.insert(sql);
    }

    public void change_set(Database database, int homeworkid,String keyword,String title,String content,String deadline,String deadline1,String deadline2){
        String sql = "update homework set keyword='"+keyword+"' where homeworkID="+homeworkid+";";
        database.insert(sql);
        String sql1 = "update homework set title='"+title+"' where homeworkID="+homeworkid+";";
        database.insert(sql1);
        String sql2 = "update homework set content='"+content+"' where homeworkID="+homeworkid+";";
        database.insert(sql2);
        String sq3 = "update homework set deadline='"+deadline+"' where homeworkID="+homeworkid+";";
        database.insert(sq3);
        String sql4 = "update homework set delaydeadline1='"+deadline1+"' where homeworkID="+homeworkid+";";
        database.insert(sql4);
        String sql5 = "update homework set delaydeadline2='"+deadline2+"' where homeworkID="+homeworkid+";";
        database.insert(sql5);
    }

    public int getHomeworkID() {
        return homeworkID;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public Timestamp getDeadline() {
        return deadline;
    }

    public Timestamp getDelayDeadLine1() {
        return delayDeadLine1;
    }

    public Timestamp getDelayDeadLine2() {
        return delayDeadLine2;
    }

    public boolean isHasAttachment() {
        return hasAttachment;
    }

    public void setHomeworkID(int homeworkID) {
        this.homeworkID = homeworkID;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setDeadline(Timestamp deadline) {
        this.deadline = deadline;
    }

    public void setDelayDeadLine1(Timestamp delayDeadLine1) {
        this.delayDeadLine1 = delayDeadLine1;
    }

    public void setDelayDeadLine2(Timestamp delayDeadLine2) {
        this.delayDeadLine2 = delayDeadLine2;
    }

    public void setHasAttachment(boolean hasAttachment) {
        this.hasAttachment = hasAttachment;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    /*测试*/
   /* public static void main(String arg[]) {
        new homework().upload("D://keyword_num_name.zip", "D://123456789", "keyword");
        new homework().delete("D://123456789.zip");
        new homework().get_filename("D://123456789//123456789.zip");
        new homework().check_format("D://123456789//keyword_学号_姓名.zip");
        new homework().upload("D://lab1_num_name.zip","D://123456789","00",1,131220000);
        new homework().delete_set(3);
        new homework().set_homwork(3,"lab3","lab3","test again","2016/01/01","2016/01/03","2016/01/05");
        new homework().change_set(3,"lab3","lab3","test again1","2016/01/02","2016/01/03","2016/01/05");
        new homework().change("D://lab3_131220000_1234.zip","D://123456789","00",3,131220000);
    }*/

}
