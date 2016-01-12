package model;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class HandinMapper implements RowMapper<Handin> {
    public Handin mapRow(ResultSet rs, int rowNum) throws SQLException {
        Handin handin=new Handin();
        handin.setHomeworkID(rs.getInt("homeworkID"));
        handin.setStudentID(rs.getInt("studentID"));
        handin.setAttachmentID(rs.getInt("attachmentID"));
        handin.setSubmitTime(rs.getTimestamp("submitTime"));
        return handin;
    }
}
