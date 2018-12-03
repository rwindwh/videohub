import core.Sparrow;
import mvc.Router;
import mvc.View;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VideohubLauncher {
    public static void main(String[] args) {
        Router.get("/hello", (HttpServletRequest req, HttpServletResponse resp) -> {
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
