<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}request.js"></script>
<script type="text/javascript">
	function confirmmail( emailvalue ) {
		var params = "email=" + emailvalue;
		request = new Request( confirmresult, "joinConfirmId.do", "GET", params );
		request.sendRequest();
	}
	function confirmresult() {
		var result = document.getElementById( "confirmresult" );
		
		var xmldoc = request.httpRequest.responseXML;
		var code = xmldoc.getElementsByTagName( "result" ).item(0).firstChild.nodeValue;
				
		if(code == 0) {
			result.innerHTML = "사용가능한 아이디입니다.";
		} else {
			result.innerHTML = "이미 사용중인 아이디입니다.";
		}		
	}	
</script>

<h2> ${page_input} </h2>
<body>
	<form name="inputform" method="post" action="joinInputPro.do"
		onsubmit="return inputcheck()">
		<input type="hidden" name="confirm" value="${check}">
		<table>			
			<tr>
				<th colspan="2"> ${msg_input} </th>
			</tr>
			<tr>
				<th> * ${str_email} </th>
				<td>
					<input class="input" type="text" id="email" name="email" maxlength="30" onkeyup="confirmmail( inputform.email.value )">
					<label id="confirmresult">ㅇㅇ</label>
				</td>				
			</tr>
			<tr>
				<th rowspan="2"> * ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd" maxlength="20">
				</td>	
			</tr>
			<tr>				
				<td>
					<input class="input" type="password" name="repasswd" maxlength="20">
				</td>	
			</tr>
			<tr>
				<th> * ${str_name} </th>
				<td>
					<input class="input" type="text" name="name" maxlength="50">
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
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_input}">
					<input class="inputbutton" type="reset" value="${btn_cancel}">
					<input class="inputbutton" type="button" value="${btn_input_cancel}"
						onclick="window.location='joinMain.do'">
				</th>
			</tr>
			
		</table>
	</form>
</body>

















