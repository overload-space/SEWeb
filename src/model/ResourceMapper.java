package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 * Created by Administrator on 2016/1/3.
 */
public class ResourceMapper implements RowMapper<Resource>{
    public Resource mapRow(ResultSet rs, int rowNum) throws SQLException {
        Resource resource=new Resource();
        resource.setId(rs.getInt("ID"));
        resource.setTime(rs.getTimestamp("CreateAt"));
        resource.setFileName(rs.getString("FileName"));
        resource.setDescription(rs.getString("Description"));
        resource.setFileUrl(rs.getString("FileUrl"));
        return resource;
    }
}
