<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<script src="/fj/FJ_RECRUIT/recruit.js"></script>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		alert("글 작성에 실패했습니다. \n 잠시 후 다시 시도해 주세요");
		//-->
	</script>
</c:if>

<c:if test="${result != 0}">
	<input type="hidden" id="messageContent" value="${messageContent}">
	<input type="hidden" id="emails" value="${emails}">
	<script type="text/javascript">
	<!--
 	$.cookie('msg', $('input[id=messageContent]').val() );
	$.cookie('emails', $('input[id=emails]').val());
	$.cookie('resetPage', '1');
	window.location.href='recruitList.do';
	//-->
</script>
</c:if>