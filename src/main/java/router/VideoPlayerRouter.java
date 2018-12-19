package router;

import database.DBTemplate;
import mvc.Router;
import mvc.View;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video_player/{vid}", model -> {
            DBTemplate.query("select * from videohub_resource where id=?",
                    new Object[]{model.getPathVar("vid")}, result -> {
                        if (result.next()) {
                            String video_url = result.getString("video_url");
                            String video_id = result.getString("video_title");
                            model.set("video_url", video_url);
                            model.set("video_id", video_id);
                        }
                    });
            return View.create("/video_player.html", model);

        });
    }
}
