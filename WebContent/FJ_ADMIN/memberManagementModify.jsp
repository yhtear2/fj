<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp" %>

<body>
	<form method="post" action="memberManagementModifyPro.do"
		name="modifyform" onsubmit="return modifycheck()">
		<input type="hidden" name="email" value="${dto.email}">
		<h2> ${page_modify} </h2>
		<table class="table table-bordered">
			<tr class="active">
				<th colspan="2"> ${msg_modify} </th>						
			</tr>
			<tr>
				<th class="view-th"> ${str_email} </th>
				<td> ${dto.email} </td>
			</tr>
			<tr>
				<th rowspan="2"> ${str_passwd} </th>
				<td>
					<input class="form-control" type="password" name="passwd" maxlength="20" 
						onkeyup="checkpasswd( modifyform.passwd.value )">
					<label id="passwdresult">비밀번호를 입력해주세요.</label>
				</td>						
			</tr>
			<tr>
				<td>
					<input class="form-control" type="password" name="repasswd" maxlength="20" 
						onkeyup="recheckpasswd( modifyform.passwd.value, modifyform.repasswd.value )">
					<label id="repasswdresult">비밀번호를 한번 더 입력해주세요.</label>
				</td>
			</tr>
			<tr>
				<th> ${str_name} </th>
				<td>
					<input class="form-control" type="text" name="name" maxlength="100" 
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
			<tr class="active">
				<th colspan="2">
					<input class="btn btn-default" type="submit" value="${btn_modify}">
					<input class="btn btn-default" type="reset" value="${btn_cancel}">
					<input class="btn btn-default" type="button" value="${btn_modify_cancel}"
						onclick="window.location='memberManagementList.do'">
				</th>
			</tr>
		</table>
	</form>
</body>