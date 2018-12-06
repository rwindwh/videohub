<%@ page import="domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Profile</title>
</head>
<body>
   <div align="center">
       <img src="/image/1.jpg"><br>
       <a href="/changepicture">切换头像</a>
   </div>
   <hr width="100%" size="1">
   <hr width="100%" size="1" >
   <div align="center">
       <h1>Your massage is here :</h1>
       <h1>Username:<%=((User)request.getAttribute("result")).getUsername()%></h1>
       <h1>Email:<%=((User)request.getAttribute("result")).getEmail()%></h1>
       <h1>Point:<%=((User)request.getAttribute("result")).getPoint()%></h1>
       <h1>Last login time:<%=((User)request.getAttribute("result")).getLast_login_time()%></h1>
   </div>
   <hr width="100%" size="1">
   <hr width="100%" size="1" >
   <div align="center" style="" >
       <a href="/invest.jsp">invest</a>
   </div>

</body>