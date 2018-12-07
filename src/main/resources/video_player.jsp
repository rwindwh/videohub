<html>
<link href="//vjs.zencdn.net/7.3.0/video-js.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/video_player.css" media="all">
<script src="//vjs.zencdn.net/7.3.0/video.min.js"></script>

<%
    String videoUrl = (String) request.getAttribute("video_id");
    String username = (String) request.getAttribute("username");
%>
<body class="BG" background="/image/videoBG.jpg">
<div>
    <div class="top-action">
        <div class="top-action-one">
            <a href="">主页</a>
        </div>
        <div class="top-action-two">
            <a href="">充值中心</a>
        </div>
        <div class="top-action-three">
            <a href=""><%=username%>的个人中心</a>
        </div>
    </div>
    <div class="video-view">
        <div class="video-view-title">
            <h1 title="视频标题">视频标题</h1>
        </div>
        <div class="video">
            <video
                    width="638"
                    height="359"
                    id="my-player"
                    class="video-js"
                    controls
                    preload="auto"
                    poster="<%=videoUrl%>.png"
                    data-setup='{}'>
                <source src="<%=videoUrl%>.mp4" type="video/mp4"></source>
                <source src="<%=videoUrl%>.webm" type="video/webm"></source>
                <source src="<%=videoUrl%>.ogv" type="video/ogg"></source>
                <p class="vjs-no-js">
                    To view this video please enable JavaScript, and consider upgrading to a
                    web browser that
                    <a href="http://videojs.com/html5-video-support/" target="_blank">
                        supports HTML5 video
                    </a>
                </p>
            </video>
        </div>
    </div>
    <div class="right-action">
        <div class="right-action-title">
            <h3>something you will like</h3>
        </div>
        <div class="right-video">
            <div class="right-video-one">

            </div>
            <div class="right-video-two">

            </div>
            <div class="right-video-three">

            </div>
            <div class="right-video-four">

            </div>
        </div>
    </div>
</div>
</body>
</html>

