package router;

import mvc.Router;

import java.io.IOException;

public class LoginRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/login", (req, resp) -> {
            try {
                resp.getWriter().println("index page");
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}
