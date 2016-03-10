<%@page import="dao.board.BoardDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ include file="setting.jsp"%>
<script src="script.js"></script>

<h2> 댓글페이지 </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( replyupdate ); 
		//-->      
	</script>
</c:if> 
<c:if test="${result != 0}"> 	
	<script type="text/javascript">	
	<!-- 
		var PageNum = ${pageNum};
		var board_num = ${board_num};
		var number = ${number};
		window.location.href = "boardcontent.do?board_num="+board_num+"&pageNum="+PageNum+"&number="+number;
	//-->
	</script> 
</c:if> 