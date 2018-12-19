package router;

import core.PropertiesHolder;
import database.DBTemplate;
import database.OrmTemplate;
import domain.User;
import mvc.Router;
import mvc.View;

public class VideoRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/player/{vid}", model -> {
            if (model.get("username") == null) {
                return View.create("/login.html?error=yes");
            }

            int requirePoint = Integer.parseInt(PropertiesHolder.readProp("video.point"));

            User u = OrmTemplate.queryOne("select * from videohub_user where username=?", new String[]{(String) model.get("username")}, User.class);

            if (u.getPoint() >= requirePoint) {
                DBTemplate.update("update videohub_user set point = " +
                        ((u.getPoint() - requirePoint) >= 0 ? (u.getPoint() - requirePoint) : 0) +
                        " where username='" + (String) model.get("username") + "'");
            } else {
                return View.create("/pay");
            }

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

            if (model.get("video_url") != null && !model.get("video_url").equals("-1")) {
                return View.create("/vplayer.html", model);
            } else {
                return View.create("/404.html");
            }
        });
    }
}
