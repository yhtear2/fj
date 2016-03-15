<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/defaultSetting.jsp"%>
    
<script type="text/javascript">


function delete_cacel() {
	
	 var fm = document.getElementById('recruit_resomelistdel');

	fm.submit();

}

function res() {
	var fm = document.getElementById('recruit_resomelist');
	var historySize = $('input[name=historySize]').val();
	for(var i=0; i<historySize; i++){
		var re_mail = $('input[name=re_email'+i+']').val();
		var email 	= $('input[name=email]').val();
		if( re_mail == email ){
			alert("이미 지원하셨습니다. 지원 취소후 다시 지원해주시기 바랍니다.");
    		return false;
		}
		
	}

   fm.submit();
    		
}

 

 function close_window() {
	 window.close();
 }
 

</script>

<form name="recruit_resomelist"  id="recruit_resomelist" method="post" action="recruit_resomeList_Pro.do">

<table class="table table-hover" style="margin-left: 20px; width:400px">
 <c:forEach var="i" begin="${1}" end="${get_history.size()}">
 	<input type="hidden" name="historySize" value="${get_history.size()}">
 	<input type="hidden" name="re_email${i}" value="${get_history[i].email}">
 	<input type="hidden" name="re_id${i}" value="${get_history[i].user_history_id}">
 <tr>
 	<th></th>
 	<td>
 		${rec_dto.email}		
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
 </form>
 
<form name="recruit_resomelistdel"  id="recruit_resomelistdel" method="post" action="recruit_resomeListDel_Pro.do">

 <table class="table table-hover" style="margin-left: 20px; width:400px">
  <c:forEach var="rec_dto" items="${get_history}" varStatus="status">
 	<tr>
 		<th>		 
 		</th>	 
 	</tr>
 	</c:forEach>
 	<tr>
		<td>
			<input  class="create btn btn-success btn-wide pull-right"  value="지원취소하기" onclick="delete_cacel()"> 
 	 	 	<input  class="create btn btn-success btn-wide pull-right"  type="button" value="창 닫기" onclick="close_window()">
 	 	 </td>
 	</tr>
 </table>
</form>




















