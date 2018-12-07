<%@page pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <link href="//vjs.zencdn.net/7.3.0/video-js.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="./css/video_player.css" media="all">
    <script src="//vjs.zencdn.net/7.3.0/video.min.js"></script>
    <script type="text/javascript">
        var websocket = null;
        if ('WebSocket' in window) {
            websocket = new WebSocket("ws://localhost:8887/");
        }
        else {
            alert('Your web browser does not support websocket')
        }
        //连接发生错误的回调方法
        websocket.onerror = function () {
            setMessageInnerHTML("评论系统启动失败");
        };

        //连接成功建立的回调方法
        websocket.onopen = function () {
            setMessageInnerHTML("评论系统已启动");
        };

        //接收到消息的回调方法
        websocket.onmessage = function (event) {
            setMessageInnerHTML(event.data);
        };

        //连接关闭的回调方法
        websocket.onclose = function () {
            setMessageInnerHTML("评论系统关闭");
        };

        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = function () {
            closeWebSocket();
        };

        //将消息显示在网页上
        function setMessageInnerHTML(innerHTML) {
            console.log('get');
            console.log(innerHTML);
            document.getElementById('message_area').innerHTML += innerHTML + '<br/>';
        }

        //关闭WebSocket连接
        function closeWebSocket() {
            websocket.close();
        }

        //发送消息
        function send() {
            var message = document.getElementById('comment').value;
            websocket.send(message);
        }
    </script>
</head>
<body class="BG" background="/image/videoBG.jpg">
<div>
    <div></div>
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
    评论<input type="text" id="comment" value="" placeholder="输入join开始发言;输入leave离开;请友善发言~"/>
    <input type="button" value="发送" onclick="send()"/>
    <div id="message_area"></div>
</div>
</body>
</html>