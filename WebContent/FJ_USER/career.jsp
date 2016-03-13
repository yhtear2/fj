<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/defaultSetting.jsp"%>
<!-- <script src="/fj/FJ_USER/resome.js"></script>-->
<link href="/fj/FJ_USER/style.css" rel="stylesheet" type="text/css">
<script src="/fj/FJ_USER/request.js"></script>

<h2> 경력사항 </h2>
<form name="career_Form"  method="post"  onload="career_addForm();" action="career_Pro.do">
<input type="hidden" name="career_count">

	<input type="text" name="user_history_id" value='${history_id}' style="display:none">

<table>
	<tr>
		<th> 신입 / 경력 </th>
			<td> &nbsp;&nbsp;&nbsp;&nbsp;신입 : <input type="radio" name="career_sort" id="career_sort" value="신입" onclick="chk()"> &nbsp;&nbsp;&nbsp;
			경력 : <input type="radio" name="career_sort" id="career_sort" value="경력" onclick="chk()"></td>		
					
	</tr>

</table>

<table class="table table-hover" id="career_table" >

	<tr>
		<th>회사명 : </th>
		<td><input class="form-control" type="text" style="width: 250px" name="career_comp_name"></td>
	</tr>
	<tr>
		<th>근무기간</th>
			<td>
				<input class="form-control" type="date" style="width:150px" name="career_start_date" id="career_start_date"> ~
				<input class="form-control" type="date" style="width:150px" name="career_last_date" id="career_last_date" >
				<input class="btn btn-default" type="button" onclick="sort()" value="근무개월 계산"/>
				<input class="form-control" type="text" style="width:150px" name="career_sort_date" id="career_sort_date">

				
				<select class="input" style="width: 80px" name="career_kind" onChange="change(this)">				
					<option value="퇴사">퇴사</option>
					<option value="재직중">재직중</option>		
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
          
           <input  class="btn btn-default"  type="button" value="추가" onclick="career_addForm()"
            style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;"
           >
           <input  class="btn btn-default"  type="button" value="삭제" onclick="career_deleForm()"
        	style="font-style:'돋움'; font-size:13px; color:#ff5d5d; background-color:#f8f8f8;
			border: 1px solid #ff5d5d;"
           >
           </td>
		</table>
		  

	<div id="career_addFormdiv"></div> <br>

 

<table>
	<tr>
		<th colspan="2"> </th>
		<td> <input  class="btn btn-default" type="button" value="이력서 수정" onclick="window.location='resome.do'"
		style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#ffffff"
		>
		&nbsp;&nbsp; 
		<input  class="btn btn-default" type="submit" value="경력사항 저장"
		style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;"
		></td>
	</tr>
</table>
</form>