<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="/defaultSetting.jsp"%>
<%@ include file="setting.jsp"%>
<link rel="stylesheet" href="/fj/FJ_COMP/comp.css">

<!-- body -->
<body style="margin:80px 0px 0px 50px;text-align: center;">
	<form method="post" name="form" action="compInputForm.do"> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label for="passwd"> ${lbl_password} </label>
		<input type="password" name="passwd" id="passwd"  class="btn btn-default">
		<input type="submit" name="submit" value="submit"  class="btn btn-default">
	</form>
</body>





