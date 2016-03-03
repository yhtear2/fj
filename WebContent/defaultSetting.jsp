<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 

	******************************  
		디폴트 세팅은 건들지 말아주세요 
	******************************
	
 -->

<!-- tab library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fnc" uri="http://java.sun.com/jsp/jstl/functions" %>
 
  	
<!-- variable -->
<c:set var="project" value="/fj"/>
<c:set var="js" value="${project}/js"/>
<c:set var="images" value="${project}/images"/>
<c:set var="main" value="${project}/FJ_MAIN"/>
<c:set var="join" value="${project}/FJ_JOIN/"/>

<!-- common java script -->
<!-- Jquery 2.x 버젼 IE 8버전 이하는 지원안함 -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<!-- Jquery ui를 사용하려면 필요한 자바스크립트 --> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<!-- Jquery를 이용한 Cookie를 사용하기위해 필요한 자바스크립트 -->
<script src="${project}/jquery.cookie.js"></script>

<!-- common style sheet -->
<!-- 셈플 확인 : http://getbootstrap.com/css/ -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>   


<script type="text/javascript">

var ws = null;

//웹소켓 구현부
function wsConnect( memId ){
	
	//if( memId != null && memId != ""){
		if(! window.WebSocket ){
			alert("이 브라우저는 실시간 쪽지를 지원하지 않습니다.");
			return;
		} else{
			// 연결한 웹소켓의 주소 및 아이디
			ws = new WebSocket('ws://localhost:8080/fj/websocket/chat?memId='+memId);
			// 서버에 연결하는 메소드
			ws.onopen = function(){
			}
			// 메세지를 수신하면 연결되는 메소드
			ws.onmessage = function( evt ){
				alert( evt.data );
			}
			// 서버가 종료될때 연결되는 메소드
			ws.onclose = function(){
				alert("서버 접속 종료");	
			}
	//	}
	}
}

function wsSendMassge( msg ){
	//var msg =  $.cookie('msg');
	//if ( msg != null && msg != ""){
		ws.send( msg );
	//	$.cookie('msg', '');
		alert("들어와라");
	//}
}


</script>
