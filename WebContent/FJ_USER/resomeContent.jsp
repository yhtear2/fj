<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="/defaultSetting.jsp"%>
<h3>&nbsp;&nbsp;&nbsp;이력서제목</h3>
<table class="table table-hover"  style="margin-left: 20px;width:700px">
   <tr>      
   		<td class="form-control" style=" text-align: center; width: 520px; font-size:20px"> ${dto.resome_title} </td>
   </tr>
   
</table>

<h3>&nbsp;&nbsp;&nbsp;개인정보</h3>
<table class="table table-hover" style="margin-left: 20px; width:700px">

   <tr>
      <th style="width:200px">이름(한글)</th>
		 <td class="form-control" style="text-align: center; width: 250px"> ${dto.kor_name} </td>
      <td rowspan="5"><img  class="img-rounded"  id="img_preview" name="img_preview" src='${dto.photo}' style="margin-left: auto; margin-right: auto; display: block; width:150px; height:190px;"/>
   
   </tr>
   <tr>

      <th>이름(영문)</th>
		 <td class="form-control" style="text-align: center; width: 650px"> ${dto.eng_name} </td>
   </tr>
	<tr>
      <th>주소</th>
		 <td class="form-control" style="text-align: center; width: 650px"> ${dto.address} </td>

   </tr>
   <tr>
      <th>전화번호</th>
      <td class="form-control" style="text-align: center; width: 700px">
         <c:if test='${dto.tel != null && dto.tel != "" }'>										
			<c:set var="e" value='${fnc:split( dto.tel, "-" )}'/>	
<%-- 			<input class="input" style="width:100px; border:none" name="tel1" maxlength="25" value="${e[0]}"> - 
			<input class="input" style="width:100px; border:none" name="tel2" maxlength="25" value="${e[1]}"> - 
			<input class="input" style="width:100px; border:none" name="tel3" maxlength="25" value="${e[2]}"> --%>
			${e[0]} - ${e[1]} - ${e[2]}
		</c:if>
		</td>
   </tr>

   <tr>
      <th>생년월일</th>
		 <td class="form-control" style="text-align: center; width: 650px"> ${dto.birth} </td>
   </tr>
   
   <tr>
      <th> 병역사항 </th>
      <td class="form-control" style="text-align: center;width:620px; display: inline-block; font-size:16px;" >
      	<c:if test='${dto.army != null && dto.army != "" }'>										
			<c:set var="e" value='${fnc:split( dto.army, "/" )}'/>	
			${e[0]}   
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /&nbsp;&nbsp; 복무기간 :  ${e[1]} &nbsp;&nbsp; - &nbsp;&nbsp; ${e[2]}  <br>
			${e[3]}&nbsp;&nbsp; /&nbsp;&nbsp; ${e[4]}&nbsp;&nbsp; /&nbsp;&nbsp;${e[5]}&nbsp;&nbsp; /&nbsp;&nbsp; ${e[6]}
		</c:if>
		</td>
	</tr>

   <tr>
      <th style="width:89px">보유기술</th>
         <td class="form-control" style="text-align: center;  width: 650px"> ${dto.skill} </td>

   </tr>      
   <tr>
      <th>희망연봉</th>
         <td class="form-control" style="text-align: center; width: 650px"> ${dto.want_salary} </td>
   </tr>
</table>

   <table id="license_table" class="table table-hover" style="margin-left: 20px; width:700px">
      <tr style="display: inline-block; width:700px">
         <th style="display: inline-block; width:32%">자격증 이름</th>
         <th style="display: inline-block; width:32%"> 발행일자</th>
         <th style="display: inline-block; width:32%">발행일처</th>
	</tr>
	<tr style="display: inline-block; width:700px">
			<td style="display: inline-block; width:700px"  colspan="2">
      		<c:if test='${dto.license != null && dto.license != "" }'>	
      		<c:forTokens var="e" items='${dto.license}' delims="/">
      			<c:forTokens var="k" items='${e}' delims="-">
      				  <input class="form-control" type="text" style="display: inline-block; width:160px; border:none;" value="${k}">
      				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				  &nbsp;&nbsp;&nbsp;
      			
      			</c:forTokens>		
      				  <br>
      		</c:forTokens>

        	 </c:if>

       </td>		
      </tr>
	<tr style="display: inline-block; width:700px">
		<th>포트폴리오</th>
		<td><input class="btn btn-default" type="file" name="project" id="project" value="${dto.project}"></td>	
	</tr>
</table>

<h3>&nbsp;&nbsp;&nbsp;학력사항</h3>
<table class="table table-hover" style="margin-left: 20px; width:700px">

<c:forEach var="sc_dto" items="${result}" end="0">

   <tr>
      <th style="width:100px">재학기간</th>
         		 <td class="form-control" style="text-align: center; width: 520px">
         		고등학교 &nbsp;&nbsp;&nbsp;&nbsp; ${sc_dto.school_start_date_high} - ${sc_dto.school_last_date_high} &nbsp;&nbsp;&nbsp;&nbsp;
         		 ${sc_dto.school_college_high}        
         </td>
   </tr>

   <tr>      
      <th>학교명</th>
      <td class="form-control" style="text-align: center; width: 520px">
      ${sc_dto.school_name_high} &nbsp;&nbsp;&nbsp;/ &nbsp;&nbsp;&nbsp; ${sc_dto.highschool_kind}

      </td>
   </tr>	
   	</c:forEach>
   	
   
   </table>
   		<table class='table table-hover' id='mytable' style='margin-left: 20px; width: 700px'>
			<c:forEach var="sc_dto" items="${result}" begin="1" end="4">
				<c:if test='${sc_dto.school_name_high != null && sc_dto.school_name_high != "" }'>		
				<tr>
					<th style='width: 100px'>분류</th>
					<td class="form-control" style="text-align: center; width: 520px"><input type='radio' id='school_kind_ida' name='school_kind' value='${sc_dto.school_kind}' />&nbsp; 대학교 &nbsp;&nbsp; &nbsp;&nbsp;
					<input type='radio' id='school_kind_idb' name='school_kind' value='${sc_dto.school_kind}' />&nbsp; 대학원</td>
				</tr>
				<tr>
					<th style='width: 100px'>재학기간</th>
					
					<td class="form-control" style="text-align: center; width: 520px">
					${sc_dto.school_start_date_college} &nbsp;&nbsp; / &nbsp;&nbsp;
					${sc_dto.school_last_date_college} &nbsp;&nbsp; ~ &nbsp;&nbsp;
					${sc_dto.school_college1} &nbsp;&nbsp; / &nbsp;&nbsp;
					${sc_dto.school_college2}
				</td> 
	
				</tr>
	
				<tr>
					<th>학교명</th>
					<td class="form-control" style="text-align: center; width: 520px">${sc_dto.school_name_college}</td>
	
				</tr>
				<tr>
					<th>전공</th>
					<td class="form-control" style="text-align: center; width: 520px">${sc_dto.school_major}</td>
				</tr>
				<tr>
					<th>학점</th>
						<c:set var="e" value='${fnc:split( sc_dto.school_rank, "/" )}'/>	
						<td class="form-control" style="text-align: center; width: 520px">${e[0]} &nbsp;&nbsp; / &nbsp;&nbsp; ${e[1]}</td>
				</tr>
				</c:if>
			</c:forEach>
		</table>





