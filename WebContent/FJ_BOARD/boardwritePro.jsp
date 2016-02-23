<%@page import="dao.board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="setting.jsp"%>
<script src="script.js"></script>

<h2> ${page_write} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( writeerror );
		//--> 
	</script>
</c:if>
<c:if test="${result != 0}">	
	<c:redirect url="list.do"/>  
</c:if>
   
















