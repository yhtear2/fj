<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/defaultSetting.jsp"%>
    
<script type="text/javascript">

 function resome_list() {
	 var support;

	 document.recruit_resomelist.submit();

	 support=confirm("선택하신 이력서로 지원하시겠습니까?");
	 

	 if(support) {

			 alert("지원을 완료하였습니다.");		 
			 
			 
			window.close();
	 }
	 else {
		 alert("지원을 취소하였습니다.");
	 }
 }
 
 function close_window() {
	 window.close();
 }
 
 

</script>

<form name="recruit_resomelist" method="post" action="recruit_resomeList_Pro.do">
<c:forEach var="dto" items="${list}" varStatus="status">
<table class="table table-hover" style="margin-left: 20px; width:400px">

   <tr>
      <th style="width:100px;display: inline-block;">이력서제목</th>
		 <td class="form-control" style="text-align: center;  display: inline-block;"> 
 		 		<input type="hidden" name="resometitle" id="resometitle"value='${dto.resome_title}'>
 				${dto.resome_title}
		 	<input  class="create btn btn-success btn-wide pull-right"  type="submit" value="지원하기" >	 
		  </td>	     
   </tr>
 </table>
  </c:forEach>
  
 <table class="table table-hover" style="margin-left: 20px; width:400px">
 	<tr>
 		<th></th>
 	 		 <td><input  class="create btn btn-success btn-wide pull-right"  type="button" value="창 닫기" onclick="close_window()"></td>
 	</tr>
 </table>
 
 
</form>