package router;

import mvc.Router;
import mvc.View;

import java.io.IOException;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video_player/{videoUrl}/{username}",model -> {
            //model.set("video_id",model.getPathVar("videoUrl"));
            //model.set("username",model.getPathVar("username"));
            return View.create("video_play.jsp");
        });

        Router.get("/play", model -> View.create("video_player.jsp"));
    }
}
