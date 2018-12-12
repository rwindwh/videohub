<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Reset the your password</title>
</head>
<body>
<div>
    <form method="post">
        <h1>Please input your email:<input type="email" name="email"></h1>
        <input type="submit" value="Get the captcha" onclick="/sendtheemail">
    </form>
    <form method="post">
        <h1>The captcha is:<input type="text" name="captcha"></h1>
        <h1>The new password is :<input type="password" name="newpassword"></h1>
        <h1>Please input new password again:<input type="password" name="newpassword1"></h1>
        <input type="submit" value="Change the password" onclick="/changethepassword">
    </form>
</div>
</body>
</html>