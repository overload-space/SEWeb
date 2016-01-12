package Common;

import model.Database;
import model.Student;
import model.StudentMapper;

import java.util.Iterator;
import java.util.List;

/**
 * Created by user on 2016/1/12.
 */
public class StudentDAO {
    public static void updateStudent(Database database, int oldId, Student student){
        String sql="update Student set Name='"+student.getName()+"',Email='"+student.getEmail()+"',Password='"+student.getPassword()+"' where ID="+ oldId;
        database.excute(sql);
    }

    public static Student getStudent(Database database,int id){
        String sql="select * from Student where ID= ?";
        Student student = (Student) database.get(sql,new Object[]{id},new StudentMapper());
        return student;
    }

    public static List<Student> getAdminList(Database database){
        String sql = "select * from Student";
        List <Student> adminList = database.getList(sql,new StudentMapper());

        for (Iterator<Student> iter = adminList.listIterator(); iter.hasNext(); ) {
            Student a = iter.next();
            if (!Student.isAdmin(a.getId())) {
                iter.remove();
            }
        }
        return adminList;
    }

}
