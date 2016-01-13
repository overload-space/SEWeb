package model;

import org.springframework.core.ExceptionDepthComparator;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


import javax.sql.DataSource;
import java.util.List;


public class Database {
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    public DataSource getDataSource() {
        return dataSource;
    }

    public void insert(String sql) {
        jdbcTemplate.update(sql);
    }

    public void excute(String sql) {jdbcTemplate.execute(sql);}

    public Object get (String sql,Object[] args,RowMapper rowMapper){
        return jdbcTemplate.queryForObject(sql,args,rowMapper);
    }

    public List getList (String sql, RowMapper rowMapper){
        return jdbcTemplate.query(sql,rowMapper);
    }

    public boolean exists(String sql) {

        try {
             jdbcTemplate.queryForObject(sql, Integer.class);
        }
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}
