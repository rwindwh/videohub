package router;

import mvc.Router;
import mvc.View;

import java.io.IOException;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video_player/{videoUrl}",model -> {
            model.set("videoUrl",model.getPathVar("videoUrl"));
            return View.create("video_play.jsp");
        });
        Router.get("/play", model -> View.create("video_player.jsp"));
    }
}
