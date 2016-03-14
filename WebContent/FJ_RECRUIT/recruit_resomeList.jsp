<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/defaultSetting.jsp"%>
    
<script type="text/javascript">


function delete_cacel() {

	
}

function res() {
	
	 var fm = document.getElementById('recruit_resomelist');
		

 	var cookie_email = document.getElementById('email').value;
 	var dto_email =document.getElementById('re_email').value;

 	
    	if(dto_email = cookie_email) {
    		
    		alert("이미 지원하셨습니다. 지원 취소후 다시 지원해주시기 바랍니다.");
    		
    		return false;
    		
    	} else { 
    		
    		fm.submit();
    		
    	}

}
    	
    	/* 	 var support;

	 support=confirm("선택하신 이력서로 지원하시겠습니까?");
	 

	 if(support) {

			 alert("지원을 완료하였습니다.");		 
			 
			window.close();
	 }
	 else {
		 alert("지원을 취소하였습니다.");
	 } */
 

 function close_window() {
	 window.close();
 }
 

</script>

<form name="recruit_resomelist"  id="recruit_resomelist" method="post" action="recruit_resomeList_Pro.do">

<table class="table table-hover" style="margin-left: 20px; width:400px">
 <c:forEach var="rec_dto" items="${get_history}" varStatus="status">
 <tr>
 <th></th>
 <td><input type="hidden" name="re_email" id="re_email" value=' ${rec_dto.email}'>${rec_dto.email}	<input type="hidden" name="re_id" id="re_id" value=' ${rec_dto.user_history_id}'>	
</td>
 </tr>
</c:forEach>

<c:forEach var="dto" items="${list}" varStatus="status">
    <tr>
      <th style="width:100px;display: inline-block;">이력서제목</th>
		 <td class="form-control" style="text-align: center;  display: inline-block;"> 
																		 		 		<input type="hidden" name="resometitle" id="resometitle"value='${dto.resome_title}'>
																		 		 		<input type="hidden" name="user_history_id" id="user_history_id"value='${dto.user_history_id}'>
																		 		 		 <input type="hidden" name="recruit_id" id="recruit_id" value='${recruit_id}'>	
																		 		 		  <input type="hidden" name="email" id="email" value='${email}'>		
 				${dto.resome_title}
		 	<input  class="create btn btn-success btn-wide pull-right"    id="res1" value="지원하기" onclick="res()">	 
		  </td>	     
   </tr>


</c:forEach>
 </table>
 
 <table class="table table-hover" style="margin-left: 20px; width:400px">
  <c:forEach var="rec_dto" items="${get_history}" varStatus="status">
 	<tr>
 		<th>		 
 		</th>
 	 		 <td>
 	 		  <input  class="create btn btn-success btn-wide pull-right"  type="button" value="지원취소하기" onclick="">
 	 		 
 	 		 <input  class="create btn btn-success btn-wide pull-right"  type="button" value="창 닫기" onclick="close_window()"></td>
 	</tr>
 	</c:forEach>
 	
 </table>
</form>




















