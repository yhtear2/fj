<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>

<h2> ${page_delete} </h2>

<body onload="passwdfocus()">
	<form method="post" action="joinDeletePro.do"
		name="passwdform" onsubmit="return passwdcheck()">
		<table>
			<tr>
				<th colspan="2"> ${msg_passwd} </th>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td>
					<input class="input" type="password" name="passwd"
						maxlength="20">
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input class="inputbutton" type="submit" value="${btn_delete}">
					<input class="inputbutton" type="button" value="${btn_delete_cancel}"
						onclick="window.location='joinMain.do'">
				</th>
			</tr>
		</table>
	</form>
</body>












