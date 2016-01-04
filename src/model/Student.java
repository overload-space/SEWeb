package model;

import java.util.Arrays;

public class Student {
    private String id;
    private String name;
    private String email;
    private String password;
    private int checked;
    private String md5token;

    public Student() {

    }
    public  static boolean isAdmin(String amount) {
        System.out.println("admin: "+amount);
        String[] admin_amount={"1","2","3","4"};
        if(Arrays.asList(admin_amount).contains(amount)) {
            return true;
        }
        else {
            return false;
        }
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public int getChecked() {return checked;}

    public String getMd5token() {return md5token;}

    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setChecked(int c) {this.checked=c;}

    public void setMd5token(String md5token) {this.md5token=md5token;}
}
