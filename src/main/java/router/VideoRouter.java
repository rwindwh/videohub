package router;

import database.DBTemplate;
import mvc.Router;
import mvc.View;

public class VideoRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/player/{vid}", model -> {
//            if (model.get("username") == null) {
//                model.set("videos", DBAux.getCategoriedMap());
//                return View.create("/login.html?error=yes", model);
//            }

            String pathVar = model.getPathVar("vid");
            try {
                int vid = Integer.parseInt(pathVar.replace(".mp4", ""));
                DBTemplate.query("select video_url,video_title from videohub_resource where id=?",
                        new Object[]{vid}, result -> {
                            if (result.next()) {
                                String url = result.getString("video_url");
                                String title = result.getString("video_title");
                                model.set("video_url", url);
                                model.set("title", title);
                            } else {
                                model.set("video_url", "-1");
                            }
                        });
            } catch (NumberFormatException e) {
                // DO NOTHING
            }

            if (!model.get("video_url").equals("-1")) {
                return View.create("/player.html", model);
            } else {
                return View.create("/404.html");
            }
        });
    }
}
