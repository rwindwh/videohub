package domain;

import java.util.Date;

public class User {
    private String username=null;
    private String password=null;
    private String email=null;
    private Date last_login_time=null;
    private long point=0;
    private String avatar_url;
    public String getUsername()
    {
        return username;
    }
    public void setUsername(String username)
    {
        this.username=username;
    }
    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public Date getLast_login_time() {
        return last_login_time;
    }

    public long getPoint() {
        return point;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setLast_login_time(Date last_login_time) {
        this.last_login_time = last_login_time;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getAvatar_url() {
        return avatar_url;
    }

    public void setAvatar_url(String avatar_url) {
        this.avatar_url = avatar_url;
    }
}
