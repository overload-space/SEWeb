package Common;

import model.*;

import java.util.List;

public class HomeworkDAO {
    public static void newHomwork(Database database, Homework homework) {
        String sql = "insert into homework (`homeworkID`, `CreateAt`, `title`, `content`, `deadline`, `delaydeadline1`, `delaydeadline2`, `hasAttachment`) values ('"+homework.getHomeworkID()+"','"+ homework.getCreateAt() +"','"+ homework.getTitle()+"','"+ homework.getContent()+"','"+ homework.getDeadline()+"','"+ homework.getDelayDeadLine1()+"','"+ homework.getDelayDeadLine2()+"',"+ homework.isHasAttachment()+");";
        database.insert(sql);
    }

    public static void newHandin(Database database, Handin handin) {
        String sql = "insert into handin (`studentID`, `homeworkID`, `submitTime`, `attachmentID`) values ('"+handin.getStudentID()+"','"+handin.getHomeworkID()+"','"+handin.getSubmitTime()+"','"+handin.getAttachmentID()+"');";
        database.insert(sql);
    }

    public static void deleteHandin(Database database, Handin handin) {
        String sql = "delete from handin where studentID='" + handin.getStudentID() + "' and homeworkID='" + handin.getHomeworkID() + "';";
        database.excute(sql);
    }

    public static Homework getHomework(Database database, int id) {
        String sql = "select * from homework where homeworkID= ?";
        return  (Homework)database.get(sql,new Object[]{id},new HomeworkMapper());
    }

    public static void updateHomework(Database database, Homework homework) {
        String sql = "update homework set CreateAt='" + homework.getCreateAt() + "', title='" + homework.getTitle() + "', content='" + homework.getContent() + "', deadline='" + homework.getDeadline() + "', delaydeadline1='" + homework.getDelayDeadLine1() + "', delaydeadline2='" + homework.getDelayDeadLine2() + "', hasAttachment=" + homework.isHasAttachment() + " where homeworkID='" + homework.getHomeworkID() + "';";
        database.excute(sql);
    }

    public static void deleteHomework(Database database, int id) {
        String sql = "delete from homework where homeworkID='" + id + "';";
        database.excute(sql);
    }
    
    public static List<Homework> getHomeworkList(Database database){
        String sql = "select * from Homework order by CreateAt DESC";
        return database.getList(sql,new HomeworkMapper());
    }

    public static List<Resource> getAttachmentList(Database database, int id){
        String sql = "select * from resource where HomeworkID = '" + id + "' order by CreateAt DESC";
        return database.getList(sql,new ResourceMapper());
    }

    public static Handin getHandin(Database database, int homeworkID, int studentID){
        String sql="select * from handin where homeworkID= ? and studentID = ?";
        return  (Handin) database.get(sql,new Object[]{homeworkID, studentID},new HandinMapper());
    }
}
