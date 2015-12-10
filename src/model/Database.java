package model;

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
}
