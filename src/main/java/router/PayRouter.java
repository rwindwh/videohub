package router;

import mvc.Router;
import mvc.View;

public class PayRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/pay", model -> {
            if (model.get("username") == null) {
                return View.create("/login.html?error=yes");
            }
            return View.create("/pay.html");
        });
    }
}
