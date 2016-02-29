<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script src="/fj/jquery-1.12.0.js"></script>
<script src="/fj/FJ_USER/resome.js"></script>
<link href="/fj/FJ_USER/style.css" rel="stylesheet" type="text/css">
<script src="/fj/FJ_USER/request.js"></script>
<script src="/fj/jquery.cookie.js"></script>

<script type="text/javascript">
	var request = null;
	var count = 1;

	
	window.onload = function() {
		listComment();
	}
	function listComment() {
		request = new Request( listResult,"career.jsp" );
		request.sendRequest();	
	}
	function listResult() {
		var debug = document.getElementById( "debug" );
		if( request.httpRequest.readyState == 4 ) {
			if( request.httpRequest.status == 200 ) {
				debug.innerHTML = "정상종료";
		
				} else {
					debug.innerHTML = request.httpRequest.status + " : 에러발생";	
				}			
			} else {
				debug.innerHTML = request.httpRequest.readyState + " : 통신중";	
			}		
	}

	function chk() {
		var obj = window.event.srcElement;
		var addedFor = document.getElementById("career_addFormdiv");
		
		if (obj.type == "radio" && obj.name == "career_solt" && obj.value=="2") {
			
			career_table.style.display = 'block';
			 // table2.style.display = 'block';
			  addedFor.style.display = 'block';
			  
		 }
		if (obj.type == "radio" && obj.name == "career_solt" && obj.value=="1") {

			career_table.style.display = 'none';
			 // table2.style.display = 'none';
			  addedFor.style.display = 'none';
		 }
	}
	
	function career_addForm() {

        var career_addFormdiv = document.getElementById("career_addFormdiv");

        var str = "";
		str +=count;      
        str +="<table id='career_table1' class='table table-hover'>";
        str +="<tr>";
        str +="	<th style='width:150px'>회사명 : </th>";
        str +="	<td style='width: 250px'><input class='form-control' type='text' style='width: 250px' name='career_comp_name'></td>";
        str +="</tr>";
        str +="<tr>";
        str +="	<th style='width:150px'>근무기간</th>";
        str +="	<td style='width: 250px'>";
        str +="    				<input class='form-control' type='text' style='width:165px' name='career_start_date'> ~";
        str +="    				<input class='form-control' type='date' style='width:165px' name='career_last_date'>";
        str +="    				<select class='' style='width: 80px' name='career_kind'>			";	
        str +="    					<option value='퇴사'>퇴사</option>";
        str +="    					<option value='재직중'>재직중</option>		";
        str +="    				</select>";		
        str +="    			</td>";
        str +="    	</tr>";
        str +="    	<tr>";
        str +="    		<th>부서명 : </th>";
        str +="	<td style='width: 250px'><input class='form-control' style='width:165px' type='text' name='career_department'>";
        str +="    			<select class='' style='width: 80px' name='career_position1'>";				
        str +="    				<option value='직급선택'>직급선택</option>";
        str +="    				<option value='사원'>사원(연구원)</option>";
        str +="    				<option value='주임/계장(연구원)'>주임/계장(연구원)</option>";		
        str +="    				<option value='대리(주임연구원)'>대리(주임연구원)</option>";
        str +="   				<option value='과장(선임연구원)'>과장(선임연구원)</option>";
        str +="   				<option value='차장(수석연구원)'>차장(수석연구원)</option>";
        str +="   				<option value='부장(연구소장)'>부장(연구소장)</option>";
        str +="   				<option value='임원'>임원</option>";
        str +="    			</select>";
        str +="    			<select class='' style='width: 80px' name='career_position2'>";				
        str +="    				<option value='직책선택'>직책선택</option>";
        str +="<option value='팀원'>팀원</option>";
        str +="<option value='팀장'>팀장</option>";		
        str +="<option value='매니저'>매니저</option>";
        str +="<option value='파트장'>파트장</option>";
        str +="<option value='실장'>실장</option>";
        str +="<option value='지점장'>지점장</option>";
        str +="<option value='지사장'>지사장</option>";
        str +="<option value='원장'>원장</option>";
        str +="<option value='국장'>국장</option>";
        str +="<option value='본부장'>본부장</option>";
        str +="<option value='센터장'>센터장</option>";
        str +="<option value='공장장'>공장장</option>";
        str +="<option value='그룹장'>그룹장</option>";
        str +="</select>			";
        str +="	</td>";
        str +="</tr>";	
        str +="    	<tr>";
        str +="    		<th>급여/연봉 : </th>";
        str +="<td style='width: 260px'><input class='form-control' type='text' style='width: 250px' name='career_salary'>";
        str +="&nbsp;&nbsp; 만원단위로 입력하세요. &nbsp; (ex:2500만원)";
        str +="</td>";
        str +="    	</tr>";		

        str +="<tr>";
        str +="    		<th>퇴사사유 </th>";
        str +="<td style='width:250px'><input class='form-control' type='text' style='width: 250px' name='career_resign'>";

        str +="	</td>";
        str +="</tr>	";	
    		
        str +="<tr>";
        str +="	<th>담당업무(언어) : </th>";
        str +="	<td style='width:250px'><input class='form-control' type='text' style='width: 250px' name='career_work'>";

        str +="	</td>";
        str +="   	</tr>";				
        str +="   	<tr>";
        str +="   		<th> 수행내용 : </th>";
    	str +="   		<td>";
    	str +="    		<textarea name='career_content' rows='9' cols='55'></textarea>";
    	str +="   		</td>";
    	str +="    	</tr>		";
    	str +="<tr>";
    	str +="<th style='width:150px'>경력추가 </th>";
    	str +="<td>";
    	str +="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ";
    	str +="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ";
    	str +="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    	str +="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
    	str +="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
      
    	str +="<input  class='btn btn-default'  type='button' value='추가' onclick='career_addForm()'>";
    	str +="<input  class='btn btn-default'  type='button' value='삭제' onclick='career_deleForm()'>";
    	str +="</td>";
    	str +="   </table>";


	var addedDiv = document.createElement("div");
		addedDiv.id = "added_" + count;
		addedDiv.innerHTML = str;
		career_addFormdiv.appendChild(addedDiv);

		count++;
		document.career_Form.count.value = count;
		
		var addedDiv = document.createElement("div");
		addedDiv.id = "added_" + count;
		addedDiv.innerHTML = str;
		addedFormDiv.appendChild(addedDiv);

		count++;
		document.baseForm.count.value = count;

	}

	function career_deleForm() {
		var career_addFormdiv = document.getElementById("career_addFormdiv");

		if (count > 1) {
			var addedDiv = document.getElementById("added_" + (--count));
			if (confirm("삭제하시겠습니까?")) {
				career_addFormdiv.removeChild(addedDiv);
			}
		} else {
			document.career_Form.reset();
		}
	}
	
	function change(sel) {
		
		var IdNum = sel.options[sel.selectedIndex].value;
		var career_last_date = document.getElementById("career_last_date");
	    var d = new Date();
		 
	    var s =
	        leadingZeros(d.getFullYear(), 4) + '-' +
	        leadingZeros(d.getMonth() + 1, 2) + '-' +
	        leadingZeros(d.getDate(), 2);

		
		if (IdNum == "2") {
			career_last_date.value = s;
		}
		
		else if (IdNum == "1") {
			career_last_date.value = "";
			}
	}
	
	function leadingZeros(n, digits) {
	    var zero = '';
	    n = n.toString();
	 
	    if (n.length < digits) {
	        for (i = 0; i < digits - n.length; i++)
	            zero += '0';
	    }
	    return zero + n;
	}


</script>

<h2> 경력사항 </h2>
<form name="career_Form"  method="post" onload="career_addForm();">
<input type="hidden" name="count" value="0">


<table>
	<tr>
		<th> 신입 / 경력 </th>
			<td> &nbsp;&nbsp;&nbsp;&nbsp;신입 : <input type="radio" name="career_solt" id="career_solt" value="1" onclick="chk()"> &nbsp;&nbsp;&nbsp;
			경력 : <input type="radio" name="career_solt" id="career_solt" value="2" onclick="chk()"></td>		
					
	</tr>

</table>

<table class="table table-hover" id="career_table" style="display:none;">

	<tr>
		<th style="width:150px">회사명 : </th>
		<td style="width: 250px"><input class="form-control" type="text" style="width: 250px" name="career_comp_name"></td>
	</tr>
	<tr>
		<th style="width:150px">근무기간</th>
			<td style="width: 250px">
				<input class="form-control" type="text" style="width:150px" name="career_start_date" > ~
				<input class="form-control" type="text" style="width:150px" name="career_last_date"  value="" id="career_last_date">
				<select class="input" style="width: 80px" name="career_kind" onChange="change(this)">				
					<option value="1">퇴사</option>
					<option value="2">재직중</option>		
				</select>		
			</td>
	</tr>
	<tr>
		<th style="width:150px">부서명 : </th>
		<td style="width: 250px"><input class="form-control" type="text" style="width: 250px" name="career_department">
			<select class="" style="width: 80px" name="career_position1">				
				<option value="직급선택">직급선택</option>
				<option value="사원(연구원)">사원(연구원)</option>
				<option value="주임/계장(연구원)">주임/계장(연구원)</option>		
				<option value="대리(주임연구원)">대리(주임연구원)</option>
				<option value="과장(선임연구원)">과장(선임연구원)</option>
				<option value="차장(수석연구원)">차장(수석연구원)</option>
				<option value="부장(연구소장)">부장(연구소장)</option>
				<option value="임원">임원</option>
			</select>
			<select class="" style="width: 80px" name="career_position2">				
				<option value="직책선택">직책선택</option>
				<option value="팀원">팀원</option>
				<option value="팀장">팀장</option>		
				<option value="매니저">매니저</option>
				<option value="파트장">파트장</option>
				<option value="실장">실장</option>
				<option value="지점장">지점장</option>
				<option value="지사장">지사장</option>
				<option value="원장">원장</option>
				<option value="국장">국장</option>
				<option value="본부장">본부장</option>
				<option value="센터장">센터장</option>
				<option value="공장장">공장장</option>
				<option value="그룹장">그룹장</option>
			</select>			
		</td>
	</tr>	
	<tr>
		<th style="width:150px">급여/연봉 : </th>
		<td style="width: 250px"><input class="form-control" type="number" style="width: 250px" name="career_salary">
		&nbsp;&nbsp; 만원단위로 숫자만 입력하세요. &nbsp; (ex:2500)
		</td>
	</tr>		

	<tr>
		<th style="width:150px">퇴사사유 </th>
		<td style="width: 250px"><input class="form-control" type="text" style="width: 250px" name="career_resign">

		</td>
	</tr>		
		
	<tr>
		<th style="width:150px">담당업무(언어) : </th>
		<td style="width: 250px"><input class="form-control" type="text" style="width: 250px" name="career_work">

		</td>
	</tr>				

	<tr>
		<th style="width:150px"> 수행내용 : </th>
		<td>
		<textarea name="career_content" rows="9" cols="55"></textarea>
		</td>
	</tr>		

         	<tr>
         	<th style="width:150px">경력추가 </th>
         	<td>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
           <input  class="btn btn-default"  type="button" value="추가" onclick="career_addForm()">
           <input  class="btn btn-default"  type="button" value="삭제" onclick="career_deleForm()">
           </td>
		</table>
		  

	<div id="career_addFormdiv"></div> <br>

</form>

<table>
	<tr>
		<th colspan="2"> </th>
		<td> <input  class="btn btn-default" type="button" value="이력서 수정" onclick="window.location='resome.do'">
		&nbsp;&nbsp; <input  class="btn btn-default" type="button" value="경력사항 저장"></td>
	</tr>
</table>