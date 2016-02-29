<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/defaultSetting.jsp" %>
<%@ include file="setting.jsp" %>
<link href="${join}join.css" rel="stylesheet" type="text/css">
<script src="${join}script.js"></script>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Cache-Control" content="no-cache">
	<link href="${join}join.css" rel="stylesheet" type="text/css">
	<script src="${join}request.js"></script>
	<script type="text/javascript">
		var checkcode = "";
	
		function confirmmail( emailvalue ) {
			var params = "email=" + emailvalue;
			request = new Request( emailresult, "joinConfirmId.do", "GET", params );
			request.sendRequest();
		}
		function emailresult() {
			var result = document.getElementById( "emailresult" );
			var email = document.inputform.email.value;
			var xmldoc = request.httpRequest.responseXML;
			var code = xmldoc.getElementsByTagName( "result" ).item(0).firstChild.nodeValue;
			
			if( email == "" ) {
				result.innerHTML = "이메일을 입력해주세요.";
			} else if( email.indexOf("@") == -1 ) {
				result.innerHTML = "올바르지 않은 형식입니다.";
			} else if(code == 0) {
				result.innerHTML = "사용가능한 이메일입니다.";
			} else {
				result.innerHTML = "이미 사용중인 이메일입니다.";
			}		
		}
		function confirmname( namevalue ) {
			var params = "name=" + namevalue;
			request = new Request( nameresult, "joinConfirmName.do", "GET", params );
			request.sendRequest();
		}
		function nameresult() {
			var result = document.getElementById( "nameresult" );
			var name = document.inputform.name.value;		
			var xmldoc = request.httpRequest.responseXML;
			var code = xmldoc.getElementsByTagName( "result" ).item(0).firstChild.nodeValue;
			
			if( name == "" ) {
				result.innerHTML = "닉네임을 입력해주세요";
			} else if(code == 0) {
				result.innerHTML = "사용가능한 닉네임입니다.";
			} else {
				result.innerHTML = "이미 사용중인 닉네임입니다.";
			}		
		}
		function checkpasswd( passwd ) {
			var result = document.getElementById( "passwdresult" );
			
			if( passwd == "" ) {
				result.innerHTML = "비밀번호를 입력해주세요.";
			} else if( passwd.length < 8 ) {
				result.innerHTML = "비밀번호는 8자 이상입니다.";
			} else {
				result.innerHTML = "사용 가능합니다.";
			}
		}
		function recheckpasswd( passwd, repasswd ) {
			var result = document.getElementById( "repasswdresult" );
			
			if( repasswd == "" ) {
				result.innerHTML = "비밀번호를 한번 더 입력해주세요.";
			} else if( passwd != repasswd ) {
				result.innerHTML = "위의 비밀번호와 틀립니다.";
			} else {
				result.innerHTML = "비밀번호 체크 완료";
			}
		}
		function emailsend( emailvalue ) {
			alert("이메일로 전송된 코드를 입력해주세요.");
			var date = new Date().getTime();
			var params = "email=" + emailvalue + "&" + date;
			request = new Request( checkmail, "joinEmailConfirm.do", "GET", params );
			request.sendRequest();
		}
		function checkmail() {
			var xmldoc = request.httpRequest.responseXML;
			var code = xmldoc.getElementsByTagName( "result" ).item(0).firstChild.nodeValue;
			
			checkcode = code;
		}
		function inputcheck() {
			var emailcode = inputform.emailcode.value;
			if( checkcode != emailcode ) {
				alert("인증번호가 틀렸습니다");
				return false;
			} else if( emailcode == "" ) {
				alert("인증번호를 입력해주세요");
				return false;
			} else {
				return;
			}
		}
	</script>
</head>

<body id="join">
	<form name="inputform" method="post" action="joinInputPro.do"
		onsubmit="return inputcheck()">
		<input type="hidden" name="confirm" value="${check}">
		<h2> ${page_input} </h2>
		<table class="table">			
			<tr>
				<th colspan="2"> ${msg_input} </th>
			</tr>
			<tr>
				<th> * ${str_email} </th>
				<td>
					<input class="form-control" type="text" id="email" name="email" maxlength="30" 
						onkeyup="confirmmail( inputform.email.value )">
					<label id="emailresult">이메일을 입력해주세요.</label>
				</td>				
			</tr>
			<tr>
				<th rowspan="2"> * ${str_passwd} </th>
				<td>
					<input class="form-control" type="password" name="passwd" maxlength="20" 
						onkeyup="checkpasswd( inputform.passwd.value )">
					<label id="passwdresult">비밀번호를 입력해주세요.</label>
				</td>	
			</tr>
			<tr>				
				<td>
					<input class="form-control" type="password" name="repasswd" maxlength="20" 
						onkeyup="recheckpasswd( inputform.passwd.value, inputform.repasswd.value )">					
					<label id="repasswdresult">비밀번호를 한번 더 입력해주세요.</label>
				</td>	
			</tr>
			<tr>
				<th> * ${str_name} </th>
				<td>
					<input class="form-control" type="text" name="name" maxlength="100" 
						onkeyup="confirmname( inputform.name.value )">
					<label id="nameresult">닉네임을 입력해주세요</label>
				</td>
			</tr>
			<tr>
				<th> * ${str_member_flag} </th>
				<td> 
					<input type="radio" name="member_flag" value="1" title="개인회원"/>개인회원&nbsp;
					<input type="radio" name="member_flag" value="2" title="기업회원"/>기업회원
				</td>
			</tr>
			<tr>
				<th> * 이메일 인증 </th>
				<td> 
					<input class="form-control emailcode" type="text" name="emailcode">
					<input class="btn btn-default" type="button" value="이메일 인증" onclick="emailsend( inputform.email.value )">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="btn btn-default" type="submit" value="${btn_input}">
					<input class="btn btn-default" type="reset" value="${btn_cancel}">
					<input class="btn btn-default" type="button" value="${btn_input_cancel}"
						onclick="window.location='joinMain.do'">
				</th>
			</tr>
			
		</table>
	</form>
</body>
</html>
















