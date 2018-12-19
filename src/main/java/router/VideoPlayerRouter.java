package router;

import database.DBTemplate;
import mvc.Router;
import mvc.View;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video_player/*", (request,response) -> {
            try{
                String requestURI = request.getRequestURI();
                String id = requestURI.substring(requestURI.lastIndexOf("/")+1);
                DBTemplate.query("select * from videohub_resource where id='" + id + "'",result -> {
                    if(result.next()){
                        String video_url = result.getString("video_url");
                        String video_id = result.getString("video_title");
                        request.setAttribute("video_url",video_url);
                        request.setAttribute("video_id",video_id);
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
