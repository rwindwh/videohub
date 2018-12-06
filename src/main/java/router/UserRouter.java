package router;

import database.DBTemplate;
import domain.User;
import mvc.Router;



public class UserRouter implements Registrable {

    @Override
    public void registerRouter() {
        Router.get("/profile",(request,response)->{
            try{
                request.setCharacterEncoding("UTF-8");
                String username=(String)request.getSession().getAttribute("username");
                User user=DBTemplate.queryOne("select * from videohub_user where username=?",new Object[]{username},User.class);
                request.setAttribute("result",user);
                request.getRequestDispatcher("/profile.jsp").forward(request,response);

            }catch (Exception e)
            {
                e.printStackTrace();
            }
        });
    }
}
