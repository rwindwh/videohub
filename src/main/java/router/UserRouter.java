package router;

import mvc.Router;

import java.io.IOException;

public class UserRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/user", (req, resp) -> {
            try {
                resp.getWriter().println("index page");
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}
