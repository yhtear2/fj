<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
			alert( "가입하지못했습니다." );
		//-->
	</script>	
</c:if>

<c:if test="${result == 1}">
	<script type="text/javascript">
		<!--
		var History_id = ${History_id}
		window.location.href = "introduceForm.do?History_id="+History_id;
		//-->		
	</script>	
</c:if>
