package websocket;

import org.java_websocket.WebSocket;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

import java.net.InetSocketAddress;

public class WsServer extends WebSocketServer {
    public WsServer(int port) {
        super(new InetSocketAddress(port));
    }

    public WsServer(InetSocketAddress address) {
        super(address);
    }

    @Override
    public void onOpen(WebSocket conn, ClientHandshake handshake) {
    }

    @Override
    public void onClose(WebSocket conn, int code, String reason, boolean remote) {
        userLeave(conn);
        System.out.println(reason);
    }

    @Override
    public void onMessage(WebSocket conn, String message) {
        System.out.println("websocket message:" + message);
        if (null != message && message.startsWith("join")) {
            // TODO:SUBTLE ERROR
            String userName = message.replaceFirst("join", message);
            userJoin(conn, userName);
        } else if (null != message && message.startsWith("leave")) {
            userLeave(conn);
        }
        WsPool.sendMessageToAll(message);
    }

    @Override
    public void onError(WebSocket conn, Exception ex) {
        System.out.println("on error");
        ex.printStackTrace();
    }

    private void userLeave(WebSocket conn) {
        WsPool.removeUser(conn);
    }

    private void userJoin(WebSocket conn, String userName) {
        WsPool.addUser(userName, conn);
    }

}