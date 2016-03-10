<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%> 
<script src="script.js"></script>

<h2> 삭제 </h2>
  
<c:if test=" parameter != null and parameter != '' ">     
	<c:if test="${result == 0}">	
		<script type="text/javascript">
			<!--  
			alert( deleteerror );
			//-->
		</script>	
		<meta http-equiv="refresh" content="0; url=boardlist.do?pageNum=${pageNum}">
	</c:if>	
	<c:if test="${result == -1}">
		<script type="text/javascript">
			<!--
			alert( replyerror );	
			//-->			
		</script>	
		<meta http-equiv="refresh" content="0; url=boardlist.do?pageNum=${pageNum}">		
	</c:if>
	<c:if test="${result == 1}">
	<script type="text/javascript">	
	<!-- 
		var PageNum = ${pageNum};
		window.location.href = "boardlist.do?pageNum="+PageNum;
	//-->
	</script> 				
	</c:if>
</c:if>
