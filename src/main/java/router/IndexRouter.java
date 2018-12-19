package router;

import mvc.Router;
import mvc.View;

public class IndexRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/index", model -> {
            model.set("test", "sunshine");
            return View.create("index.html", model);
        });
    }
}
