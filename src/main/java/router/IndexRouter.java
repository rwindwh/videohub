package router;

import mvc.Router;

public class IndexRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/index", (req, resp) -> {
        });
    }
}
