<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/defaultSetting.jsp" %>
<%@ include file="setting.jsp" %>
<link href="${join}join.css" rel="stylesheet" type="text/css">
<script src="${join}script.js"></script>

<body id="join" onload="passwdfocus()">
	<form method="post" action="joinModifyView.do"
		name="passwdform" onsubmit="return passwdcheck()">
		<h2> ${page_modify} </h2>
		<table class="table table-bordered">
			<tr class="active">
				<th colspan="2"> ${msg_passwd} </th>
			</tr>
			<tr>
				<th> ${str_passwd} </th>
				<td>
					<input class="form-control" type="password" name="passwd"
						maxlength="20">
				</td> 
			</tr>
			<tr class="active">
				<th colspan="2">
					<input class="btn btn-default" type="submit" value="${btn_modify}"
					style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#f8f8f8;
					border: 1px solid #0059b3;"
					>
					<input class="btn btn-default" type="button" value="${btn_modify_cancel}"
						onclick="window.location='joinMain.do'"
					style="font-style:'돋움'; font-size:13px; color:#ff5d5d; background-color:#f8f8f8;
					border: 1px solid #ff5d5d;"
					>
				</th>
			</tr>
		</table>
	</form>
</body>

<!-- 
font-style : '돋움';
font-size : 10px;
color : white;
background-color : #0059b3;

color : #ff5d5d;
background-color : #f8f8f8; 
 -->













