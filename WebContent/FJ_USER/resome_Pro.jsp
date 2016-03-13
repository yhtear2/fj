<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/defaultSetting.jsp"%>


${sessionScope.history_id}	

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
			alert( "입력에 실패 했습니다. \n 잠시 후 다시 시도해 주세요." );
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
