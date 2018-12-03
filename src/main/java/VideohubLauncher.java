import core.Sparrow;
import mvc.Router;
import mvc.View;

import java.io.IOException;

public class VideohubLauncher {
    public static void main(String[] args) {
        Router.get("/hello", (req, resp) -> {
            try {
                resp.getWriter().println("<p color=\"blue\">Hello videohub</p>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        Router.get("/test", model -> View.create("test.jsp"));
        Sparrow.fly();
    }
}
