<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="/defaultSetting.jsp"%>
<%@ include file="setting.jsp"%>

<!-- body -->
<body>
	<form method="post" name="form" action="compInputForm.do"> 
		<label for="passwd"> ${lbl_password} </label>
		<input type="password" name="passwd" id="passwd">
		<input type="submit" name="submit" value="submit">
	</form>
</body>





