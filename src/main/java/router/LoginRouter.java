package router;

import database.DBTemplate;
import mvc.Router;
import tool.CaptchaGenerator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginRouter implements Registrable {
    static String username1 = null;
    static String password1 = null;

    @Override
    public void registerRouter() {
        Router.get("/checkcode", (request, response) -> {
            CaptchaGenerator cg = CaptchaGenerator.simpleCaptcha(4);
            request.getSession().setAttribute("checkcode", cg.getCaptchaCode());

            try {
                ServletOutputStream sos = response.getOutputStream();
                sos.write(cg.getByteImage());
                sos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        });
        Router.post("/changecheckcode",(request,reponse)->{
            try{
                request.getRequestDispatcher("login.jsp").forward(request,reponse);
            }catch (Exception e)
            {e.printStackTrace();}
        });
        Router.post("/logcheck",(request,response)->{
            try {
                request.setCharacterEncoding("UTF-8");
                String usercheckcode=request.getParameter("checkCode");
                String username=request.getParameter("username");
                String password=request.getParameter("password");
                HttpSession session=request.getSession();
                String severcheckcode=(String)session.getAttribute("checkcode");

                DBTemplate.queryOne("select username,password from videohub_user where username='"+username+"'",result->{
                    username1= result.getString("username");
                    password1= result.getString("password");
                });
                if(severcheckcode.equalsIgnoreCase(usercheckcode)&&username.equals(username1)&&password.equals(password1))
                {
                    response.sendRedirect("/ok");
                }
                else
                {
                    response.sendRedirect("/error");
                }
            }catch (Exception e)
            {e.printStackTrace();}
        });
    }
}
