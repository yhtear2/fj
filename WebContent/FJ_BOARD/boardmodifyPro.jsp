<%@page import="dao.board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="script.js"></script>

<h2> 수정페이지 </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
 
	alert(updateerror);
	
	</script>
	<meta http-equiv="refresh" content="0; url=boardlist.do?pageNum=${pageNum}">
</c:if>

<c:if test="${result != 0}">
	<script type="text/javascript">	
	<!-- 
		var PageNum = ${pageNum};
		window.location.href = "boardlist.do?pageNum="+PageNum;
	//-->
	</script> 
</c:if>    
