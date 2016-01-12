package model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentMapper implements RowMapper<Student> {
    public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
        Student student = new Student();
        student.setId(rs.getInt("ID"));
        student.setName(rs.getString("Name"));
        student.setPassword(rs.getString("Password"));
        student.setEmail(rs.getString("Email"));
        student.setMd5token(rs.getString("md5token"));
        student.setChecked(rs.getBoolean("checked"));
        student.setLevel(rs.getInt("Level"));
        return student;
    }
}
