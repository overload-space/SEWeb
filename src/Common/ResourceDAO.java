package Common;

import model.Database;
import model.Resource;
import model.ResourceMapper;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import java.util.List;

/**
 * Created by Administrator on 2016/1/3.
 */
public class ResourceDAO {
    public static void sendResource(Database database, Resource resource){
        String sql="insert into resource (ID, CreateAt, FileName, Description, FileUrl, HomeworkID) values ("+resource.getId()+",'"+ resource.getTime() +"','"+resource.getFileName()+"','"+resource.getDescription()+"','"+resource.getFileUrl()+"','"+resource.getHomeworkID()+"');";
        database.insert(sql);
    }
    public static void updateResource(Database database,int oldId,Resource newResource){
        String sql="update resource set ID="+newResource.getId()+",CreateAt='"+newResource.getTime()+"',FileName='"+newResource.getFileName()+"',Description='"+newResource.getDescription()+"',FileUrl='"+newResource.getFileUrl()+"' where ID="+ oldId;
        database.excute(sql);
    }
    public static void deleteResource(Database database,int id){
        String sql="delete from resource where ID="+id;
        database.excute(sql);
    }
    public static Resource getResource(Database database,int id){
        String sql="select * from resource where ID= ?";
        Resource resource = (Resource) database.get(sql,new Object[]{id},new ResourceMapper());
        return resource;
    }
    public static List<Resource> getResourceList(Database database){
        String sql = "select * from resource where HomeworkID = '0' order by CreateAt DESC";
        List <Resource> ResourceList = database.getList(sql,new ResourceMapper());
        return ResourceList;
    }
    //test
    public static void main(String[] args){
        Database database = (Database)new FileSystemXmlApplicationContext("/web/WEB-INF/SEWeb-servlet.xml").getBean("database");
        //Resource resource=new Resource("bbb","bbb","bbb");
        List <Resource> list=ResourceDAO.getResourceList(database);
    }
}
