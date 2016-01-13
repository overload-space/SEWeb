package Common;

import model.Database;
import model.Student;
import model.StudentMapper;


/**
 * Created by user on 2016/1/12.
 */

import javax.xml.crypto.Data;
import java.util.Iterator;
import java.util.List;

public class StudentDAO {
    public static void newStudent(Database database, Student student){
        String sql="insert into Student (ID, Name, Email, Password, checked, md5token, Level) values ('"+student.getId()+"','"+ student.getName() +"','"+student.getEmail()+"','"+student.getPassword()+"',"+student.isChecked()+",'"+student.getMd5token()+"','"+student.getLevel()+"');";
        database.insert(sql);
    }

    public static void updateStudent(Database database,int oldId,Student student){
        String sql="update Student set ID='"+student.getId()+"', Name='"+ student.getName() +"', Email='"+student.getEmail()+"', Password='"+student.getPassword()+"', checked="+student.isChecked()+",md5token='"+student.getMd5token()+"',Level='"+student.getLevel()+"' where ID="+ oldId;
        database.excute(sql);
    }

    public static void deleteStudent(Database database,int id){
        String sql="delete from Student where ID="+id;
        database.excute(sql);
    }

    public static Student getStudent(Database database,int id){
        String sql="select * from Student where ID= ?";
        Student student = (Student) database.get(sql,new Object[]{id},new StudentMapper());
        return student;
    }


    public static List<Student> getStudentList(Database database){
        String sql = "select * from Student where checked = 1 and Level = 0 order by ID";
        List <Student> StudentList = database.getList(sql,new StudentMapper());
        return StudentList;
    }

    public static List<Student> getNotCheckedStudentList(Database database){
        String sql = "select * from Student where checked = 0 order by ID";
        List <Student> StudentList = database.getList(sql,new StudentMapper());
        return StudentList;
    }

    public static List<Student> getTAList(Database database){
        String sql = "select * from Student where Level = 1 order by ID";
        List <Student> StudentList = database.getList(sql,new StudentMapper());
        return StudentList;
    }
    public static  List<Student> getTeacherAndTAList(Database database) {
        String sql = "select * from Student where Level = 1 or Level=100 order by ID";
        List <Student> StudentList = database.getList(sql,new StudentMapper());
        System.out.println(sql);
        return StudentList;
    }

}
