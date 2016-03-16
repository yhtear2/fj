<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="/defaultSetting.jsp"%>
<link href="/fj/FJ_USER/style.css" rel="stylesheet" type="text/css">
<script src="/fj/FJ_USER/resome.js"></script>
<script src="/fj/FJ_USER/request.js"></script>
<script src="/fj/FJ_USER/introduce.js"></script>
<link href="/fj/FJ_USER/introduce.css" rel="stylesheet" type="text/css">


<!-- 전체적인 크기 잡기 -->
<div style="width:750;margin:50px;">
<h2>이력서</h2>
<form name="resome" method="post" enctype="multipart/form-data"  onload="license_addform();" action="resomeModify_Pro.do" onsubmit="lic_submitcheck()"> 
	<input type="hidden" name="license_cnt_hidden">
	
	<!-- 이력서 제목 입력부분 -->
	<div>
		<table class="table table-hover">
		   <tr>
		      <td>
		         <input class="form-control" type="text" id="resome_title" name="resome_title" value="${dto_user.resome_title}"
		         	style="text-align: center;" maxlength="100" placeholder="이력서 제목을 입력하세요 (100자까지 입력가능)">
		      </td>
		   </tr>
		</table>
	</div>
	
	<!-- 이력서 기본정보 입력 부분 -->
	<input type="hidden" name="army" value="${dto_user.army}">
	<h4>기본정보</h4>
	<table class="table">
   		<tr>
	      	<th style="width:100px;">이름(한글)</th>
	      	<td style="width:150px;"><input class="form-control-hs" type="text" style="text-align: center;" name="kor_name" id="kor_name" value="${dto_user.kor_name}"></td>
	      	<th style="width:100px;">이름(영문)</th>
	      	<td style="width:200px;"><input class="form-control-hs" type="text" name="eng_name" id="eng_name" value="${dto_user.eng_name}"></td>   
	      	<td rowspan="5">
		      	<img id="img_view" name="img_view" style="margin-left: auto; margin-right: auto; display: block; width:120px; height:150px;"/>
	      		<!-- 파일 업로드 버튼 -->
	      		<input type="file" id="imginput" name="imginput" style="width:150px; margin: 5px 0px 2px 18px;">
	      	</td> 
   		</tr>
   		
   		<c:if test='${dto_user.address != null && dto_user.address != "" }'>										
			<c:set var="address" value='${fnc:split( dto_user.address, "/" )}'/>	
   		<tr>
   			<th style="padding-bottom: 1px">주소</th>
   			<td style="padding-bottom: 1px">
   			
			
   				<input class="form-control-hs" type="text" id="postcode" name="postcode" readonly="readonly" style="width: 80px; text-align: center;" value="${address[0]}">
   			</td>
   			<td colspan="2" style="padding-bottom: 1px">
   				<input class="btn btn-default" type="button" style="width: 150px;height: 25px;padding: 2px 10px;" value="우편번호 찾기" onclick="execDaumPostcode()">
   			</td>
   			<td colspan="1" style="padding-bottom: 1px">
   			</td>
   		</tr>
   		<tr>
   			<td style="border-top: none;padding: 1px 8px 1px 8px;"></td>
   			<td colspan="3" style="width: 200px;border-top: none;padding: 1px 8px 1px 8px;">
   				<input class="form-control-hs" type="text" name="address1" id="address1"  readonly="readonly" value="${address[1]}">
   			</td>
   		</tr>
   		<tr>
   			<td  style="border-top: none;padding: 1px 8px 1px 8px;"></td>
   			<td  colspan="3" style="width: 200px;border-top: none;padding-top: 1px;">
   				<input class="form-control-hs" type="text" name="address2" id="address2" value="${address[2]}">
   			</td>
   		</tr>
   		</c:if>
   		<tr>
   			<th>전화번호</th>
   			<td colspan="3">
   			<c:if test='${dto_user.tel != null && dto_user.tel != "" }'>
   				<c:set var="tel" value='${fnc:split( dto_user.tel, "-" )}'/>										
	      		<input class="form-control-hs" type="text" style="width: 80px; height: 30px; text-align: center; padding: 2px;" name="tel1" id="tel1" value="${tel[0]}"> - 
	       		<input class="form-control-hs" type="text" style="width: 85px; height: 30px; text-align: center; padding: 2px;" name="tel2" id="tel2" max="9999" value="${tel[1]}"> -
	      		<input class="form-control-hs" type="text" style="width: 90px; height: 30px; text-align: center; padding: 2px;" name="tel3" id="tel3" max="9999" value="${tel[2]}">
	      		</c:if>
      		</td>	
			
   		</tr>
   		<tr>
     		<th>생년월일</th>
      		<td colspan="4"><input class="form-control-hs" type="date" name="birth" id="birth"  style="width:200px" value="${dto_user.birth}"></td>
   		</tr>
   		<tr>
   			<th>병역사항</th>
   			<td colspan="4">
            <select class="form-control-hs" style="width: 110px;" name="army1" id="army1">
               <option value="해당없음">해당없음</option>
               <option value="군필">군필</option>      
               <option value="미필">미필</option>
               <option value="면제">면제</option>
            </select>
            
            <select class="form-control-hs" style="width: 130px; margin-left: 20px;" name="army4" id="army4">
               <option value="군별선택">군별선택</option>
               <option value="육군">육군</option>      
               <option value="해군">해군</option>
               <option value="공군">공군</option>
               <option value="해병">해병</option>
               <option value="의경">의경</option>      
               <option value="전경">전경</option>
               <option value="공익">공익</option>
            </select> 
            
            <input class="form-control-hs" type="date" style="width:150px; margin-left: 20px;" name="army2" id="army2"> ~
            <input class="form-control-hs" type="date" style="width:150px" name="army3" id="army3">
    
            <select class="form-control-hs" style="width: 110px" name="army5" id="army5">
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
                           
            <select class="form-control-hs" style="width: 130px; margin-left: 20px;" name="army6" id="army6">
               <option value="전역사유">전역사유</option>
               <option value="만기제대">만기제대</option>      
               <option value="의가사제대">의가사제대</option>
               <option value="의병제대">의병제대</option>
               <option value="소집해제">소집해제</option>
               <option value="불명예제대">불명예제대</option>      
               <option value="상이제대">상이제대</option>   
               <option value="기타">기타</option>   
            </select>
            <input class="form-control-hs" type="text" style="width:300px; margin-left: 20px; text-align: center;" name="army7" id="army7" placeholder="미필,면제,기타사유 ">
         </td>
   		</tr>
   		
   	</table>
	<table class="table">
  		<tr>
     		<th style="width:100px;">보유기술</th>
   			<td> 
   				<input class="form-control-hs" name="skill" id="skill" type="text" style="width:250px;text-align: center;"
   					placeholder="클릭해주세요" onclick="conf_skill()" value="${dto_user.skill}">
         	</td>
      		<th style="width:100px;">희망연봉</th>
         	<td>
         		<input class="form-control-hs" type="text" name="want_salary" id="want_salary" style="width:150px;text-align: right;" placeholder="숫자만 입력하세요" value="${dto_user.want_salary}">만원
         	</td>
   		</tr>
	</table>
   <input type="hidden" name="license"	value="${dto_user.license}">
   	<table id="license_table" class="table">
    	<tr>
         	<th>자격증 이름</th>
         	<th>발행일자</th>
         	<th>발행처</th>
      	</tr>
      	<tr id="license_table_tr0">
         	<td style="width:160px"> <input type="text" class="form-control-hs" name="license10" id="license10" style="width:220px"> </td>
         	<td style="width:80px"> <input type="date" class="form-control-hs" name="license20" id="license20" style="width:180px"> </td>
         	<td colspan="2" style="width:200px"> <input type="text" class="form-control-hs"style="width:260px" name="license30" id="license30"></td>
      	</tr>   
      	<tr>
         	<td colspan="3" align="right">            
         		<input class="btn btn-default"  type="button" value="추가" style="width:60px" onclick="license_addform()">
         		<input class="btn btn-default" type="button" value="삭제" style="width:60px" onclick="license_delForm()">
         		&nbsp;&nbsp;   
         	</td>       
		</tr>
     </table>
<!--
	추가, 삭제, 다운 등등 구현이 어려워 일단 주석! -홍석-       
     <table class="table">
     	<tr>
         	<th style="width:150px;">포트폴리오</th>
            <td>
            	<input class="btn btn-default" type="file" name="project" id="project">
            </td>
      	</tr>
     </table> -->
<!-- 기본정보 끝!! -->
<br>
<!--  학력사항 시작  dto_school -->
	<h4>학력사항</h4>

	<!-- <h5>고등학교</h5> -->

<!-- <form name="school_Form"  method="post" onload="addForm();" action="school_Pro.do" onsubmit="submitcheck()"> -->
	<input type="hidden" name="count" value="0">
	<input type="hidden" name="user_history_id" value='${user_history_id}'>
	<input type="hidden" name="school_size" value="${school_size}">
	<c:forEach var="i" begin="${1}" end="${school_size}">
		<input type='hidden' name='school_id0' value='${dto_school[0].school_id}'>
		<input type='hidden' name='school_id${i}' value='${dto_school[i].school_id}'>
		<input type='hidden' name='school_kinds${i}' value='${dto_school[i].school_kind}'>
		<input type='hidden' name='school_start_date_colleges${i}' value='${dto_school[i].school_start_date_college}'>
		<input type='hidden' name='school_last_date_college${i}' value='${dto_school[i].school_last_date_college}'>
		<input type='hidden' name='school_colleges1${i}' value='${dto_school[i].school_college1}'>
		<input type='hidden' name='school_colleges2${i}' value='${dto_school[i].school_college2}'>
		<input type='hidden' name='school_name_colleges${i}' value='${dto_school[i].school_name_college}'>
		<input type='hidden' name='school_majors${i}' value='${dto_school[i].school_major}'>
		<input type='hidden' name='school_rank${i}' value='${dto_school[i].school_rank}'>
	</c:forEach>
	
	<!-- 
	private String school_kind;					// 대학/대학원 분류
	private String school_start_date_college;	// 입학날자
	private String school_last_date_college;	// 졸업날자
	private String school_college1;				// (입학)
	private String school_college2;				// (졸업)
	private String school_name_college;			// 대학 이름	
	private String school_major;				// 전공
	private String school_rank;					// 학점 (23/23) 이런식으로 들어가 있음
	 -->
	
	<table class="table">
		<tr>
			<td colspan="4" style="border-top: none;"><h5>고등학교</h5></td>
		</tr>
    	<tr>
      		<th style="width:80px;">재학기간</th>
			<td colspan="4">
    			<input class="form-control-hs" type="date" style="width:180px" name="highschool_start_date" id="highschool_start_date" value="${school_dto0.school_start_date_high}">
    			 &nbsp;~&nbsp; 
            	<input class="form-control-hs" type="date" style="width:180px" name="highschool_last_date" id="highschool_last_date" value="${school_dto0.school_last_date_high}">
            	&nbsp;&nbsp;
            	<select class='form-control-hs' style='width: 80px;padding-top: 1px;' id='school_college1' name='school_college0'>
   					<c:if test="${school_dto0.school_college1 == '입학'}"> <option value='입학' selected="selected">입학</option> </c:if>
   					<c:if test="${school_dto0.school_college1 != '입학'}"> <option value='입학'>입학</option> </c:if>
   					<c:if test="${school_dto0.school_college1 == '편입'}"> <option value='편입' selected="selected">편입</option> </c:if>
   					<c:if test="${school_dto0.school_college1 != '편입'}"> <option value='편입'>편입</option> </c:if>
   				</select>
   				&nbsp;
            	<select class="form-control-hs" style="width: 120px;padding-top: 1px; " name="highschool_college" id="highschool_college">
               		<c:if test="${school_dto0.school_college_high == '졸업'}"> <option value="졸업" selected="selected">졸업</option> </c:if>
               		<c:if test="${school_dto0.school_college_high != '졸업'}"> <option value="졸업">졸업</option> </c:if>
               		<c:if test="${school_dto0.school_college_high == '졸업예정'}"> <option value="졸업예정" selected="selected">졸업예정</option> </c:if>
               		<c:if test="${school_dto0.school_college_high != '졸업예정'}"> <option value="졸업예정">졸업예정</option> </c:if>
               	</select>   
            </td>
    	</tr>
    	<tr>
    		<th>학교명</th>
            <td style="width:250px;text-align: center;"> 
            	<input class="form-control-hs" style="padding-top: 1px;text-align: center;" type="text" name="highschool_name" id="highschool_name" value="${school_dto0.school_name_high}">   
      		</td>
      		<td style="width:200px;">
      			<select class="form-control-hs" style="padding-top: 1px;text-align: center;" name="highschool_kind" id="highschool_kind">
		           <c:if test="${school_dto0.highschool_kind == '문과계열'}"> <option value="문과계열" selected="selected">문과계열</option> </c:if>
		           <c:if test="${school_dto0.highschool_kind != '문과계열'}"> <option value="문과계열">문과계열</option> </c:if>
		           <c:if test="${school_dto0.highschool_kind == '이과계열'}"> <option value="이과계열" selected="selected">이과계열</option> </c:if>
		           <c:if test="${school_dto0.highschool_kind != '이과계열'}"> <option value="이과계열">이과계열</option> </c:if>      
		           <c:if test="${school_dto0.highschool_kind == '전문(실업)계열'}"> <option value="전문(실업)계열" selected="selected">전문(실업)계열</option> </c:if>
		           <c:if test="${school_dto0.highschool_kind != '전문(실업)계열'}"> <option value="전문(실업)계열">전문(실업)계열</option> </c:if>
		           <c:if test="${school_dto0.highschool_kind == '예체능계열'}"> <option value="예체능계열" selected="selected">예체능계열</option> </c:if>
		           <c:if test="${school_dto0.highschool_kind != '예체능계열'}"> <option value="예체능계열">예체능계열</option> </c:if>   
         		</select>
      		</td>
      		<th style="width:80px; margin-left: 20px;text-align: right;">학점</th>
      		<td>
      			<p style="text-align: center;">-</p>
      		</td>
      		
    	</tr>
    	<tr>
			<td colspan="5" align="right">                
				<input class="btn btn-default"  type="button" value="학력 추가" onclick="addForm('highAdd')">
				<input class="btn btn-default"  type="button" value="삭제" onclick="delForm()">
				&nbsp; &nbsp; 
			</td>
		</tr>
	</table>
       <div id="school_addedFormDiv"></div> <br>
       
       <!-- 경력사항 입력 부분 -->
<h4>경력사항</h4>
    <input type="hidden" name="career_count">
    <input type="hidden" name="career_size" value="${career_size}">
	<input type="hidden" name="career_sort" value="${dto_career[0].career_sort}">
	<table>
		<tr>
			<th> 신입 / 경력 </th>
			<td> 
			<c:if test="${career_size-1 == 0}">
				&nbsp;&nbsp;&nbsp;&nbsp;신입 : 
				<input type="radio" name="career_sort" id="career_sort" value="신입" onclick="chk()" checked="checked">
				&nbsp;&nbsp;&nbsp;	경력 : 
				<input type="radio" name="career_sort" id="career_sort" value="경력" onclick="chk()">
			</c:if>
			<c:if test="${career_size-1 != 0}">
				&nbsp;&nbsp;&nbsp;&nbsp;신입 : 
				<input type="radio" name="career_sort" id="career_sort" value="신입" onclick="chk()">
				&nbsp;&nbsp;&nbsp;	경력 : 
				<input type="radio" name="career_sort" id="career_sort" value="경력" onclick="chk()" checked="checked">
			</c:if>
				
			</td>		
		</tr>	
	</table>
 	<table class="table" id="career_table" style="display: block;">
 	<c:if test="${career_size-1 == 0}">
 	 <c:forEach var="i" begin="${0}" end="${career_size -1}">
 	 	
		<input type='hidden' name='career_ids${i}' value='${dto_career[i].career_id}'>
 		<tr>
 			<th style="width:200px;">근무기간</th>
 			<th style="width:450px;" colspan="4">상세경력</th>
 		</tr>
 		<tr>
 			<td rowspan="4">
 				<select class="form-control-hs" style="width: 100px" name="career_kind" onChange="change(this)">				
						<c:if test="${dto_career[i].career_kind =='퇴사' }"><option value="퇴사" selected="selected">퇴사</option> </c:if> 
						<c:if test="${dto_career[i].career_kind !='퇴사' }"><option value="퇴사">퇴사</option> </c:if>
						<c:if test="${dto_career[i].career_kind =='재직중' }"><option value="재직중" selected="selected">재직중</option></c:if>
						<c:if test="${dto_career[i].career_kind !='재직중' }"><option value="재직중">재직중</option></c:if>
				</select>
				<br><br>
				<input class="form-control-hs" type="date" style="width:180px" name="career_start_date" 
					id="career_start_date" value="${dto_career[i].career_start_date}">
				<br>
				&nbsp; ~ &nbsp;
				<input class="form-control-hs" type="date" style="width:180px" name="career_last_date" 
					id="career_last_date"  value="${dto_career[i].career_last_date}">
 			</td>
 			<th style="width:100px">회사명</th>
			<td colspan="3"><input class="form-control-hs" type="text" name="career_comp_name" value="${dto_career[i].career_comp_name}"></td>
 		</tr>
 		<tr>
 			<th>부서명 </th>
			<td colspan="3">
				<input class="form-control-hs" type="text" style="width: 120px" name="career_department" value="${dto_career[i].career_department}">
				&nbsp;
				<select class="form-control-hs" style="width: 110px" name="career_position1">				
					<c:if test="${dto_career[i].career_position1 == '직급선택' }"> <option value="직급선택" selected="selected">직급선택</option> </c:if>
					<c:if test="${dto_career[i].career_position1 != '직급선택' }"> <option value="직급선택">직급선택</option> </c:if>
					<c:if test="${dto_career[i].career_position1 == '사원(연구원)' }"> <option value="사원(연구원)" selected="selected">사원(연구원)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 != '사원(연구원)' }"> <option value="사원(연구원)">사원(연구원)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 == '주임/계장(연구원)' }"> <option value="주임/계장(연구원)" selected="selected">주임/계장(연구원)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 != '주임/계장(연구원)' }"> <option value="주임/계장(연구원)">주임/계장(연구원)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 == '대리(주임연구원)' }"> <option value="대리(주임연구원)" selected="selected">대리(주임연구원)</option> </c:if>		
					<c:if test="${dto_career[i].career_position1 != '대리(주임연구원)' }"> <option value="대리(주임연구원)">대리(주임연구원)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 == '과장(선임연구원)' }"> <option value="과장(선임연구원)" selected="selected">과장(선임연구원)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 != '과장(선임연구원)' }"> <option value="과장(선임연구원)">과장(선임연구원)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 == '차장(수석연구원)' }"> <option value="차장(수석연구원)" selected="selected">차장(수석연구원)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 != '차장(수석연구원)' }"> <option value="차장(수석연구원)">차장(수석연구원)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 == '부장(연구소장)' }"> <option value="부장(연구소장)" selected="selected">부장(연구소장)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 != '부장(연구소장)' }"> <option value="부장(연구소장)">부장(연구소장)</option> </c:if>
					<c:if test="${dto_career[i].career_position1 == '임원' }"> <option value="임원" selected="selected">임원</option> </c:if>
					<c:if test="${dto_career[i].career_position1 != '임원' }"> <option value="임원">임원</option> </c:if>
				</select>
				&nbsp;
				<select class="form-control-hs" style="width: 110px" name="career_position2">				
					<c:if test="${dto_career[i].career_position2 == '직책선택' }"> <option value="직책선택" selected="selected">직책선택</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '직책선택' }"> <option value="직책선택">직책선택</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '팀원' }"><option value="팀원" selected="selected">팀원</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '팀원' }"><option value="팀원">팀원</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '팀장' }"><option value="팀장" selected="selected">팀장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '팀장' }"><option value="팀장">팀장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '매니저' }"><option value="매니저" selected="selected">매니저</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '매니저' }"><option value="매니저">매니저</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '파트장' }"><option value="파트장" selected="selected">파트장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '파트장' }"><option value="파트장">파트장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '실장' }"><option value="실장" selected="selected">실장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '실장' }"><option value="실장">실장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '지점장' }"><option value="지점장" selected="selected">지점장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '지점장' }"><option value="지점장">지점장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '지사장' }"><option value="지사장" selected="selected">지사장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '지사장' }"><option value="지사장">지사장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '원장' }"><option value="원장" selected="selected">원장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '원장' }"><option value="원장">원장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '국장' }"><option value="국장" selected="selected">국장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '국장' }"><option value="국장">국장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '본부장' }"><option value="본부장" selected="selected">본부장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '본부장' }"><option value="본부장">본부장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '센터장' }"><option value="센터장" selected="selected">센터장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '센터장' }"><option value="센터장">센터장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '공장장' }"><option value="공장장" selected="selected">공장장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '공장장' }"><option value="공장장">공장장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 == '그룹장' }"><option value="그룹장" selected="selected">그룹장</option> </c:if>
					<c:if test="${dto_career[i].career_position2 != '그룹장' }"><option value="그룹장">그룹장</option> </c:if>
				</select>			
			</td>
 		</tr>
 		<tr>
 			<th>담당업무(언어)</th>
			<td style="width: 80px">
				<input class="form-control-hs" type="text" style="width: 150px" name="career_work" value="${dto_career[i].career_work}">
			</td>
			<th style="width:100px;margin-left: 10px;" align="right">급여/연봉</th>
			<td colspan="2">
				<input class="form-control-hs" type="number" style="width: 70px;text-align: center;" name="career_salary" placeholder="숫자" value="${dto_career[i].career_salary}">
				만원
			</td>
 		</tr>
 		<tr>
			<th>퇴사사유 </th>
			<td colspan="4">
				<input class="form-control-hs" type="text" name="career_resign" value="${dto_career[i].career_resign}">
			</td>
		</tr>
		<tr>
			<th style="text-align: center;" colspan="6">경력 기술서</th>
		</tr>
		<tr>
			<td colspan="6">
				<textarea name="career_content" rows="7" cols="90">${dto_career[i].career_content}</textarea>
			</td>
		</tr>	
		<tr>	
			<td align="right" colspan="6">    
           		<input  class="btn btn-default"  type="button" value="경력추가" onclick="career_addForm()"
            	style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;"
           		>
           		<input  class="btn btn-default"  type="button" value="삭제" onclick="career_deleForm()"
        		style="font-style:'돋움'; font-size:13px; color:#ff5d5d; background-color:#f8f8f8;
				border: 1px solid #ff5d5d;"
           		>

           </td>
		</tr>
	</c:forEach>
	</c:if>
	</table>	  

	<div id="career_addFormdiv"></div> <br>      
       
	<br>
	<h4> 자기 소개서 </h4>
	<input type="hidden" name="introduce_size" value="${introduce_size}">
	
	<!-- 여기가 폼 하나시작 -->
	<div id="standardID0">
	<input type="hidden" name="sub_name_0">
	<c:forEach var="i" begin="${0}" end="${school_size}">
		<input type='hidden' name='intro_id${i}' value='${dto_introduce[i].intro_id}'>
		<input type='hidden' name='intro_titles${i}' value='${dto_introduce[i].intro_title}'>
		<input type='hidden' name='intro_contents${i}' value='${dto_introduce[i].intro_contents}'>
	</c:forEach>
<!--
	private int intro_id;				// 자기 id
	private String intro_title;			// 제목
	private String intro_contents;		// 내용
-->
			<!-- 처음 보여지는 디폴트 값 -->
			<div id="sub_name0"  class="subject">
				<div id="sub_name_0" class="subject">자기소개</div>
				<div class="subject"><input type="button" class="btn btn-default" value="변경" name="modify" onclick="sub_name_modify('0')"
					style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;"
				></div>
			</div>	
			<!-- 변경을 누르면 나타나는 입력 폼 -->
			<div id="sub_change0" class="subject" style="display:none;">
				<input type="text" name="sub_change_name0" autofocus="autofocus" 
						style="background: #f2f7ff; border: 2px;" >
				<input type="button" value="확인" class="btn btn-default" onclick="sub_name_ok('0')"
					style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;"
				>
				<input type="button" value="취소" class="btn btn-default" onclick="sub_name_cancel('0')"
					style="font-style:'돋움'; font-size:13px; color:#ff5d5d; background-color:#f8f8f8;border: 1px solid #ff5d5d;"	> 
			</div>
		<div style="margin-bottom: 10px;"></div>
		<!-- 내용 입력하는 곳 -->
		<div style="margin-top: 10px;"> 
			<textarea name="contents0" rows="13" cols="104"></textarea> 
		</div>
		<div align="right"> 
			<input type="button" class="btn btn-default" value="추가" onclick="add_introduce()"
				style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#f8f8f8;border: 1px solid #0059b3;"	>
			<input type="button" class="btn btn-default" value="삭제" onclick="del_introduce('0')"
				style="font-style:'돋움'; font-size:13px; color:#ff5d5d; background-color:#f8f8f8;border: 1px solid #ff5d5d;"
			> 
			&nbsp; &nbsp; 
		</div>
	</div>


	<table class="table">
   		<tr>
      		<td align="right" style="border: 0px;">   
      			<input type="submit" class="btn btn-default" style="width:200px; font-style:'돋움'; font-size:13px; 
      				color:white; background-color:#0059b3; border: 1px solid #0059b3;" value="수정사항 저장">
				<input type="hidden" name="cnt" value="0"> 
      			&nbsp; &nbsp; 
      		</td>
   		</tr>
	</table>
</form>
</div>