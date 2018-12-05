package router;

import mvc.Router;

import java.io.IOException;

public class IndexRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/index", (req, resp) -> {
            try {
                resp.getWriter().println("index page");
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}
