<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/ResomeEx/jquery-1.12.0.js"></script> 
<link href="/ResomeEx/style.css" rel="stylesheet" type="text/css">
<script src="/ResomeEx/request.js"></script>   

<script type="text/javascript">
	<!--	
	var request = null;
	var count = 0;

	
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
		var addedFor = document.getElementById("addedFormDiv");
		
		if (obj.type == "radio" && obj.name == "rad" && obj.value=="2") {
			
			  table1.style.display = 'block';
			  table2.style.display = 'block';
			  addedFor.style.display = 'block';
			  
		 }
		if (obj.type == "radio" && obj.name == "rad" && obj.value=="1") {

			  table1.style.display = 'none';
			  table2.style.display = 'none';
			  addedFor.style.display = 'none';
		 }
	}
	
	function addForm() {

        var addedFormDiv = document.getElementById("addedFormDiv");
        
        var str = "";
		str +=count;      
        str +="<table>";
        str +="<tr>";
        str +="	<th>회사명 : </th>";
        str +="	<td style='width: 520px'><input class='input' type='text' style='width: 250px' name='tel1' maxlength='3'></td>";
        str +="</tr>";
        str +="<tr>";
        str +="	<th>근무기간</th>";
        str +="	<td style='width: 520px'>";
        str +="    				<input class='input' type='date' style='width:165px' name='year1' maxlength='3'> ~";
        str +="    				<input class='input' type='date' style='width:165px' name='year2' maxlength='3'>";
        str +="    				<select class='input' style='width: 80px' name='shcool'>			";	
        str +="    					<option value='naver.com'>퇴사</option>";
        str +="    					<option value='daum.net'>재직중</option>		";
        str +="    				</select>";		
        str +="    			</td>";
        str +="    	</tr>";
        str +="    	<tr>";
        str +="    		<th>부서명 : </th>";
        str +="	<td style='width: 520px'><input class='input' type='text' style='width: 250px' name='tel1' maxlength='3'>";
        str +="    			<select class='input' style='width: 80px' name='shcool'>";				
        str +="    				<option value='naver.com'>직급선택</option>";
        str +="    				<option value='daum.net'>사원(연구원)</option>";
        str +="    				<option value='daum.net'>주임/계장(연구원)</option>";		
        str +="    				<option value='daum.net'>대리(주임연구원)</option>";
        str +="   				<option value='daum.net'>과장(선임연구원)</option>";
        str +="   				<option value='daum.net'>차장(수석연구원)</option>";
        str +="   				<option value='daum.net'>부장(연구소장)</option>";
        str +="   				<option value='daum.net'>임원</option>";
        str +="    			</select>";
        str +="    			<select class='input' style='width: 80px' name='shcool'>";				
        str +="    				<option value='naver.com'>직책선택</option>";
        str +="<option value='daum.net'>팀원</option>";
        str +="<option value='daum.net'>팀장</option>";		
        str +="<option value='daum.net'>매니저</option>";
        str +="<option value='daum.net'>파트장</option>";
        str +="<option value='daum.net'>실장</option>";
        str +="<option value='daum.net'>지점장</option>";
        str +="<option value='daum.net'>지사장</option>";
        str +="<option value='daum.net'>원장</option>";
        str +="<option value='daum.net'>국장</option>";
        str +="<option value='daum.net'>본부장</option>";
        str +="<option value='daum.net'>센터장</option>";
        str +="<option value='daum.net'>공장장</option>";
        str +="<option value='daum.net'>그룹장</option>";
        str +="</select>			";
        str +="	</td>";
        str +="</tr>";	
        str +="    	<tr>";
        str +="    		<th>급여/연봉 : </th>";
        str +="<td style='width: 520px'><input class='input' type='text' style='width: 250px' name='tel1' maxlength='3'>";
        str +="&nbsp;&nbsp; 만원단위로 입력하세요. &nbsp; (ex:2500만원)";
        str +="</td>";
        str +="    	</tr>";		

        str +="<tr>";
        str +="    		<th>퇴사사유 </th>";
        str +="<td style='width: 520px'><input class='input' type='text' style='width: 250px' name='tel1' maxlength='3'>";

        str +="	</td>";
        str +="</tr>	";	
    		
        str +="<tr>";
        str +="	<th>담당업무(언어) : </th>";
        str +="	<td style='width: 520px'><input class='input' type='text' style='width: 250px' name='tel1' maxlength='3'>";

        str +="	</td>";
        str +="   	</tr>";				
        str +="   	<tr>";
        str +="   		<th> 수행내용 : </th>";
    	str +="   		<td>";
    	str +="    		<textarea name='intro' rows='9' cols='55'></textarea>";
    	str +="   		</td>";
    	str +="    	</tr>		";
    	str +="   </table>";


	var addedDiv = document.createElement("div");
		addedDiv.id = "added_" + count;
		addedDiv.innerHTML = str;
		addedFormDiv.appendChild(addedDiv);

		count++;
		document.baseForm.count.value = count;

	}

	function delForm() {
		var addedFormDiv = document.getElementById("addedFormDiv");

		if (count > 0) {
			var addedDiv = document.getElementById("added_" + (--count));
			if (confirm("삭제하시겠습니까?")) {
				addedFormDiv.removeChild(addedDiv);
			}
		} else {
			document.baseForm.reset();
		}
	}
	
	function change(sel) {
		
		var IdNum = sel.options[sel.selectedIndex].value;
		var geunmu = document.getElementById("geunmu");
	    var d = new Date();
		 
	    var s =
	        leadingZeros(d.getFullYear(), 4) + '-' +
	        leadingZeros(d.getMonth() + 1, 2) + '-' +
	        leadingZeros(d.getDate(), 2);

		
		if (IdNum == "2") {
			geunmu.value = s;
		}
		
		else if (IdNum == "1") {
				geunmu.value = "";
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


	//-->
</script>

<h2> 경력사항 </h2>
<table>
	<tr>
		<th> 신입 / 경력 </th>
			<td style="width: 520px"> &nbsp;&nbsp;&nbsp;&nbsp;신입 : <input type="radio" name="rad" value="1" onclick="chk()"> &nbsp;&nbsp;&nbsp;
			경력 : <input type="radio" name="rad" value="2" onclick="chk()"></td>		
					
	</tr>

</table>

<table id="table1" style="display:none;">

	<tr>
		<th>회사명 : </th>
		<td style="width: 520px"><input class="input" type="text" style="width: 250px" name="tel1" maxlength="3"></td>
	</tr>
	<tr>
		<th>근무기간</th>
			<td style="width: 520px">
				<input class="input" type="date" style="width:165px" name="year1" maxlength="3"> ~
				<input class="input" type="date" style="width:165px" name="year2" maxlength="3" value="" id="geunmu">
				<select class="input" style="width: 80px" name="shcool11" onChange="change(this)">				
					<option value="1">퇴사</option>
					<option value="2">재직중</option>		
				</select>		
			</td>
	</tr>
	<tr>
		<th>부서명 : </th>
		<td style="width: 520px"><input class="input" type="text" style="width: 250px" name="tel1" maxlength="3">
			<select class="input" style="width: 80px" name="shcool">				
				<option value="naver.com">직급선택</option>
				<option value="daum.net">사원(연구원)</option>
				<option value="daum.net">주임/계장(연구원)</option>		
				<option value="daum.net">대리(주임연구원)</option>
				<option value="daum.net">과장(선임연구원)</option>
				<option value="daum.net">차장(수석연구원)</option>
				<option value="daum.net">부장(연구소장)</option>
				<option value="daum.net">임원</option>
			</select>
			<select class="input" style="width: 80px" name="shcool">				
				<option value="naver.com">직책선택</option>
				<option value="daum.net">팀원</option>
				<option value="daum.net">팀장</option>		
				<option value="daum.net">매니저</option>
				<option value="daum.net">파트장</option>
				<option value="daum.net">실장</option>
				<option value="daum.net">지점장</option>
				<option value="daum.net">지사장</option>
				<option value="daum.net">원장</option>
				<option value="daum.net">국장</option>
				<option value="daum.net">본부장</option>
				<option value="daum.net">센터장</option>
				<option value="daum.net">공장장</option>
				<option value="daum.net">그룹장</option>
			</select>			
		</td>
	</tr>	
	<tr>
		<th>급여/연봉 : </th>
		<td style="width: 520px"><input class="input" type="number" style="width: 250px" name="tel1" maxlength="3">
		&nbsp;&nbsp; 만원단위로 숫자만 입력하세요. &nbsp; (ex:2500)
		</td>
	</tr>		

	<tr>
		<th>퇴사사유 </th>
		<td style="width: 520px"><input class="input" type="text" style="width: 250px" name="tel1" maxlength="3">

		</td>
	</tr>		
		
	<tr>
		<th>담당업무(언어) : </th>
		<td style="width: 520px"><input class="input" type="text" style="width: 250px" name="tel1" maxlength="3">

		</td>
	</tr>				

	<tr>
		<th> 수행내용 : </th>
		<td>
		<textarea name="intro" rows="9" cols="55"></textarea>
		</td>
	</tr>		
</table>

<body>
<form name="baseForm"  method="post" onload="addForm();">
<input type="hidden" name="count" value="0">
           <div id="addedFormDiv"></div> <br>
         	<table id="table2" style="display:none;">
         	<tr>
         	<th width="110px">경력추가 </th>
         	<td>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
           <input  class="inputbutton"  type="button" value="추가" onclick="addForm()">
           <input  class="inputbutton"  type="button" value="삭제" onclick="delForm()">
           </td>
		</table>
         
</form>
</body>

<br>


<div>
	<tr>
		<th colspan="2"> </th>
		<td> <input  class="inputbutton"  type="button" value="이력서 수정" onclick="window.location='resume.jsp'"></td>
	</tr>
</div>