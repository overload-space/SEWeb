package Common;

import java.io.*;

/**
 * Created by Vincent Huang on 2016/1/1.
 */


public class upload_homework {

    /*获取文件名*/
    public String get_filename(String target){
        File tempFile =new File( target.trim());
        String fileName = tempFile.getName();
        return fileName;
    }

    /*以“keyword_学号_姓名.zip”的格式上传作业*/
    public boolean check_format(String name,String keyword){
        String[] s1 = name.split("\\.");//表示用.去切割字符串
        String[] s2 = name.split("\\_");//表示用_去切割字符串
        String form= "."+s1[s1.length-1];//用.连接最后一个字符
        if(form.equals(".zip")&&s2.length==3&&s2[0].equals(keyword))
        {
            System.out.println("格式正确");
            return true;
        }
        else
        {
            System.out.println("格式错误");
            return false;
        }
    }

    /*上传作业,target为文件位置，destination为需要存入的文件夹目录，keyword为作业文件要求格式，delay为延迟次数（以00,01,02记录）*/
    public void upload(String target, String destination,String keyword,String delay){
        try {
            int bytesum = 0;
            int byteread = 0;
            File oldfile = new File(target);
            if (oldfile.exists()) { //文件存在时
                InputStream inStream = new FileInputStream(target); //读入原文件
                String name=get_filename(target);
                if(check_format(name,keyword))
                {
                    File file;
                    if(delay.equals("00")) {
                        file = new File(destination + "//" + keyword);
                        destination=destination+"//"+keyword+"//"+name;
                    }
                    else if(delay.equals("01")) {
                        file = new File(destination + "//" + keyword+"_"+delay);
                        destination=destination+"//"+keyword+"_"+delay+"//"+name;
                    }
                    else if(delay.equals("02")) {
                        file = new File(destination + "//" + keyword + "_" + delay);
                        destination=destination+"//"+keyword+"_"+delay+"//"+name;
                    }
                    else{
                        file = new File(target);
                        destination=target;
                    }
                    //如果文件夹不存在则创建
                    if  (!file .exists()  && !file .isDirectory()) {
                        System.out.println("不存在,创建文件夹");
                        file.mkdir();
                    }
                    FileOutputStream fs = new FileOutputStream(destination);
                    byte[] buffer = new byte[1024 * 5];
                    int length;
                    while ((byteread = inStream.read(buffer)) != -1) {
                        bytesum += byteread; //字节数 文件大小
                        System.out.println(bytesum);
                        fs.write(buffer, 0, byteread);
                    }
                    inStream.close();
                }
            }
        }
        catch (Exception e) {
            System.out.println("复制文件操作出错");
            e.printStackTrace();
        }
    }

    /*删除作业*/
    public void delete(String target){
         File  file = new File(target);
        // 路径为文件且不为空则进行删除
        if (file.isFile() && file.exists()) {
            file.delete();
        }
        else{
            System.out.println("删除文件操作出错");
        }
    }

    /*替换当前作业*/
    public void change(String target,String destination,String keyword,String delay){
        delete(destination+"//"+keyword+"//"+get_filename(target));
        upload(target,destination,keyword,delay);
    }

    /*测试*/
    public static void main(String arg[]) {
        /*new upload_homework().upload("D://keyword_num_name.zip", "D://123456789", "keyword");
        new upload_homework().delete("D://123456789.zip");
        new upload_homework().get_filename("D://123456789//123456789.zip");
        new upload_homework().check_format("D://123456789//keyword_学号_姓名.zip");*/
        new upload_homework().upload("D://keyword_num_name.zip","D://123456789","keyword","01");
    }

}
