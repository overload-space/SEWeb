package model;

import org.springframework.jdbc.datasource.DataSourceUtils;
import java.sql.*;
import java.util.ArrayList;

/**
 * Created by user on 2016/1/1.
 */


public class Message {

    private Timestamp time;
    private String subject;
    private String content;
    private int id;
    private boolean important;
    private boolean read;

    public Message() {

    }

    public Message(String subject, String content) {
        this.subject = subject;
        this.content = content;
        time = new Timestamp(System.currentTimeMillis());
        id = time.hashCode();
        read = false;
        important = false;
    }

    public void insert(Database db) {
        String sql = "INSERT INTO SEWeb.Message (`ID`, `Subject`, `Content`, `Time`, `Read`, `Important`) VALUE ('" + id + "','" +
                 subject + "', '" + content + "', '" + time + "', " + read + ", " + important + ");";
         db.excute(sql);
    }
    public  void update(Database db,int id, String colunm, String text) {
        String sql = "UPDATE SEWeb.Message SET `" + colunm + "` = '" + text + "' WHERE ID = '" + id + "';";
        db.insert(sql);
    }

    public  void mark(Database db,int id, String colunm, boolean stat) {
        String sql = "UPDATE SEWeb.Message SET `" + colunm + "` = " + stat + " WHERE ID = '" + id + "';";
        db.excute(sql);
    }

    public  void delete(Database db,int id) {
        String sql = "DELETE FROM SEWeb.Message WHERE ID = '" + id + "';";
        db.excute(sql);
    }


    private void setMessageFromDB(ResultSet resultSet) throws SQLException{
        setId(resultSet.getInt("ID"));
        setSubject(resultSet.getString("Subject"));
        setContent(resultSet.getString("Content"));
        setTime(resultSet.getTimestamp("Time"));
        setRead(resultSet.getBoolean("Read"));
        setImportant(resultSet.getBoolean("Important"));
    }

    public static ArrayList<Message> getAllMessages(Database db) throws SQLException {
        Connection con = DataSourceUtils.getConnection(db.getDataSource()); // your datasource
        Statement s = con.createStatement();

        String sql = "SELECT * FROM SEWeb.Message  order by Time DESC";
        ResultSet resultSet = s.executeQuery(sql); // your query
        if (!resultSet.next()) {
            resultSet = null;
        }

        ArrayList<Message> result = new ArrayList<>();
        if (resultSet == null) {
            return result;
        }
        try {
            while (!resultSet.isAfterLast()) {
                Message message = new Message();
                message.setMessageFromDB(resultSet);
                result.add(message);
                resultSet.next();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public static Message getMessage(Database db,int id) throws SQLException {
        Connection con = DataSourceUtils.getConnection(db.getDataSource()); // your datasource
        Statement s = con.createStatement();
        String sql = "SELECT * FROM SEWeb.Message where ID="+id+";";


        ResultSet resultSet = s.executeQuery(sql); // your query
        if (!resultSet.next()) {
            resultSet = null;
        }

        Message message=new Message();
        try {
            message.setMessageFromDB(resultSet);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return message;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public void setRead(boolean read) {
        this.read = read;
    }

    public void setImportant(boolean important) {
        this.important = important;
    }
    public int getId() {
        return id;
    }
    public String getSubject() {
        return subject;
    }

    public String getContent() {
        return content;
    }

    public Timestamp getTime() {
        return time;
    }

    public boolean isRead() {
        return read;
    }

    public boolean isImportant() {
        return important;
    }

}
