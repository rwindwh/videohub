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