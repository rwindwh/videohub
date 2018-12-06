import core.Sparrow;
import router.*;

public class VideohubLauncher {
    public static void main(String[] args) {
        new PayRouter().registerRouter();
        new IndexRouter().registerRouter();
        new LoginRouter().registerRouter();
        new VideoPlayerRouter().registerRouter();
        new UserRouter().registerRouter();
        Sparrow.fly();
    }
}
