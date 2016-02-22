<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	
<script type="application/javascript">
  var Chat = {};

  Chat.socket = null;

  // connect() 함수 정의
  Chat.connect = (function(host) {
	// 서버에 접속시도
	if ('WebSocket' in window) {
		Chat.socket = new WebSocket(host);
	} else if ('MozWebSocket' in window) {
		Chat.socket = new MozWebSocket(host);
	} else {
		Console.log('Error: WebSocket is not supported by this browser.');
		return;
	}

	// 서버에 접속이 되면 호출되는 콜백함수
    Chat.socket.onopen = function () {
	};

	// 연결이 끊어진 경우에 호출되는 콜백함수
	Chat.socket.onclose = function () {
    };

    // 서버로부터 메시지를 받은 경우에 호출되는 콜백함수
    Chat.socket.onmessage = function (message) {
    // 수신된 메시지를 화면에 출력함
    Console.log(message.data); 
	};
 	});
// connect() 함수 정의 끝

// 위에서 정의한 connect() 함수를 호출하여 접속을 시도함
  Chat.initialize = function() {
      if (window.location.protocol == 'http:') {
          //Chat.connect('ws://' + window.location.host + '/websocket/chat');
      	Chat.connect('ws://192.168.30.125:8080/fj/websocket/chat?memId=${sessionScope.memId}');
      } else {
          Chat.connect('wss://' + window.location.host + '/websocket/chat');
      }
  };

  // 서버로 메시지를 전송하고 입력창에서 메시지를 제거함
  Chat.sendMessage = (function() {
      var message = document.getElementById('chat').value;
      if (message != '') {
          Chat.socket.send(message);
          document.getElementById('chat').value = '';
      }
  });

  var Console = {}; // 화면에 메시지를 출력하기 위한 객체 생성

  // log() 함수 정의
  Console.log = (function(message) {
      var console = document.getElementById('console');
      var p = document.createElement('p');
      p.style.wordWrap = 'break-word';
      p.innerHTML = message;
      console.appendChild(p); // 전달된 메시지를 하단에 추가함
      // 추가된 메시지가 25개를 초과하면 가장 먼저 추가된 메시지를 한개 삭제함
      while (console.childNodes.length > 25) {
          console.removeChild(console.firstChild);
      }
      // 스크롤을 최상단에 있도록 설정함
      console.scrollTop = console.scrollHeight;
  });

  // 위에 정의된 함수(접속시도)를 호출함
  Chat.initialize();
  
  
  
function websoket(){
	result = document.getElementById("result");
	stat = document.getElementById("stat");
	
	if(! window.WebSocket ){
		stat.innerHTMl = "이 브라우저는 Web Socket을 지원하지 않습니다.";
		return;
	} else{
		// 연결한 웹소켓의 주소 및 아이디
		ws = new WebSocket('ws://192.168.30.125:8080/fj/websocket/chat?memId=${sessionScope.memId}');
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
