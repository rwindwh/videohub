package router;

import database.DBTemplate;
import mvc.Router;
import tool.MailWorker;
import util.Encrypted;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class LoginRouter implements Registrable {
    static String username1 = null;
    static String password1 = null;

    @Override
    public void registerRouter() {
        Router.get("/checkcode", (request, response) -> {
            try {
                request.setCharacterEncoding("UTF-8");
                response.setContentType("image/jpeg");
                HttpSession session = request.getSession();
                int width = 60;
                int height = 20;
                response.setHeader("Pragma", "No-cache");
                response.setHeader("Cache-Control", "no-cache");
                response.setDateHeader("Expires", 0);
                BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
                Graphics g = image.getGraphics();
                String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                char[] rands = new char[4];
                for (int i = 0; i < 4; i++) {
                    int rand = (int) (Math.random() * 36);
                    rands[i] = chars.charAt(rand);
                }
                g.setColor(new Color(0xDCDCDC));
                g.fillRect(0, 0, width, height);
                for (int i = 0; i < 120; i++) {
                    int x = (int) (Math.random() * width);
                    int y = (int) (Math.random() * height);
                    int red = (int) (Math.random() * 255);
                    int green = (int) (Math.random() * 255);
                    int blue = (int) (Math.random() * 255);
                    g.setColor(new Color(red, green, blue));
                    g.drawOval(x, y, 1, 0);
                }
                g.setColor(Color.BLACK);
                g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 18));
                g.drawString("" + rands[0], 1, 17);
                g.drawString("" + rands[1], 16, 15);
                g.drawString("" + rands[2], 31, 18);
                g.drawString("" + rands[3], 46, 16);
                g.dispose();
                ServletOutputStream sos = response.getOutputStream();
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                ImageIO.write(image, "JPEG", baos);
                byte[] buffer = baos.toByteArray();
                response.setContentLength(buffer.length);
                sos.write(buffer);
                baos.close();
                sos.close();
                session.setAttribute("checkcode", new String(rands));
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        Router.post("/changecheckcode", (request, reponse) -> {
            try {
                request.getRequestDispatcher("/login.html").forward(request, reponse);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        Router.post("/logcheck", (request, response) -> {
            try {
                request.setCharacterEncoding("UTF-8");
                String usercheckcode = request.getParameter("checkCode");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                HttpSession session = request.getSession();
                String severcheckcode = (String) session.getAttribute("checkcode");
                DBTemplate.query("select username,password from videohub_user where username='" + username + "'", result -> {
                    if(result.next()){
                    username1 = result.getString("username");
                    password1 = result.getString("password");}
                });

                if (username1 != null && password1 != null
                        && severcheckcode.equalsIgnoreCase(usercheckcode)
                        && username.equals(username1)
                        && Encrypted.enryptePassword(password).equals(password1)) {

                    request.getSession().setAttribute("username", username);
                    response.sendRedirect("/index.html");
                } else {
                    response.sendRedirect("/login.html?error=yes");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        Router.post("/register", (request, response) ->
        {
            try {
                request.setCharacterEncoding("UTF-8");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyy-MM-dd HH:mm:ss");
                String Date = simpleDateFormat.format(new Date());
                DBTemplate.query("select username from videohub_user where username=?", new Object[]{username}, result -> {

                    String username2=null;
                    if(result.next())
                    username2 = result.getString("username");
                    if (username2==null) {
                        DBTemplate.insert("insert into videohub_user(username,password,avatar_url,email,point,last_login_time) value(?,?,?,?,?,?)",new Object[]{
                                username, Encrypted.enryptePassword(password), null, email, 200, Date
                        });
                        request.getSession().setAttribute("username", username);

                        try {
                            response.sendRedirect("/index.html");
                        } catch (IOException e) {
                            e.printStackTrace();
                        }

                    } else {
                        try {
                            response.sendRedirect("/signup.html?error=ok");
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                });

            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        Router.post("/sendtheemail", (request, response) ->
        {
            String email = request.getParameter("email");
            char[] captcha = new char[4];
            String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            for (int i = 0; i < 4; i++) {
                int a = (int) (Math.random() * 62);
                captcha[i] = chars.charAt(a);
            }
            String Captcha=String.valueOf(captcha);
            String context ="The captcha is :"+Captcha;
            new MailWorker().sendMailAsync("captcha", context, email);
            try {
                request.getSession().setAttribute("captcha", Captcha);
                request.getSession().setAttribute("email",email);
                response.sendRedirect("/changepassword.html");
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
        Router.post("/changepassword",(request,reponse)->
        {
            String password=request.getParameter("password");
            String password3=request.getParameter("password1");
            String captcha=request.getParameter("captcha");
            String sessioncaptcha=(String)request.getSession().getAttribute("captcha");
            String email=(String)request.getSession().getAttribute("email");
            if(captcha.equals(sessioncaptcha)&&password.equals(password3))
            {
                DBTemplate.update("update videohub_user set password=? where email=?",new Object[]{
                        Encrypted.enryptePassword(password), email
                });
                try {
                    request.getRequestDispatcher("/login.html").forward(request, reponse);
                } catch (ServletException | IOException e) {
                    e.printStackTrace();
                }
            }
            else
            {
                try {
                    reponse.sendRedirect("/changepassword.html?error=yes");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });

    }
}


