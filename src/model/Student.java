package model;

public class Student {
    private int id;
    private String name;
    private String email;
    private String password;
    private boolean checked;
    private String md5token;
    private int level;

    public Student() {

    }
    public boolean isAdmin() {
        return level > 0;
    }

    public int getId() {
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

    public boolean isChecked() {
        return checked;
    }

    public String getMd5token() {return md5token;}

    public int getLevel() {
        return level;
    }

    public void setId(int id) {
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

    public void setChecked(boolean c) {this.checked=c;}

    public void setMd5token(String md5token) {this.md5token=md5token;}

    public void setLevel(int level) {
        this.level = level;
    }
}