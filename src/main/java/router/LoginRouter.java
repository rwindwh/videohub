package router;

import mvc.Router;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class LoginRouter implements Registrable {
    @Override
    public void registerRouter() {
        Router.get("/", (request, response) -> {
            try {
                request.setCharacterEncoding("UTF-8");
                response.setContentType("image/jpeg");
                HttpSession session=request.getSession();
                int width=60;
                int height=20;
                response.setHeader("Pragma","No-cache");
                response.setHeader("Cache-Control","no-cache");
                response.setDateHeader("Expires",0);
                BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
                Graphics g=image.getGraphics();
                String chars="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                char[] rands=new char[4];
                for(int i=0;i<4;i++)
                {
                    int rand=(int)(Math.random()*36);
                    rands[i]=chars.charAt(rand);
                }
                g.setColor(new Color(0xDCDCDC));
                g.fillRect(0,0,width,height);
                for(int i=0;i<120;i++)
                {
                    int x=(int)(Math.random()*width);
                    int y=(int)(Math.random()*height);
                    int red=(int)(Math.random()*255);
                    int green=(int)(Math.random()*255);
                    int blue=(int)(Math.random()*255);
                    g.setColor(new Color(red,green,blue));
                    g.drawOval(x,y,1,0);
                }
                g.setColor(Color.BLACK);
                g.setFont(new Font(null,Font.ITALIC|Font.BOLD,18));
                g.drawString(""+rands[0],1,17);
                g.drawString(""+rands[1],16,15);
                g.drawString(""+rands[2],31,18);
                g.drawString(""+rands[3],46,16);
                g.dispose();
                ServletOutputStream sos=response.getOutputStream();
                ByteArrayOutputStream baos=new ByteArrayOutputStream();
                ImageIO.write(image,"JPEG",baos);
                byte[] buffer=baos.toByteArray();
                response.setContentLength(buffer.length);
                sos.write(buffer);
                baos.close();
                sos.close();
                session.setAttribute("checkcode",new String(rands));
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
    }
}
