package util;

import sun.misc.BASE64Encoder;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encrypted {
    public static String enryptePassword(String password) {
        byte[] oldBytes = password.getBytes();
        String newStr = null;
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
            byte[] newBytes = md.digest(oldBytes);
            BASE64Encoder encoder = new BASE64Encoder();
            newStr = encoder.encode(newBytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return newStr;
    }

}
