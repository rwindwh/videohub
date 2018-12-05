package router;

import mvc.Router;

import java.io.IOException;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video_player", (req, resp) -> {
            try {
                resp.getWriter().println("index page");
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}
