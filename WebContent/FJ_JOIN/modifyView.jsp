<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}request.js"></script>
<script src="${project}script.js"></script>
<script type="text/javascript">
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
	function confirmname( namevalue ) {
		var params = "name=" + namevalue;
		request = new Request( nameresult, "joinConfirmName.do", "GET", params );
		request.sendRequest();
	}
	function nameresult() {
		var result = document.getElementById( "nameresult" );
		var name = document.modifyform.name.value;
		var orgname = '${dto.name}';
		var xmldoc = request.httpRequest.responseXML;
		var code = xmldoc.getElementsByTagName( "result" ).item(0).firstChild.nodeValue;
		
		if( orgname == name ) {
			result.innerHTML = "";
		} else if( name == "" ) {
			result.innerHTML = "닉네임을 입력해주세요";
		} else if(code == 0) {
			result.innerHTML = "사용가능한 닉네임입니다.";
		} else {
			result.innerHTML = "이미 사용중인 닉네임입니다.";
		}		
	}
</script>

<h2> ${page_modify} </h2>

<c:if test="${resultCheck == 1}">
	<body onload="modifyfocus()">
		<form method="post" action="joinModifyPro.do"
			name="modifyform" onsubmit="return modifycheck()">				
			<table>
				<tr>
					<th colspan="2"> ${msg_modify} </th>						
				</tr>
				<tr>
					<th> ${str_email} </th>
					<td> ${dto.email} </td>
				</tr>
				<tr>
					<th rowspan="2"> ${str_passwd} </th>
					<td>
						<input class="input" type="password" name="passwd" maxlength="20" 
							onkeyup="checkpasswd( modifyform.passwd.value )">
						<label id="passwdresult">비밀번호를 입력해주세요.</label>
					</td>						
				</tr>
				<tr>
					<td>
						<input class="input" type="password" name="repasswd" maxlength="20" 
							onkeyup="recheckpasswd( modifyform.passwd.value, modifyform.repasswd.value )">
						<label id="repasswdresult">비밀번호를 한번 더 입력해주세요.</label>
					</td>
				</tr>
				<tr>
					<th> ${str_name} </th>
					<td>
						<input class="input" type="text" name="name" maxlength="100" 
							value="${dto.name}" onkeyup="confirmname( modifyform.name.value )">
						<label id="nameresult"></label>
					</td>
				</tr>
				<tr>
					<th> ${str_date} </th>
					<td>
						<fmt:formatDate value="${dto.reg_date}" type="both"
							pattern="yyyy_MM-dd HH:mm"/>						
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input class="inputbutton" type="submit" value="${btn_modify}">
						<input class="inputbutton" type="reset" value="${btn_cancel}">
						<input class="inputbutton" type="button" value="${btn_modify_cancel}"
							onclick="window.location='joinMain.do'">
					</th>
				</tr>
			</table>
		</form>		
	</body>
</c:if>
<c:if test="${resultCheck != 1}">				
	<script type="text/javascript">
		<!--
		erroralert( passwderror );
		//-->
	</script>		
</c:if>		


























