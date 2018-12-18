<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <title>Videohub</title>
    <link href="/assets/css/bootstrap.css" rel="stylesheet"/>

    <link href="/assets/css/font-awesome.css" rel="stylesheet"/>

    <link href="/assets/css/style.css" rel="stylesheet"/>

    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>

    <link href="//vjs.zencdn.net/7.3.0/video-js.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/video_player.css" media="all">
    <script src="//vjs.zencdn.net/7.3.0/video.min.js"></script>

    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.js"></script>


    <script>
        function Save() {
            if ($("#rememberMe").prop("checked")) {
                var str_username = $("#NameText").val();//用户名
                var str_password = $("#inputPassword").val();//密码
                $.cookie("rmbUser", "true", {expires: 7}); //存储一个带7天期限的cookie
                $.cookie("username", str_username, {expires: 7});
                $.cookie("password", str_password, {expires: 7});
            }
            else {
                $.cookie("rmbUser", "false", {expire: -1});
                $.cookie("username", "", {expires: -1});
                $.cookie("password", "", {expires: -1});
            }

            if ($("#autoLogin").prop("checked")) {
                var str_username = $("#NameText").val();
                var str_password = $("#inputPassword").val();
                $.cookie("auto", "true", {expires: 7}); //存储一个带7天期限的cookie
                $.cookie("username", str_username, {expires: 7});
                $.cookie("password", str_password, {expires: 7});
            }
            else {
                $.cookie("auto", "false", {expire: -1});
                $.cookie("username", "", {expires: -1});
                $.cookie("password", "", {expires: -1});
            }
        }

    </script>
</head>
<body>
<div class="navbar navbar-inverse set-radius-zero">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">

                <img src="/assets/img/logo.png"/>
            </a>

        </div>

        <div class="right-div">
            <a href="#" class="btn btn-info pull-right">注销登录</a>
        </div>
    </div>
</div>
<!-- LOGO HEADER END-->
<section class="menu-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="navbar-collapse collapse ">
                    <ul id="menu-top" class="nav navbar-nav navbar-right">
                        <li><a href="index.html">主页</a></li>
                        <li><a href="login.html">登录</a></li>
                        <li><a href="signup.html" class="menu-top-active">注册</a></li>
                        <li><a href="profile.html">用户中心</a></li>
                        <li><a href="pay.html">充值</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- MENU SECTION END-->
<div class="main">
    <div class="video">
        <div class="video-title">
            <h2>This is a video title</h2>
        </div>
        <video
                width="1000"
                height="625"
                id="my-player"
                class="video-js"
                controls
                preload="auto"
                poster="<%=request.getAttribute("video_url")%>.png"
                data-setup='{}'>
            <source src="<%=request.getAttribute("video_url")%>.mp4" type="video/mp4"></source>
            <source src="<%=request.getAttribute("video_url")%>.webm" type="video/webm"></source>
            <source src="<%=request.getAttribute("video_url")%>.ogv" type="video/ogg"></source>
            <p class="vjs-no-js">
                To view this video please enable JavaScript, and consider upgrading to a
                web browser that
                <a href="http://videojs.com/html5-video-support/" target="_blank">
                    supports HTML5 video
                </a>
            </p>
        </video>
    </div>
    <div class="comment">
        <div class="comment-title">
            <h3>实时评论</h3>
        </div>
        <div class="comment-area">
            <input type="text" id="comment" value="" placeholder="输入join开始发言;输入leave离开;请友善发言~"/>
            <input type="button" value="发送" onclick="send()"/>
        </div>
        <div class="message-area" id="message_area">

        </div>
    </div>
</div>
<!-- CONTENT-WRAPPER SECTION END-->
<section class="footer-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                &copy; 2018 Videohub.org
            </div>

        </div>
    </div>
</section>
<!-- FOOTER SECTION END-->
<!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
<!-- CORE JQUERY  -->
<script src="/assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS  -->
<script src="/assets/js/bootstrap.js"></script>
<!-- CUSTOM SCRIPTS  -->
<script src="/assets/js/custom.js"></script>
</body>
</html>
