package router;

import database.DBTemplate;
import mvc.Router;
import mvc.View;

import java.io.IOException;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video_player/*",(request,response)->{
            try{
                String requestURI = request.getRequestURI();
                String id = requestURI.substring(requestURI.lastIndexOf("/")+1);
                System.out.println(requestURI);
                DBTemplate.query("select * from videohub_resources where id='" + id + "'",result -> {
                    if(result.next()){
                        String video_url = result.getString("video_url");
                        System.out.println(video_url);
                        request.setAttribute("video_url",video_url);
                    }
                });
                request.getRequestDispatcher("/video_player.jsp").forward(request,response);
            }
            catch (Exception e){
                e.printStackTrace();
            }
        });
    }
}
