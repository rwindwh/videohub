package router;

import mvc.Router;
import mvc.View;

import java.io.IOException;

public class VideoPlayerRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/video_player", (req, resp) -> {
            try {
                resp.sendRedirect("video_player.jsp");
                //resp.getWriter().println("video_player.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        });

        Router.get("/play", model -> View.create("video_player.jsp"));
    }
}
