package router;

import database.OrmTemplate;
import domain.User;
import mvc.Router;
import mvc.View;

import java.io.IOException;
import java.util.List;


public class UserRouter implements Registrable {

    @Override
    public void registerRouter() {
        Router.get("/quit",(request,response)->{
            request.getSession().removeAttribute("username");
            try {
                response.sendRedirect("/login.html");
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        Router.get("/profile", model -> {
            if (null != model.get("username")) {
                List<User> users = OrmTemplate.queryList("select * from videohub_user where username=?",
                        new String[]{(String) model.get("username")}, User.class);
                model.set("results", users);
                System.out.println(users);
                return View.create("/profile.html", model);
            } else {
                return View.create("/login.html");
            }
        });

//        Router.get("/profile",(request,response)->{
//            String username = (String) request.getSession().getAttribute("username");
//            if(username!=null) {
//                try {
//                    request.setCharacterEncoding("UTF-8");
//                    User user = OrmTemplate.queryOne("select * from videohub_user where username='" + username + "'", User.class);
//                    request.setAttribute("results", user);
//                    request.getRequestDispatcher("/profile.html").forward(request, response);
//
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//            else
//                try {
//                   response.sendRedirect("/login.html");
//                }catch (Exception e)
//                {
//                    e.printStackTrace();
//                }
//        });

    }
}
