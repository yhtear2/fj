<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2> 기업정보 수정 결과 페이지 </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
	 	alert("기업정보 수정에 실패했습니다.");
	 	history.back();
	</script>
</c:if>

<c:if test="${result == 1}">
	<script type="text/javascript">
		alert("기업정보가 수정되었습니다.");
		window.location='main.do';
	</script>
</c:if>