<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/fj/jquery-1.12.0.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="/fj/FJ_USER/resome/style.css" rel="stylesheet" type="text/css">

<script src="/fj/FJ_USER/resome/request.js"></script>


<script type="text/javascript">
	<!--	
	var count = 1;
	var cnt = 1;
	var request = null;
	
	window.onload = function() {
		listComment();
	}
	function listComment() {
		request = new Request( listResult,"resume.jsp" );
		request.sendRequest();	
	}
	function listResult() {
		var debug = document.getElementById( "debug" );
		if( request.httpRequest.readyState == 4 ) {
			if( request.httpRequest.status == 200 ) {
					
					debug.innerHTML = "";
		
					
				} else {
					debug.innerHTML = request.httpRequest.status + " : 에러발생";	
				}			
			} else {
				debug.innerHTML = request.httpRequest.readyState + " : 통신중";	
			}		
	}
		
	function addForm() {
		


	var addedFormDiv = document.getElementById("addedFormDiv");

		var str = "";
		str += count;
		str += "<h5> 대학교 / 대학원 </h5>";
		str += "<table id='mytable'>";
		str += "<tr>";
		str += "<th style='width:100px'>분류</th>";
		str += "<td style='width: 520px'>";
		str += "<input type='radio' name='daehakkyo' value='school'/>&nbsp; 대학교 &nbsp;&nbsp; &nbsp;&nbsp;";
		str += "<input type='radio' name='daehakwon' value='hakwon'/>&nbsp; 대학원";

		str += "</td>";

		str += "<tr>";
		str += "<th style='width:100px'>재학기간</th>";
		str += "<td style='width: 520px'>";
		str += "<input class='input' type='date' style='width:150px' name='year1' maxlength='3'> ~";
		str += "<input class='input' type='date' style='width:150px' name='year2' maxlength='3'>";
		str += "<select class='input' style='width: 80px' name='shcool'>";

		str += "<option value='naver.com'>입학</option>";
		str += "<option value='daum.net'>편입</option>";
		str += "</select>";
		str += "	<select class='input' style='width: 80px' name='shcool'>";

		str += "	<option value='naver.com'>졸업예정</option>";
		str += "	<option value='daum.net'>졸업</option>";
		str += "	<option value='naver.com'>재학중</option>";
		str += "<option value='naver.com'>휴학중</option>";
		str += "<option value='naver.com'>수료</option>";
		str += "<option value='naver.com'>중퇴</option>";
		str += "<option value='daum.net'>자퇴</option>";
		str += "	</select>";
		str += "</td>";

		str += "</tr>";

		str += "<tr>";
		str += "<th>학교명</th>";
		str += "<td> <input class='input' type='text' style='width:200px' name='year2' maxlength='3'>";
		str += "</td>";

		str += "</tr>";
		str += "<tr>		";
		str += "<th>전공</th>";
		str += "<td> <input class='input' type='text' style='width:200px' name='year2' maxlength='3'>";
		str += "</td>";

		str += "</tr>";
		str += "<tr>";
		str += "<th>학점</th>";
		str += "<td> <input class='input' type='number' style='width:60px' name='year2' maxlength='3'> / ";
		str += "<input class='input' type='number' style='width:60px' name='year2' maxlength='3'>";
		str += "</td>";
		str += "</tr>";
		str += "</table>";

		var addedDiv = document.createElement("div");
		addedDiv.id = "added_" + count;
		addedDiv.innerHTML = str;
		addedFormDiv.appendChild(addedDiv);

		count++;
		document.baseForm.count.value = count;

	}

	function delForm() {
		var addedFormDiv = document.getElementById("addedFormDiv");

		if (count > 2) {
			var addedDiv = document.getElementById("added_" + (--count));
			if (confirm("삭제하시겠습니까?")) {
				addedFormDiv.removeChild(addedDiv);
			}
		} else {
			document.baseForm.reset();
		}

	}
	
	function license_addform() {
		
		var addlicense = document.getElementById("addlicense");
		var str = "";
		str += cnt;
		str += "<table>";
		str += "<tr>";
		str += "	<th style='width:89px'>자격증</th>";
		str += "		<td colspan='2'> <input class='input' type='text' style='width:300px' name='year2'>";
		str += "			<input class='inputbutton' type='submit' value='검색'>";
		str += "			<input class='inputbutton' type='reset' value='추가'>";
		str += "			<input class='inputbutton' type='reset' value='삭제'>";
		str += "		</td>";
		str += "</tr>";
		str += "</table>";

		var addedDiv = document.createElement("div");
		addedDiv.id = "added_" + cnt;
		addedDiv.innerHTML = str;
		addlicense.appendChild(addedDiv);

		cnt++;
		document.baseForm2.cnt.value = cnt;
	}

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                if (data.userSelectedType === 'R') {
                    fullAddr = data.roadAddress;

                } else {
                    fullAddr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){

                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }

                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }

                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById('address1').value = fullAddr;

                document.getElementById('address2').focus();
            }
        }).open();
    }
	
    function conf_skill() {
    	var url = "confirm_skill.jsp";
    	open( url,"confrimWindow", 
		"menubar=no, statusbar=no, scrollbar=no, toolbar=no, width=300, height=200");
    }
	
	
//-->
</script>

<h2>이력서</h2>

<h3>이력서제목</h3>
<table>
	<tr>
		<td><input class="input" type="text" name="name"
			style="width: 650px" maxlength="40"></td>
	</tr>

</table>

<h3>개인정보</h3>
<table>

	<tr>

		<th style="width:200px">이름</th>
		<td style="width:520px"><input class="input" type="text" style="width: 250px" name="tel1" maxlength="3"></td>	
		
		<td rowspan="6"><img src="4.png" style="margin-left: auto; margin-right: auto; display: block; width:150px; height:190px;"/></td>	
		

	</tr>
	<tr>

		<th>이름(영문)</th>
		<td><input class="input" type="text" style="width: 250px" name="tel1" maxlength="3"></td>


	</tr>

	<tr>

		<th>주소</th>
		<td><input class="input" type="text" style="width: 120px" id="postcode" maxlength="3">
		<input class="inputbutton" type="submit" style="width: 100px" value="우편번호 찾기" onclick="execDaumPostcode()">
		<input class="input" type="text" style="width: 190px" id="address1" maxlength="3">&nbsp;
		<input class="input" type="text" style="width: 150px" id="address2" maxlength="3">
		</td>


	</tr>

	<tr>
		<th>전화번호</th>
			<td><input class="input" type="text" style="width: 60px" name="tel1" maxlength="3"> - 
			    <input class="input" type="text" style="width: 65px" name="tel2" maxlength="3"> -
				<input class="input" type="text" style="width: 70px" name="tel3" maxlength="3"></td>
	</tr>

	<tr>
		<th>생년월일</th>
			<td><input class="input" type="date" name="tel1" maxlength="3" style="width:200px"></td>
	</tr>
	
	<tr>
		<th> 병역사항 </th>
			<td>
				<select class="input" style="width: 80px" name="shcool">
					<option value="0">해당없음</option>
					<option value="0">군필</option>		
					<option value="0">미필</option>
					<option value="0">면제</option>
				</select>
				<input class="input" type="date" style="width:125px" name="year1" maxlength="3"> ~
				<input class="input" type="date" style="width:125px" name="year2" maxlength="3">
				
				<select class="input" style="width: 80px" name="shcool">
					<option value="0">군별선택</option>
					<option value="0">육군</option>		
					<option value="0">해군</option>
					<option value="0">공군</option>
					<option value="0">해병</option>
					<option value="0">의경</option>		
					<option value="0">전경</option>
					<option value="0">공익</option>
				</select>	
							
				<select class="input" style="width: 80px" name="shcool">
					<option value="0">계급선택</option>
					<option value="0">이병</option>		
					<option value="0">일병</option>
					<option value="0">상병</option>
					<option value="0">병장</option>
					<option value="0">하사</option>		
					<option value="0">중사</option>
					<option value="0">상사</option>
					<option value="0">원사</option>
					<option value="0">준위</option>
					<option value="0">소위</option>		
					<option value="0">중위</option>
					<option value="0">대위</option>
					<option value="0">소령</option>
					<option value="0">중령</option>		
					<option value="0">대령</option>
					<option value="0">준장</option>
					<option value="0">소장</option>
					<option value="0">중장</option>		
					<option value="0">대장</option>					
				</select>						
				<select class="input" style="width: 80px" name="shcool">
					<option value="0">전역사유</option>
					<option value="0">만기제대</option>		
					<option value="0">의가사제대</option>
					<option value="0">의병제대</option>
					<option value="0">소집해제</option>
					<option value="0">불명예제대</option>		
					<option value="0">상이제대</option>	
					<option value="0">기타</option>	
				</select>	<pre></pre>	
				&nbsp; 미필,면제,기타사유 : 	<input class="input" type="text" style="width:260px" name="year2" maxlength="3">
			</td>
	</tr>
	<tr>
		<th></th>
			<td> </td>
			<td>	
				&nbsp;&nbsp;&nbsp;
				<input class="inputbutton" type="submit" value="사진등록">
				<input class="inputbutton" type="reset" value="취소">
					</td>
		</tr>

</table>

<table>

		<tr>
			<th style="width:89px">보유기술</th>
				<td colspan="2"> <input class="input" type="text" style="width:460px" name="year2">
					<input class="inputbutton" type="submit" value="검색" onclick="conf_skill()">
				</td>
		</tr>	
</table>



<form name="baseForm2"  method="post" onload="license_addform();">
<input type="hidden" name="cnt" value="0">
           <div id="addlicense"></div> <br>
	<table>
		<tr>
			<th style="width:89px">자격증</th>
				<td colspan="2"> <input class="input" type="text" style="width:300px" name="year2">
					<input class="inputbutton" type="submit" value="검색">
				    <input  class="inputbutton"  type="button" value="추가" onclick="license_addform()">
					<input class="inputbutton" type="reset" value="삭제">
				</td>
		</tr>
	</table>		
</form>


<br>

<h3>학력사항</h3>

<h5>고등학교</h5>
<div>
<table>

	<tr>
		<th style="width:100px">재학기간</th>
			<td style="width: 520px">
				<input class="input" type="date" style="width:210px" name="year1"> ~
				<input class="input" type="date" style="width:210px" name="year2">
				
				<select class="input" style="width: 80px" name="shcool">
				
						   <option value="naver.com">졸업</option>
						<option value="daum.net">졸업예정</option>		
				</select>			
			</td>
	</tr>
	
	<tr>		
		<th>학교명</th>
		<td> <input class="input" type="text" style="width:200px" name="year2" maxlength="3">
			<select class="input" style="width: 80px" name="shcool1">
				<option value="0">문과계열</option>
				<option value="0">이과계열</option>		
				<option value="0">전문(실업)계열</option>
				<option value="0">예체능계열</option>	
			</select>	
		</td>
	</tr>
	</table>
 </div>	
           
<body>
<form name="baseForm"  method="post" onload="addForm();">
<input type="hidden" name="count" value="0">
           <div id="addedFormDiv"></div> <br>
         	<table>
	         	<tr>
		         	<th style="width:100px">학력추가 </th>
			         	<td>
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				           <input  class="inputbutton"  type="button" value="추가" onclick="addForm()">
				           <input  class="inputbutton"  type="button" value="삭제" onclick="delForm()">
			           </td>
	           </tr>
	
		</table>
	
         
</form>
</body>
<br>

<h3> 포트폴리오 </h3>

<table>
	<tr>
		<th> <input  type="file" name="file"> </th>
	</tr>	
</table>
<br>
<table>
	<tr>
	<th></th>
		<td colspan="2"> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <input  class="inputbutton"  type="reset" value="초기화" style="width:200px">
		 <input  class="inputbutton"  type="button" value="저장후 다음단계로" style="width:200px" onclick="window.location='career.jsp'"></td>
	</tr>
</table>





