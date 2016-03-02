/* name 		: focusAlert(msg, obj)
 * description 	: 메세지 출력 후 특정 오브젝트에 포커스 부여
 * parameter 	: msg, obj
 * - msg 		: 출력할 메세지
 * - obj 		: 출력 후 포커스 할 오브젝트
 */
function focusAlert(msg, obj){
	alert(msg);
	obj.focus();
}

/* name 		: errorAlert(msg)
 * description 	: 메세지 출력 후 페이지 뒤로가기 
 * parameter 	: msg
 * - msg 		: 출력할 메세지
 */
function errorAlert(msg){
	alert(msg);
	history.back();
}



/***
 * 
 * 웹소켓
 * 
 * ***/

function websoket( memId ){
	result = document.getElementById("result");
	stat = document.getElementById("stat");
	
	if(! window.WebSocket ){
		alert( "이 브라우저는 실시간 쪽지기능을 지원하지 않습니다.");
		return;
	} else{
		// 연결한 웹소켓의 주소 및 아이디
		ws = new WebSocket('ws://192.168.30.125:8080/fj/websocket/chat?memId='+memId);
		// 서버에 연결하는 메소드
		ws.onopen = function(){
		}
		// 메세지를 수신하면 연결되는 메소드
		ws.onmessage = function( evt ){
			alert(evt.data);
		}
		// 서버가 종료될때 연결되는 메소드
		ws.onclose = function(){	
		}
	}
}

function sendmsg(){
	
	// 데이터 받아오기
	var msg = $('input[id=msg]').val();
	alert(msg);
	// 이 밑으로 안들어가네...
	// 메세지를 보낼때 연결되는 메소드
	ws.send( msg );
	
}









