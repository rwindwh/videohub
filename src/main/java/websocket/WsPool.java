package websocket;

import org.java_websocket.WebSocket;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public class WsPool {
    private static final Map<WebSocket, String> wsUserMap = new ConcurrentHashMap<>();

    public static String getUserByWs(WebSocket conn) {
        return wsUserMap.get(conn);
    }

    public static WebSocket getWsByUser(String userName) {
        Set<WebSocket> keySet = wsUserMap.keySet();
        synchronized (WsPool.class) {
            for (WebSocket conn : keySet) {
                String cuser = wsUserMap.get(conn);
                if (cuser.equals(userName)) {
                    return conn;
                }
            }
        }
        return null;
    }

    public static void addUser(String userName, WebSocket conn) {
        wsUserMap.put(conn, userName);
    }

    public static Collection<String> getOnlineUser() {
        Collection<String> setUser = wsUserMap.values();
        return new ArrayList<>(setUser);
    }

    public static void removeUser(WebSocket conn) {
        wsUserMap.remove(conn);
    }

    public static void sendMessageToUser(WebSocket conn, String message) {
        if (null != conn && null != wsUserMap.get(conn)) {
            conn.send(message);
        }
    }

    public static void sendMessageToAll(String message) {
        Set<WebSocket> keySet = wsUserMap.keySet();
        synchronized (WsPool.class) {
            for (WebSocket conn : keySet) {
                String user = wsUserMap.get(conn);
                if (user != null) {
                    conn.send(message);
                }
            }
        }
    }

}