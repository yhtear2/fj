<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "setting.jsp" %>

<h2> 수정페이지 </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
	<!--
	alert(updateerror);
	//-->
	</script>
	<meta http-equiv="refresh" content="0; url=boardlist.jsp?pageNum=${pageNum}">
</c:if>

<c:if test="${result != 0}">
	<c:redirect url="boardlist.do">
		<c:param name="pageNum" value="${pageNum}"/>
	</c:redirect>
</c:if>    
