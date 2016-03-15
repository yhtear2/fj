<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="script.js"></script>

<h2> 삭제페이지 </h2>

<script type="text/javascript">

var confirmd;

confirmd = confirm("정말 삭제 하시겠습니까?");

if (confirmd) {
	alert("정상적으로 삭제되었습니다.");
}
else {
	alert("잠시 후 다시 시도하세요");
}

</script>

<c:if test="${result == 1}">
	<script type="text/javascript">
 
	alert("삭제가 완료되었습니다.");
	
	</script>
</c:if>

<c:if test="${result != 1}">
	<script type="text/javascript">	
	<!-- 
		alert("잠시 후 다시 시도하세요");
	//-->
	</script> 
</c:if>    
    