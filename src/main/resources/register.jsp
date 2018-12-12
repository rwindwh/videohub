<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<title>Register</title>
    <link rel="stylesheet" href="css/template.css">
</head>
<body>
<h1 align="center">Please input some messages into the register form！</h1>
<div class="child">
    <form method="post" name="form">
        <div><h1>Username:<input type="text" name="username" style="height: 30px;width: 200px"/><br/></h1>
        <h1>Password :<input type="password" name="password" style="height: 30px;width: 200px"/><br/></h1>
        <h1>Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<input type="email" name="email" style="height: 30px;width: 200px"/><br/></h1></div>
        <div align="center"><h1><input type="submit" value="register" style="font-size: x-large" onclick="form.action='/register'"/> </h1></div>
    </form>
</div>
</body>
