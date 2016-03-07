<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="/defaultSetting.jsp"%>

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
			alert( "가입에 성공하였습니다." );
		//-->
		
	</script>
	${license_cnt}
	${user_history_id}
	
	${sessionScope.user_history_id = user_history_id}
		<%-- <c:redirect url="career.do"/> --%>
	</c:if>
