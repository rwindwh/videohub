 <%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<html>
  <head>
   <% String drivername="com.mysql.jdbc.Driver";
   String username="root";
   String userpwd="";
   String dbname="students";
   String url1="jdbc:mysql://localhost:3306/"+dbname;
   String url2="?user="+username+"&password="+userpwd;
   String url3="&useUnicode=true&characterEncoding=UTF-8";
   String url=url1+url2+url3;
   Class.forName(drivername);
   Connection con=DriverManager.getConnection(url);
   String sql="select * from shipin where category=?";

   PreparedStatement ps=con.prepareStatement(sql);
     ps.setString(1,"dongman");
   ResultSet rs=ps.executeQuery();

   rs.last();
   int rowcount=rs.getRow();
   int pagecount=4;
   String a="true";
   
   String name=(String)session.getAttribute("username");
   int point1=0;
   
   String msg;
   if(name==null){
   a="false";
    msg="你还未登陆，请点击登陆！";
   }
   else{
   msg=name+"登陆成功！";
   String sql3="select * from auser where username=?";
   PreparedStatement ps3=con.prepareStatement(sql3);
   ps3.setString(1,name);
     ResultSet rs3=ps3.executeQuery();
    rs3.beforeFirst();
    while(rs3.next()){
    point1=rs3.getInt("point");
    }
    if(point1>50){
           point1=point1+5;
           String sql4="update auser set point=? where username=?";
           PreparedStatement ps4=con.prepareStatement(sql4);
           ps4.setInt(1, point1);
           ps4.setString(2,name);
           int n=ps4.executeUpdate();
        
           if(n>=1){ 
                    out.println("重写数据成功");
                     a="true";
            }
            else{
                  out.println("重写数据失败");
                  a="false";
             }
      }
 }
   
   
   
   
   

   
   %>  
    <title>视频网站主页面</title>
  
    
    
   <style type="text/css">
    	.block{
    		float:left;
    		width:300px;
    		height:500px;
    		border:solid 1px black;
    		border-radius:5px;
    		margin-left:520px;
    		text-align:center;
    		line-height:60px;
    	}
        body{
        background:url(shipin/beijing.jpg);
        backgroud-size:cover;
        }
        li{
        float:left;
        }
    	</style>
  </head>
  
  <body>
  
  <h1 align="center">视频网站</h1>
 
  
 <h3 align="left"><% out.println(msg);%></h3>
 
   <table >
    
   <tr > <th width="24%"><a href="zhuyemian1.jsp"><font size="5" style="word-spacing:30px;">主页</font></a></th>
 
   <th width="24%"><a href="/movie.jsp"><font size="5">个人中心</font></a></th>
   
   <th width="24%"><font size="5"><a href="/index.jsp"><font size="5">充值中心</font></a></th></font>

   <th width="24%"><a href="/index.jsp"><font size="5">登录</font></a></th>
  
   <th ><a href="/series.jsp"><font size="5">注册</font></th>
  
   </tr>
   </table>
  <br><br><br> 
  <h2 color="red">动漫视频</h2>
     <hr><br><br><br>
 
   

  <%rs.beforeFirst();
  
     while(rs.next()){
    
   		 %>
   	      
   		 <li>
   		 <a href="<%=rs.getString("video_url")%>"  title="<%=rs.getString("video_title")%>" onclick="return <%=a%>">
   		 	<img src="<%=rs.getString("img_url")%>" alt="<%=rs.getString("video_url")%>" width="290" height="290"/>
        	<p align="center"><span style="color:black;"><%=rs.getString("video_title")%></span></p>
        </a>
        </li>
    
        
   		     <%} %>
   		       <%if(rs!=null){rs.close();}
   		        if(ps!=null){ps.close();}
   		      
   		         %>
   		     <br><br><br><br><br>  <br><br><br><br><br>  <br><br><br><br><br> <br><br><br><br><br> <br><br><br><br><br>
   		  <h2 color="red">电影视频</h2>
     <hr><br><br><br>
     <%
  
 

   PreparedStatement ps2=con.prepareStatement(sql);
     ps2.setString(1,"dianying");
   ResultSet rs2=ps2.executeQuery();

   rs2.last();
     rs2.beforeFirst();
     while(rs2.next()){
   		 %>
   	
   		 <li>
   		 <a href="<%=rs2.getString("video_url")%>"  title="<%=rs2.getString("video_title")%>" onclick="return <%=a%>">
   		 	<img src="<%=rs2.getString("img_url")%>" alt="<%=rs2.getString("video_url")%>" width="290" height="290" />
        	<p align="center"><span style="color:black;"><%=rs2.getString("video_title")%></span></p>
        </a>
        </li>
     
   		     <%} %>
   		       <%if(rs2!=null){rs.close();}
   		        if(ps2!=null){ps.close();}
   		        if(con!=null){con.close();}
   		         %>     
  </body>
</html>
