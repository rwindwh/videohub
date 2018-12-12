<%@page pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <link href="//vjs.zencdn.net/7.3.0/video-js.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="./css/video_player.css" media="all">
    <script src="//vjs.zencdn.net/7.3.0/video.min.js"></script>
    <script src="/js/ws_comment.js"></script>
</head>
<body class="BG" background="/image/videoBG.jpg">

<div>
    <ul class="top-action">
        <li class="top-action-name">
            videoHub影院
        </li>
        <li class="top-action-main">
            <a href="index.html">主页</a>
        </li>
        <li class="top-action-pay">
            <a href="">商城</a>
        </li>
        <li class="top-action-center">
            <a href="">个人中心</a>
        </li>
    </ul>
    <div class="main">
        <div class="video">
            <div class="video-title">
                <h3>This is a video title</h3>
            </div>
            <video
                    width="1000"
                    height="625"
                    id="my-player"
                    class="video-js"
                    controls
                    preload="auto"
                    poster="//vjs.zencdn.net/v/oceans.png"
                    data-setup='{}'>
                <source src="//vjs.zencdn.net/v/oceans.mp4" type="video/mp4"></source>
                <source src="//vjs.zencdn.net/v/oceans.webm" type="video/webm"></source>
                <source src="//vjs.zencdn.net/v/oceans.ogv" type="video/ogg"></source>
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
            <input type="text" id="comment" value="" placeholder="输入join开始发言;输入leave离开;请友善发言~"/>
            <input type="button" value="发送" onclick="send()"/>
            <div class="message_area" id="message_area">

            </div>
        </div>
    </div>
</div>
</body>
</html>