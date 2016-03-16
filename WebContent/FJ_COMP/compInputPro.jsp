<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
	<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		alert("입력에 실패했습니다. \n 잠시 후 다시 시도해 주세요");
		//-->
	</script>
	</c:if>
	
	<c:if test="${result == 1}">
		<script type="text/javascript">
		<!--
		window.location.href='compView.do';
		//-->
		</script>
	</c:if>
</body>



