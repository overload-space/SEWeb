package model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class HomeworkMapper implements RowMapper<Homework> {
    public Homework mapRow(ResultSet rs, int rowNum) throws SQLException {
        Homework Homework = new Homework();
        Homework.setHomeworkID(rs.getInt("homeworkID"));
        Homework.setDeadline(rs.getTimestamp("deadline"));
        Homework.setDelayDeadLine1(rs.getTimestamp("delaydeadline1"));
        Homework.setDelayDeadLine2(rs.getTimestamp("delaydeadline2"));
        Homework.setCreateAt(rs.getTimestamp("CreateAt"));
        Homework.setContent(rs.getString("content"));
        Homework.setTitle(rs.getString("title"));
        Homework.setHasAttachment(rs.getBoolean("hasAttachment"));
        return Homework;
    }
}
