<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/defaultSetting.jsp"%> 

	<c:if test="${result == 1}">	
		<script type="text/javascript">
			<!--  
			alert( "정상적으로 지원이 완료되었습니다." );
			//-->
		</script>	
	</c:if>
	
	<c:if test="${result != 1}">	
		<script type="text/javascript">
			<!--  
			alert( "지원이 불가능합니다. 잠시 후 다시 시도하세요." );
			//-->
		</script>	
	</c:if>
	

<form onload="self.close();">

</form>