package router;

import mvc.Router;
import mvc.View;

import java.io.IOException;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video_player/*",(request,response)->{
            try{
                String requestURI = request.getRequestURI();
                System.out.println(requestURI);
                request.getRequestDispatcher("/video_player.jsp").forward(request,response);
            }
            catch (Exception e){
                e.printStackTrace();
            }
        });
    }
}
