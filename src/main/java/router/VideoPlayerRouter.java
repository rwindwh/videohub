package router;

import database.DBTemplate;
import mvc.Router;
import mvc.View;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video/{vid}", model -> {
            if(model.get("username,")!=null){
                return View.create("/index.html",model);
            }

            String pathVar = model.getPathVar("vid");
            try {
                int vid = Integer.parseInt(pathVar);
                DBTemplate.query("select * from videohub_resource where id=?",
                        new Object[]{vid}, result -> {
                            if (result.next()) {
                                String video_url = result.getString("video_url");
                                String video_id = result.getString("video_title");
                                model.set("video_url", video_url);
                                model.set("video_id", video_id);
                            }
                        });
            } catch (NumberFormatException e) {
                // DONOTHING
            }
            return View.create("/video_player.html", model);

        });
    }
}
