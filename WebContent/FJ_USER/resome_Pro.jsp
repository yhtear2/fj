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
	<input type="hidden" name="User_history_id" value="${User_history_id}">
	<script type="text/javascript">
		<!--
		var User_history_id = $('input[name=User_history_id]').val();
		window.location.href = "introduceForm.do?User_history_id="+User_history_id;
		//-->		
	</script>

	</c:if>
