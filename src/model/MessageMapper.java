package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 * Created by Administrator on 2016/1/2.
 */
public class MessageMapper implements RowMapper<Message>{
    public Message mapRow(ResultSet rs, int rowNum) throws SQLException {
        Message message = new Message();
        message.setId(rs.getInt("ID"));
        message.setTime(rs.getTimestamp("CreateAt"));
        message.setSubject(rs.getString("Title"));
        message.setContent(rs.getString("Content"));
        message.setImportant(rs.getBoolean("Important"));
        message.setRead(rs.getBoolean("IsRead"));
        return message;
    }
}
