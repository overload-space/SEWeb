package model;

import org.springframework.core.ExceptionDepthComparator;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

public class Database {
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplate;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void insert(String sql) {
        jdbcTemplate.update(sql);
    }

    public void excute(String sql) {jdbcTemplate.execute(sql);}

    public boolean exists(String sql) {

        try {
             jdbcTemplate.queryForObject(sql, Integer.class);
        }
        catch (Exception e) {
            //e.printStackTrace();
            return false;
        }

        return true;
    }
}
