<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/defaultSetting.jsp" %>
<%@ include file="setting.jsp" %>
<link href="${join}join.css" rel="stylesheet" type="text/css">
<script src="${join}script.js"></script>

<h2> ${page_input} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
			erroralert( inputerror );
		//-->
	</script>	
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="joinMain.do"/>
</c:if>	




	










