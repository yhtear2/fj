<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="setting.jsp"%>
<script src="/fj/FJ_USER/resome.js"></script>
<script src="/fj/jquery-1.12.0.js"></script>
<link href="/fj/FJ_USER/style.css" rel="stylesheet" type="text/css">
<script src="/fj/FJ_USER/request.js"></script>


<script type="text/javascript">
	<!--	
	var count = 1;
	var cnt = 1;
	var request = null;
	
	window.onload = function() {
		listComment();
	}
	function listComment() {
		request = new Request( listResult,"resome.jsp" );
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
		


	$.fn.setPreview = function(opt) {
		"use strict"
		var defaultOpt = {
			inputFile : $(this),
			img : null,
			w : 200,
			h : 200
		};
		$.extend(defaultOpt, opt);

		var previewImage = function() {
			if (!defaultOpt.inputFile || !defaultOpt.img)
				return;

			var inputFile = defaultOpt.inputFile.get(0);
			var img = defaultOpt.img.get(0);

			// FileReader
			if (window.FileReader) {
				// image 파일만
				if (!inputFile.files[0].type.match(/image\//))
					return;

				// preview
				try {
					var reader = new FileReader();
					reader.onload = function(e) {
						img.src = e.target.result;
						img.style.width = defaultOpt.w + 'px';
						img.style.height = defaultOpt.h + 'px';
						img.style.display = '';
					}
					reader.readAsDataURL(inputFile.files[0]);
				} catch (e) {
					// exception...
				}
				// img.filters (MSIE)
			} else if (img.filters) {
				inputFile.select();
				inputFile.blur();
				var imgSrc = document.selection.createRange().text;

				img.style.width = defaultOpt.w + 'px';
				img.style.height = defaultOpt.h + 'px';
				img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
						+ imgSrc + "\")";
				img.style.display = '';
				// no support
			} else {
				// Safari5, ...
			}
		};

		// onchange
		$(this).change(function() {
			previewImage();
		});
	};

	$(document).ready(function() {
		var opt = {
			img : $('#img_preview'),
			w : 200,
			h : 200
		};

		$('#input_file').setPreview(opt);
	});

	
	function submitcheck() {
		var name = [];
		var names = $('input[name=school_name]');
		alert(names.length + "");
		for (var i = 0; i < names.length; i++) {
			name[i] = names.eq(i).val();
		}
		$('input[name=school_name_send]').val(name);
		alert($('input[name=school_name_send]').val());
	}

	function addForm() {

		var addedFormDiv = document.getElementById("addedFormDiv");

		var str = "";
		str += count;
		str += "<h5> 대학교 / 대학원 </h5>";
		str += "<table class='table table-hover'  id='mytable' style='width:800px'>";
		str += "<tr>";
		str += "<th style='width:100px'>분류</th>";
		str += "<td style='width: 520px'>";
		str += "<input type='radio' name='school_kind' value='대학교'/>&nbsp; 대학교 &nbsp;&nbsp; &nbsp;&nbsp;";
		str += "<input type='radio' name='school_kind' value='대학원'/>&nbsp; 대학원";

		str += "</td>";

		str += "<tr>";
		str += "<th style='width:100px'>재학기간</th>";
		str += "<td style='width: 520px'>";
		str += "<input class='input' type='text' style='width:150px' name='school_start_date'>  ~  ";
		str += "<input class='input' type='text' style='width:150px' name='school_last_date'> &nbsp;&nbsp;";
		str += "<select class='input' style='width: 120px' name='school_college1'> ";
		str += "<option value='입학'>입학</option>";
		str += "<option value='편입'>편입</option>";
		str += "</select>&nbsp;&nbsp;";
		str += "<select class='input' style='width: 120px' name='school_college2'>";

		str += "<option value='졸업예정'>졸업예정</option>";
		str += "<option value='졸업'>졸업</option>";
		str += "<option value='재학중'>재학중</option>";
		str += "<option value='휴학중'>휴학중</option>";
		str += "<option value='수료'>수료</option>";
		str += "<option value='중퇴'>중퇴</option>";
		str += "<option value='자퇴'>자퇴</option>";
		str += "</select>";
		str += "</td>";

		str += "</tr>";

		str += "<tr>";
		str += "<th>학교명</th>";
		str += "<td> <input class='input' type='text' style='width:200px' name='school_name'>";
		str += "</td>";

		str += "</tr>";
		str += "<tr>		";
		str += "<th>전공</th>";
		str += "<td> <input class='input' type='text' style='width:200px' name='school_major'>";
		str += "</td>";

		str += "</tr>";
		str += "<tr>";
		str += "<th>학점</th>";
		str += "<td> <input class='input' type='text' style='width:60px' name='school_rank1' maxlength='3'> / ";
		str += "<input class='input' type='text' style='width:60px' name='school_rank2' maxlength='3'>";
		str += "</td>";
		str += "</tr>";
		str += "</table>";
		str += "<tr>";

		str += "	<td>";
		str += "     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		str += "     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		str += "     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		str += "     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		str += "     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		str += "     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		str += "	   &nbsp;&nbsp;&nbsp;&nbsp;";
		str += "       <input  class='btn btn-default'  type='button' value='추가' onclick='addForm()'>";
		str += "       <input  class='btn btn-default'  type='button' value='삭제' onclick='delForm()'>";
		str += "   </td>";
		str += "  </tr>";

		var addedDiv = document.createElement("div");
		addedDiv.id = "added_" + count;
		addedDiv.innerHTML = str;
		addedFormDiv.appendChild(addedDiv);

		count++;
		document.school_Form.count.value = count;

	}

	function delForm() {
		var addedFormDiv = document.getElementById("addedFormDiv");
		if (count > 1) {
			var addedDiv = document.getElementById("added_" + (--count));

			if (confirm("삭제하시겠습니까?")) {
				addedFormDiv.removeChild(addedDiv);
			}
		} else {
			document.school_Form.reset();
		}
	}

	function license_addform() {

		var lo_table = document.getElementById("license_table");
		var row_index = lo_table.rows.length;
		newTr = lo_table.insertRow(row_index - 1);
		newTr.idName = "newTr" + row_index;

		newTd = newTr.insertCell(0);
		newTd.innerHTML = "<td style='width:160px'> <input type='text' name='license1' style='width:220px'> </td>";

		newTd = newTr.insertCell(1);
		newTd.align = "center";
		newTd.innerHTML = "<td style='width:80px'> <input type='text' name='license2' style='width:180px'> </td>";

		newTd = newTr.insertCell(2);
		newTd.innerHTML = "<td colspan='2' style='width:200px'> <input class='input' type='text' name='license3' style='width:260px'></td>";

	}

	function license_delForm() {
		var lo_table = document.getElementById("license_table");
		var row_index = lo_table.rows.length - 2; // 테이블(TR) row 개수

		if (row_index > 1)
			lo_table.deleteRow(row_index);
	}

	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;

						} else {
							fullAddr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {

							if (data.bname !== '') {
								extraAddr += data.bname;
							}

							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}

							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						document.getElementById('postcode').value = data.zonecode;
						document.getElementById('address1').value = fullAddr;

						document.getElementById('address2').focus();
					}
				}).open();
	}

	function conf_skill() {
		var url = "confirm_skill.jsp";
		open(url, "confrimWindow",
				"menubar=no, statusbar=no, scrollbar=no, toolbar=no, width=450, height=300");
	}
//-->
</script>

<h2>이력서</h2>

<input type="hidden" name="user_history_id" value="">

<form name="resome" method="post" enctype="multipart/form-data" action="resome_Pro.do" >

<h3>이력서제목</h3>

<table class="table table-hover">
	<tr>
		<td style="width:100px"><input class="form-control" type="text" name="resome_title" style="width: 650px" maxlength="40"></td>			
	</tr>
</table>

<h3>개인정보</h3>
<table class="table table-hover" style="width:1000px">

	<tr>
		<th style="width:200px">이름(한글)</th>
		<td><input class="" type="text" style="width: 250px" name="kor_name"></td>	
		<td rowspan="5"><img  class="img-rounded"  id="img_preview" style="margin-left: auto; margin-right: auto; display: block; width:150px; height:190px;"/>
		</td>	
	</tr>
	<tr>

		<th>이름(영문)</th>
		<td><input class="" type="text" style="width: 250px" name="eng_name"></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input class="" type="text" style="width: 120px" id="postcode" name="postcode">
		<input class="btn btn-default" type="button" style="width: 110px" value="우편번호 찾기" onclick="execDaumPostcode()">
		<input class="" type="text" style="width: 190px" name="address1" id="address1">&nbsp;
		<input class="" type="text" style="width: 150px" name="address2" id="address2">
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
			<td><input class="" type="text" style="width: 60px" name="tel1" maxlength="3"> - 
			    <input class="" type="text" style="width: 65px" name="tel2" maxlength="4"> -
				<input class="" type="text" style="width: 70px" name="tel3" maxlength="4"></td>
	</tr>

	<tr>
		<th>생년월일</th>
			<td><input class="" type="text" name="birth" maxlength="12" style="width:200px"></td>
	</tr>
	
	<tr>
		<th> 병역사항 </th>
			<td>
				<select class="" style="width: 120px" name="army1">
					<option value="해당없음">해당없음</option>
					<option value="군필">군필</option>		
					<option value="미필">미필</option>
					<option value="면제">면제</option>
				</select>
				<input class="" type="text" style="width:135px" name="army2"> ~
				<input class="" type="text" style="width:135px" name="army3">
				
				<select class="" style="width: 120px" name="army4">
					<option value="군별선택">군별선택</option>
					<option value="육군">육군</option>		
					<option value="해군">해군</option>
					<option value="공군">공군</option>
					<option value="해병">해병</option>
					<option value="의경">의경</option>		
					<option value="전경">전경</option>
					<option value="공익">공익</option>
				</select>	
							
				<select class="" style="width: 120px" name="army5">
					<option value="계급선택">계급선택</option>
					<option value="이병">이병</option>		
					<option value="일병">일병</option>
					<option value="상병">상병</option>
					<option value="병장">병장</option>
					<option value="하사">하사</option>		
					<option value="중사">중사</option>
					<option value="상사">상사</option>
					<option value="원사">원사</option>
					<option value="준위">준위</option>
					<option value="소위">소위</option>		
					<option value="중위">중위</option>
					<option value="대위">대위</option>
					<option value="소령">소령</option>
					<option value="중령">중령</option>		
					<option value="대령">대령</option>
					<option value="준장">준장</option>
					<option value="소장">소장</option>
					<option value="중장">중장</option>		
					<option value="대장">대장</option>					
				</select>						
				<select class="" style="width: 130px" name="army6">
					<option value="전역사유">전역사유</option>
					<option value="만기제대">만기제대</option>		
					<option value="의가사제대">의가사제대</option>
					<option value="의병제대">의병제대</option>
					<option value="소집해제">소집해제</option>
					<option value="불명예제대">불명예제대</option>		
					<option value="상이제대">상이제대</option>	
					<option value="기타">기타</option>	
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 미필,면제,기타사유 : 	<input class="" type="text" style="width:260px" name="army7" maxlength="3">
			</td>
			<td>	
				&nbsp;&nbsp;&nbsp;

				<input class="btn btn-default" type="file" id="input_file" value="사진선택" /></td>
	</tr>
	
	<tr>
		<th></th>


		</tr>

</table>

<table class="table table-hover" style="width:800px">

	<tr>
		<th style="width:89px">보유기술</th>
			<td colspan="2"> <input class="" name="skill" id="skill" type="text" style="width:460px" name="year2">
				<input class="btn btn-default" type="button" value="검색" onclick="conf_skill()">
			</td>
	</tr>		
	<tr>
		<th>희망연봉</th>
			<td><input class="" type="text" name="want_salary" style="width:160px">만원단위로 숫자만 입력하세요. &nbsp; (ex:2500)
			</td>
	</tr>
</table>


	<input type="hidden" name="cnt" value="0">
	<table id="license_table" class="table table-hover" style="width:800px">
		<tr>
			<th>자격증 이름</th>
			<th>발행일자</th>
			<th>발행일처</th>
		</tr>
		<tr>
			<td style="width:160px"> <input type="text" name="license1" style="width:220px"> </td>
			<td style="width:80px"> <input type="text" name="license2" style="width:180px"> </td>
		
			<td colspan="2" style="width:200px"> <input class="" type="text" style="width:260px" name="license3"></td>
		</tr>
		
		<tr>
		
			<td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		          
			<input  class="btn btn-default"  type="button" value="추가" style="width:60px" onclick="license_addform()">
			<input class="btn btn-default" type="reset" value="삭제" style="width:60px" onclick=" license_delForm()">	</td>			
		</table>

	    		<div id="addlicense"></div> <br>
	    
		<table class="table table-hover" style="width:800px">
		<tr>
			<th style="width:89px">포트폴리오</th>
				<td><input class="btn btn-default" type="file" name="project"></td>
		
		</tr>
		<tr>
		<th></th>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;&nbsp;	
		<input  class="btn btn-default"  type="submit" value="개인정보 저장하기" style="width:200px"></td>
		
	</table>	
		
</form>

<br>

<h3>학력사항</h3>

<h5>고등학교</h5>
<form name="school_Form"  method="post" onload="addForm();" action="school_Pro.do" onsubmit="submitcheck()">
<input type="hidden" name="count" value="0">

<input type="hidden" name="school_name_send">

<!-- <input type="hidden" name="school_name">
<input type="hidden" name="school_college1">
<input type="hidden" name="school_college2">
<input type="hidden" name="school_name">
<input type="hidden" name="school_major">
<input type="hidden" name="school_rank1">
<input type="hidden" name="school_rank2"> -->

<table class="table table-hover" style="width:800px">
	<tr>
		<th style="width:100px">재학기간</th>
			<td style="width: 520px">
				<input class="" type="text" style="width:210px" name="school_start_date"> ~
				<input class="" type="text" style="width:210px" name="school_last_date">
				
				<select class="" style="width: 80px" name="school_college_high">
					<option value="졸업">졸업</option>
					<option value="졸업예정">졸업예정</option>		
				</select>			
			</td>
	</tr>
	
	<tr>		
		<th>학교명</th>
		<td> <input class="" type="text" style="width:200px" name="school_name" maxlength="3">
			<select class="" style="width: 150px" name="school_name_kind">
				<option value="문과계열">문과계열</option>
				<option value="이과계열">이과계열</option>		
				<option value="전문(실업)계열">전문(실업)계열</option>
				<option value="예체능계열">예체능계열</option>	
			</select>	
		</td>
	</tr>
	         	<tr>
		         	<th style="width:100px">학력추가 </th>
			         	<td>
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;			          
				           <input class="btn btn-default"  type="button" value="추가" onclick="addForm()">
				           <input class="btn btn-default"  type="button" value="삭제" onclick="delForm()">
			           </td>
	           </tr>
	
		</table> 
		 <div id="addedFormDiv"></div> <br>
		
<br>

<br>
<table class="table table-hover" style="width:800px">
	<tr>
	<th></th>
		<td colspan="2"> 
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
		 <input  class="btn btn-default"  type="submit" value="학력사항 저장" style="width:200px"></td>
	</tr>
</table>

</form>
