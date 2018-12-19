package router;

import database.OrmTemplate;
import domain.User;
import mvc.Router;

import java.io.IOException;


public class UserRouter implements Registrable {

    @Override
    public void registerRouter() {
        Router.get("/quit",(request,response)->{
            request.getSession().invalidate();
            try {
                response.sendRedirect("/login.html");
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        Router.get("/profile",(request,response)->{
            String username = (String) request.getSession().getAttribute("username");
            if(username!=null) {
                try {
                    request.setCharacterEncoding("UTF-8");
                    User user = OrmTemplate.queryOne("select * from videohub_user where username='" + username + "'", User.class);
                    request.setAttribute("results", user);
                    request.getRequestDispatcher("/profile.html").forward(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            else
                try {
                   response.sendRedirect("/login.html");
                }catch (Exception e)
                {
                    e.printStackTrace();
                }
        });

    }
}
