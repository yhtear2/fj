<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>

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
						<input class="input" type="password" name="passwd"
							maxlength="20" value="${dto.passwd}">
					</td>						
				</tr>
				<tr>
					<td>
						<input class="input" type="password" name="repasswd"
							maxlength="20" value="${dto.passwd}">
					</td>
				</tr>
				<tr>
					<th> ${str_name} </th>
					<td> ${dto.name} </td>
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


























