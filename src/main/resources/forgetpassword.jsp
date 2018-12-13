<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Reset the your password</title>
    <link rel="stylesheet" href="css/template.css">
</head>
<body>
<div class="child">
    <form method="post" name="form">
        <h1>Please input your email:<input type="email" name="email" style="height: 30px;width: 200px"></h1>
        <div align="center"><h1><input type="submit" value="Get the captcha"  style="font-size: x-large" onclick="form.action='/sendtheemail'"></h1></div>
    </form>
</div>
</body>
</html>
