package router;

import database.DBTemplate;
import mvc.Router;
import mvc.View;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video_player/*", model -> {
            DBTemplate.query("select * from videohub_resource where id=1", result -> {
                if (result.next()) {
                    String video_url = result.getString("video_url");
                    model.set("video_url", video_url);
                }
            });
            return View.create("/video_play.html");
        });
    }
}
