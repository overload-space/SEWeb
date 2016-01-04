package Common;

import model.Database;
import model.Message;
import model.MessageMapper;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2016/1/3.
 */
public class MessageDAO {
    public static void sendMessage(Database database, Message message){
        String sql="insert into Message (ID, CreateAt, Title, Content, Important, IsRead) values ("+message.getId()+",'"+ message.getTime() +"','"+message.getSubject()+"','"+message.getContent()+"',"+message.isImportant()+","+message.isRead()+")";
        database.insert(sql);
    }
    public static void updateMessage(Database database,int oldId,Message newMessage){
        String sql="update Message set ID="+newMessage.getId()+",CreateAt='"+newMessage.getTime()+"',Title='"+newMessage.getSubject()+"',Content='"+newMessage.getContent()+"',Important="+newMessage.isImportant()+",IsRead="+newMessage.isRead()+" where ID="+ oldId;
        database.excute(sql);
    }
    public static void deleteMessage(Database database,int id){
        String sql="delete from Message where ID="+id;
        database.excute(sql);
    }
    public static Message getMessage(Database database,int id){
        String sql="select * from Message where ID= ?";
        Message message = (Message)database.get(sql,new Object[]{id},new MessageMapper());
        return message;
    }
    public static List<Message> getMessageList(Database database){
        String sql = "select * from Message order by CreateAt DESC";
        List <Message> MessageList = database.getList(sql,new MessageMapper());
        return MessageList;
    }
    //test
    public static void main(String[] args){
        Database database = (Database)new FileSystemXmlApplicationContext("/web/WEB-INF/SEWeb-servlet.xml").getBean("database");
        //Message message=new Message("ttt","ttt");
        List <Message> list=MessageDAO.getMessageList(database);
    }
}

