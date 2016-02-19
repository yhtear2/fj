<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="/FJ_JOIN/jquery-1.12.0.js"></script>
<script src="${project}script.js"></script>
<script src="${project}request.js"></script>
<script type="text/javascript">
	function confirmmail( emailvalue ) {
		var params = "email=" + emailvalue;
		//alert(params);
		request = new Request( confirmresult, "joinConfirmId.do", "GET", params );
		request.sendRequest();
	}
	function confirmresult() {
		var result = document.getElementById( "confirmresult" );
		/*	
		console.log('${check}');
		
		if( '${check}' == 0 ) {
			result.innerHTML = "중복 노노";
		} else {
			result.innerHTML = "중복 이응이응";
		}*/
		if( request.httpRequest.readyState == 4 ) {
			if( request.httpRequest.status == 200 ) {
				result.innerHTML = httpRequest.responseText;
				console.log("check : ${sessionScope.check}")
			} else {
				result.innerHTML = request.httpRequest.status + ": 에러";	
			}
		} else {
			result.innerHTML = request.httpRequest.readyState + ": 통신 중"; 
		}
	}	
</script>

<h2> ${page_input} </h2>
<body onload="inputfocus()">
	<form name="inputform" method="post" action="joinInputPro.do"
		onsubmit="return inputcheck()">
		<input type="hidden" name="confirm" value="0">
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

















