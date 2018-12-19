package router;

import mvc.Router;
import mvc.View;
import util.DBAux;

public class IndexRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/index.html", model -> {
            model.set("videos", DBAux.getCategoriedMap());
            return View.create("index.html", model);
        });
    }
}
