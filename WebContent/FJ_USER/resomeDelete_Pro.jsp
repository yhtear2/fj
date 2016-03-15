<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="script.js"></script>

<c:if test="${result_user == 1}">
	<script type="text/javascript">
	alert("삭제가 완료되었습니다.");
	</script>
		<meta http-equiv="refresh" content="0; url=resome_list.do">
</c:if>

<c:if test="${result_user != 1}">
	<script type="text/javascript">	
	<!-- 
		alert("잠시 후 다시 시도하세요");
	//-->
	</script>
		<meta http-equiv="refresh" content="0; url=resome_list.do">
	
</c:if>    
    