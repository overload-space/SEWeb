package Common;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class SendEmail
{
  
    public SendEmail( String _to,String _emailContent) {
        String to = _to;
        String from ="xxx@xxx.com";
        String host = "smtp.qq.com"; 					 //QQ邮件服务器

        Properties properties = System.getProperties();

        properties.setProperty("mail.smtp.host", host);

        properties.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication()
            {
                return new PasswordAuthentication(from, "password");
            }
        });

        try{
            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress(from));

            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));

            message.setSubject("Mail send by java!");				// 邮件标题

            message.setText(_emailContent);

            Transport.send(message);

        }catch (MessagingException mex) {
            mex.printStackTrace();
           // System.out.println(from+" "+_password);
        }
    }

    // 测试
    public  static void main(String[] args) throws Exception {
        new SendEmail("xxx@xxx.com","content");

    }

}