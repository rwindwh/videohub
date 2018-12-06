package router;

import mvc.Router;

import java.io.IOException;

public class PayRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/charge", (req, resp) -> {
            try {
                resp.getWriter().println("charge page");
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}
