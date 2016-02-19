<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="setting.jsp"%>
<%
session.setAttribute("memId", "test@jkd.com");
%>
<head>
	<script type="text/javascript">
		function itit(){
			result = document.getElementById("result");
			stat = document.getElementById("stat");

			if(! window.WebSocket ){
				stat.innerHTMl = "이 브라우저는 Web Socket을 지원하지 않습니다.";
				return;
			} else{
				ws = new WebSocket('ws://192.168.30.125:8080/fj/broadcasting');
				ws.onopen = function(){
					stat.innerHTML = "서버 접속 성공";
				}
				ws.onmessage = function( evt ){
					result.innerHTML += evt.data + "<br>";
					stat.innerHTML = "메시지 수신";
				}
				ws.onclose = function(){
					stat.innerHTML = "서버 접속 종료";	
				}
			}
		}
		function sendmsg(){
			var msg = document.getElementById("msg").value;
			ws.send( msg );
			stat.innerHTML = "메세지 전송";
		}
	</script>
</head>
<body onload="itit()">
	<input type="hidden" name="testid" value="fejklfdjklf@comcom">
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