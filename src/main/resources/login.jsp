<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Login</title>
<style>

    .child {
        position: absolute;
        top: 50%;
        left: 50%;
        margin-top: -100px;
        margin-left: -200px;
    }

</style>
<div class="child">
<form action="/loginCheck" method="post">
    <h1>Username: <label><input style="height: 30px;width: 200px" name="username" type="text"/></label><br/></h1>
    <h1>&nbsp;Password: <label><input style="height: 30px;width: 200px"name="password" type="password" /></label><br/></h1>
    <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email: <label><input style="height: 30px;width: 200px"name="email" type="email"/></label><br/></h1>
    <h1>Captcha:<lable><input type="text" name="checkCode"/>
    <img border="0" src="checkcode"/><input type="submit" value="换一张" onclick="form1.action='changecheckcode'">
    </lable><br/></h1>
    <div align="center"><h1><label><input  value="login" type="submit" style="font-size: x-large"></label></h1></div>
    <div align="center"><a href="register.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgetpassword.jsp">忘记密码？</a></div>
</form>
</div>
