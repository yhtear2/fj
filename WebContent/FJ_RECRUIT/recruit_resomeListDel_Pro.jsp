<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/defaultSetting.jsp"%> 

	<c:if test="${result1 == 1}">	
		<script type="text/javascript">
			<!--  
			alert( "정상적으로 삭제되었습니다" );
			//-->
		</script>	
	</c:if>
	
	<c:if test="${result1 != 1}">	
		<script type="text/javascript">
			<!--  
			alert( "정상적으로 삭제안되었읍니다." );
			//-->
		</script>	
	</c:if>
	

<form onload="self.close();">



</form>