<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
			alert( "수정에 실패했습니다.\n잠시 후 다시 시도해 주세요." );
		//-->
	</script>	
</c:if>

<c:if test="${result == 1}">
	<script type="text/javascript">
		<!--
		window.location.href = "resome_list.do";
		//-->		
	</script>		
</c:if>
