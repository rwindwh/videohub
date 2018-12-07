import core.Sparrow;
import router.*;
import websocket.WsServer;

public class VideohubLauncher {
    public static void main(String[] args) {
        new WsServer(8887).start();

        new PayRouter().registerRouter();
        new IndexRouter().registerRouter();
        new LoginRouter().registerRouter();
        new VideoPlayerRouter().registerRouter();
        new UserRouter().registerRouter();

        Sparrow.fly();
    }
}
