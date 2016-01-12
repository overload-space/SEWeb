package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 * Created by Administrator on 2016/1/3.
 */
public class StudentMapper implements RowMapper<Student>{
    public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
        Student student=new Student();
        student.setId(String.valueOf(rs.getInt("ID")));
        student.setName(rs.getString("Name"));
        student.setEmail(rs.getString("Email"));
        student.setPassword(rs.getString("Password"));
        student.setChecked(rs.getInt("checked"));
        student.setMd5token(rs.getString("md5token"));
        return student;
    }
}
