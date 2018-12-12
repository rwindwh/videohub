<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change the password!</title>
    <link rel="stylesheet" href="css/template.css">
</head>
<body>
<div class="child">
    <h1>Please to change your password!</h1>
    <form method="post" name="form">
        <h1>New password:<input type="password" name="password" style="height: 30px;width: 200px"> </h1>
        <h1>Input again:<input type="password" name="password1" style="height: 30px;width: 200px"> </h1>
        <h1>Input captcha:<input type="text" name="captcha" style="height: 30px;width: 200px"> </h1>
        <div align="center"><h1><input type="submit" value="change" style="font-size: x-large" onclick="form.action='/changepassword'"> </h1></div>
    </form>
</div>
</body>
</html>