package router;

import mvc.Router;
import mvc.View;

public class IndexRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/", model -> View.create("index.html"));
    }
}
