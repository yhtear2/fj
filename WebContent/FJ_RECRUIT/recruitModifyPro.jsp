<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="/fj/FJ_RECRUIT/recruit.js"></script>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		alert("글 수정에 실패했습니다. \n 잠시 후 다시 시도해 주세요");
		//-->
	</script>
</c:if>

<c:if test="${result != 0}">
	<input type="hidden" id="msg" value="${msg}">
	<input type="hidden" id="email" value="${email}">
	<script type="text/javascript">
	<!--
	//alert("쪽지 전송에 성공 했습니다.");
	//$.cookie('msg', $('input[id=msg]').val() );
	window.location.href='recruitList.do';
	//-->
</script>
</c:if>