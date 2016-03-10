<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="/defaultSetting.jsp"%>
<h3>이력서제목</h3>
<table class="table table-hover">
   <tr>      
   		<td style="width:100px"> ${dto.resome_title} </td>
   </tr>
   
</table>

<h3>개인정보</h3>
<table class="table table-hover" style="width:1000px">

   <tr>
      <th style="width:200px">이름(한글)</th>
		 <td class="form-control" style="text-align: center; width: 250px"> ${dto.kor_name} </td>
      <td rowspan="5"><img  class="img-rounded"  id="img_preview" name="img_preview" src="${photo}" style="margin-left: auto; margin-right: auto; display: block; width:150px; height:190px;"/>
   
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
      <td class="form-control" style="text-align: center; width: 650px">
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
      <td class="form-control" style="width:620px; display: inline-block;" >
      	<c:if test='${dto.army != null && dto.army != "" }'>										
			<c:set var="e" value='${fnc:split( dto.army, "/" )}'/>	
            <select class="form-control" style="width: 120px;display: inline-block;" name="army1" id="army1">
               <option>${e[0]}</option>      
            </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 복무기간 :  ${e[1]}  ${e[2]}  <br>

            <select class="form-control" style="display: inline-block;width:120px" name="army4" id="army4">
               <option>${e[3]}</option>      
            </select>
            <select class="form-control" style="display: inline-block;width: 120px" name="army5" id="army5">
               <option>${e[4]}</option>      
            </select>
            <select class="form-control" style="display: inline-block;width: 120px" name="army6" id="army6">
               <option>${e[5]}</option>      
            </select>
			${e[6]}
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

   <table id="license_table" class="table table-hover" style="width:800px">
      <tr style="display: inline-block; width:800px">
         <th style="display: inline-block; width:34%">자격증 이름</th>
         <th style="display: inline-block; width:30%"> 발행일자</th>
         <th style="display: inline-block; width:30%">발행일처</th>
	</tr>
	<tr style="display: inline-block; width:800px">
			<td style="display: inline-block; width:800px"  colspan="2">
      		<c:if test='${dto.license != null && dto.license != "" }'>	
      		<c:forTokens var="e" items='${dto.license}' delims="/">
      			<c:forTokens var="k" items='${e}' delims="-">
      				  <input class="form-control" type="text" name="license10" id="license10"   style="display: inline-block; width:180px; border:none;" value="${k}">
      				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      				  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      			
      			</c:forTokens>		
      				  <br>
      		</c:forTokens>

        	 </c:if>

       </td>		
      </tr>
	<tr>
		<th style="width: 89px">포트폴리오</th>
		<td><input class="btn btn-default" type="file" name="project" id="project" value="${project}"></td>	
	</tr>
</table>

<h3>학력사항</h3>
<h5>고등학교</h5>

<table>

<c:forEach var="sc_dto" items="${result}" end="0">

   <tr>
      <th style="width:100px">재학기간</th>
         		 <td class="form-control" style="text-align: center; width: 520px"> ${sc_dto.school_start_date_high} - ${sc_dto.school_last_date_high}
            <select class="" style="width: 80px;" name="highschool_college" id="highschool_college">
               <option>${sc_dto.school_college_high}</option>
            </select>         
         </td>
   </tr>

   <tr>      
      <th>학교명</th>
      <td> <input class="" type="text" style="width:200px; border:none;" name="highschool_name" id="highschool_name" value="${sc_dto.school_name_high}">
         <select class="" style="width: 150px; border:none; " name="highschool_name_kind" id="highschool_name_kind" >
            <option>${sc_dto.highschool_kind}</option>

         </select>   
      </td>
   </tr>	
   	</c:forEach>
   
   </table>
   
   <h5> 대학교 / 대학원 </h5>

		<table class='table table-hover' id='mytable' style='width: 800px'>
			<c:forEach var="sc_dto" items="${result}" begin="1" end="4">
				<c:if test='${sc_dto.school_name_high != null && sc_dto.school_name_high != "" }'>		
												
						
				<tr>
					<th style='width: 100px'>분류</th>
					<td style='width: 520px'><input type='radio' id='school_kind_ida' name='school_kind' value='${sc_dto.school_kind}' />&nbsp; 대학교 &nbsp;&nbsp; &nbsp;&nbsp;
					<input type='radio' id='school_kind_idb' name='school_kind' value='${sc_dto.school_kind}' />&nbsp; 대학원</td>
				</tr>
				<tr>
					<th style='width: 100px'>재학기간</th>
					<td style='width: 520px'><input class='input' type='text'style='width: 150px; border:none; ' id='school_start_date'name='school_start_date' value='${sc_dto.school_start_date_college}'> ~ 
					<input class='input'type='text' style='width: 150px; border:none;' id='school_last_date'name='school_last_date' value='${sc_dto.school_last_date_college}'>  &nbsp;&nbsp; 
					<select class='input'style='width: 120px; border:none;' id='school_college1' name='school_college1'>
							<option>${sc_dto.school_college1}</option>
					</select>&nbsp;&nbsp; <select class='input' style='width: 120px; border:none;' id='school_college2' name='school_college2'>
							<option>${sc_dto.school_college2}</option>	
					</select></td>
	
				</tr>
	
				<tr>
					<th>학교명</th>
					<td><input class='input' type='text' style='width: 200px'	id='school_name' name='school_name' value='${sc_dto.school_name_college}'></td>
	
				</tr>
				<tr>
					<th>전공</th>
					<td><input class='input' type='text' style='width: 200px' id='school_major' name='school_major' value='${sc_dto.school_major}'></td>
				</tr>
				<tr>
					<th>학점</th>
						<c:set var="e" value='${fnc:split( sc_dto.school_rank, "/" )}'/>	
					
						<td><input class='input' type='text' style='width: 60px'id='school_rank1' name='school_rank1' maxlength='3' value='${e[0]}'> / 
						<input	class='input' type='text' style='width: 60px' id='school_rank2'	name='school_rank2' maxlength='3' value='${e[1]}'></td>
					  
				</tr>
				</c:if>
			</c:forEach>
		</table>

























</table>




