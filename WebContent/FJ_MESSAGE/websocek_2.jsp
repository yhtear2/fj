<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
<% session.setAttribute("memId", "master@djkf.com"); %>
<script type="application/javascript">
 
function websoket(){
	result = document.getElementById("result");
	stat = document.getElementById("stat");
	
	if(! window.WebSocket ){
		stat.innerHTMl = "이 브라우저는 Web Socket을 지원하지 않습니다.";
		return;
	} else{
		// 연결한 웹소켓의 주소 및 아이디
		ws = new WebSocket('ws://192.168.0.136:8080/fj/websocket/chat?memId=${sessionScope.memId}');
		// 서버에 연결하는 메소드
		ws.onopen = function(){
			stat.innerHTML = "서버 접속 성공";
		}
		// 메세지를 수신하면 연결되는 메소드
		ws.onmessage = function( evt ){
			result.innerHTML += evt.data + "<br>";
			stat.innerHTML = "메시지 수신";
		}
		// 서버가 종료될때 연결되는 메소드
		ws.onclose = function(){
			stat.innerHTML = "서버 접속 종료";	
		}
	}
}

function sendmsg(){
	var msg = document.getElementById("msg").value;
	// 메세지를 보낼때 연결되는 메소드
	ws.send( msg );
	stat.innerHTML = "메세지 전송";
}
</script>

<body onload="websoket()">
	<h2> Web Socket </h2>
	보낼 메시지 : <input type="text" id="msg">
	<button onclick="sendmsg()">송신</button>
	<br><br>
	받은 메시지 : 
	<div id="result"></div>
	<br><br>
	status : <div id="stat"></div>
</body>
</html>
