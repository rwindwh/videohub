import core.Sparrow;
import mvc.Model;
import mvc.Router;
import mvc.View;

public class VideohubLauncher {
    public static void main(String[] args) {

        Router.post("/loginCheck", (Model model) -> {
            String username = (String) model.get("username");
            String password = (String) model.get("password");
            model.set("a","bb");
            return username.equals("a") && password.equals("b")?View.create("/ok"):View.create("/error");
        });
        Router.get("/test", model -> View.create("test.jsp"));
        Sparrow.fly();
    }
}
