<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<title>Login</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <script>
        function Save() {
            if ($("#rememberMe").prop("checked")) {
                var str_username = $("#NameText").val();//用户名
                var str_password = $("#inputPassword").val();//密码
                $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
                $.cookie("username", str_username, { expires: 7 });
                $.cookie("password", str_password, { expires: 7 });
            }
            else {
                $.cookie("rmbUser", "false", { expire: -1 });
                $.cookie("username", "", { expires: -1 });
                $.cookie("password", "", { expires: -1 });
            }

            if ($("#autoLogin").prop("checked")) {
                var str_username = $("#NameText").val();
                var str_password = $("#inputPassword").val();
                $.cookie("auto", "true", { expires: 7 }); //存储一个带7天期限的cookie
                $.cookie("username", str_username, { expires: 7 });
                $.cookie("password", str_password, { expires: 7 });
            }
            else {
                $.cookie("auto", "false", { expire: -1 });
                $.cookie("username", "", { expires: -1 });
                $.cookie("password", "", { expires: -1 });
            }
        };

    </script>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        #wrap {
            height: 100%;
            width: 100%;
            background-image: url("/image/videoBG.jpg");
            background-repeat: no-repeat;
            background-position: center center;
            position: relative;
        }
        #wrap .logGet {
            height: 408px;
            width: 368px;
            position: absolute;
            opacity: 0.8;
            background-color: #ffffff;
            box-shadow: 10px 10px 5px #888888;
            border:2px solid;
            border-radius:25px;
            -moz-border-radius:25px;
            top: 20%;
            right: 15%;
        }
        .logC a button {
            width: 100%;
            height: 45px;
            background-color: #ee7700;
            border: none;
            color: white;
            font-size: 18px;
        }
        .logGet .logD.logDtip .p1 {
            display: inline-block;
            font-size: 28px;
            margin-top: 30px;
            width: 86%;
        }
        #wrap .logGet .logD.logDtip {
            width: 86%;
            border-bottom: 1px solid #ee7700;
            margin-bottom: 60px;
            margin-top: 0px;
            margin-right: auto;
            margin-left: auto;
        }
        .logGet .lgD img {
            position: absolute;
            top: 12px;
            left: 8px;}
        .logGet .lgA img
        {
            position: absolute;
            top: 12px;
            right: 8px;}

        .logGet .lgA input {
            width: 70%;
            height: 42px;
            text-indent: 2.5rem;
        }
        .logGet .lgD input {
            width: 100%;
            height: 42px;
            text-indent: 2.5rem;
        }
        .logGet .lgF input {
            width: 100%;
            height: 42px;
        }
        #wrap .logGet .lgD {
            width: 86%;
            position: relative;
            margin-bottom: 30px;
            margin-top: 30px;
            margin-right: auto;
            margin-left: auto;
        }
   #wrap .logGet .lgA {
            width: 86%;
            position: relative;
            margin-bottom: 30px;
            margin-top: 30px;
            margin-right: auto;
            margin-left: auto;
        }
    </style>
</head>
<body>
<div class="wrap" id="wrap" >
<div class="logGet">
    <div class="logD logDtip">
        <p class="p1">登录</p>
    </div>
    <form  method="post" name="form1">
        <div class="lgD"><img src="/image/user.jpg" width="20" height="20" alt=""/>
            <input  name="username" type="text" placeholder="输入用户密码"/></div>
        <div class="lgD"><img src="/image/psw.jpg" width="20" height="20" alt=""/>
            <input name="password" type="password" placeholder="输入用户密码"/></div>
        <div class="lgD"><img src="/image/email.jpg" width="20" height="20" alt=""/>
            <input name="email" type="email" placeholder="输入用户邮箱"/></div>
        <div class="lgA"><img id="img" onclick="form1.action='/changecheckcode'" src="checkcode"/>
            <input type="text" name="checkCode" placeholder="输入验证码"/>
        </div>
        <div><label>
            <input type="checkbox" name="rememberMe" id = "rememberMe"> 记住密码
        </label></div>
    <div  style=" display: inline;margin:0 50px;border:0;padding:0;"><input value="登录" style=" opacity: 0.8;
            background-color: #ffffff;
            box-shadow: 10px 10px 5px #888888;border:2px solid;
            border-radius:25px;
            -moz-border-radius:25px;width: 100px;height: 50px;margin-bottom: 20px"type="submit" onmouseup="form1.action='/logcheck'"></div>
        <div   style="display: inline"><input type="submit"  style="
         opacity: 0.8;
            background-color: #ffffff;
            box-shadow: 10px 10px 5px #888888;border:2px solid;
            border-radius:25px;
            -moz-border-radius:25px;width: 100px;height: 50px;margin-bottom: 20px" onclick="/changecheckcode'" value="换一张"></div>
    <div align="center"><a href="register.jsp">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgetpassword.jsp">忘记密码？</a></div>
    </form>
</div>
</div>
<dialog id="1"><%=request.getParameter("reason")%></dialog>
</body>
<script>
    var errori='<%=request.getParameter("error")%>'
    if(errori=='yes')
    {
        document.getElementById("1").showModal();

    }

</script>
