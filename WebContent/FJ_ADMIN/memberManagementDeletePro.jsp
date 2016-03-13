<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		alert( modifyerror );
		//-->
	</script>
	<meta http-equiv="refresh" content="0; url=memberManagementList.do">		
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="memberManagementList.do"/>
</c:if>