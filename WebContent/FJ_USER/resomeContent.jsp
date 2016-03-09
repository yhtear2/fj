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
      <td>
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
      <td>
      	<c:if test='${dto.army != null && dto.army != "" }'>										
			<c:set var="e" value='${fnc:split( dto.army, "/" )}'/>	
            <select class="" style="width: 120px" name="army1" id="army1">
               <option>${e[0]}</option>      
            </select>
            <input class="" style="width:100px" name="army2" value="${e[1]}">			
			<input class="" style="width:100px" name="army3" value="${e[2]}">
            <select class="" style="width: 120px" name="army4" id="army4">
               <option>${e[3]}</option>      
            </select>
            <select class="" style="width: 120px" name="army5" id="army5">
               <option>${e[4]}</option>      
            </select>
            <select class="" style="width: 120px" name="army6" id="army6">
               <option>${e[5]}</option>      
            </select>
            <input class="input" style="width:100px" name="army7" maxlength="25" value="${e[6]}">
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
      <tr>
         <th style="width:230px">자격증 이름</th>
         <th style="width:230px"> 발행일자</th>
         <th style="width:230px">발행일처</th>
      </tr>
      <tr>
			<td style="width:800px"  colspan="2">
      		<c:if test='${dto.license != null && dto.license != "" }'>	
      		<c:forTokens var="e" items='${dto.license}' delims="/">
      			<c:forTokens var="k" items='${e}' delims="-">
      				  <input type="text" name="license10" id="license10"   style="width:180px; border:none;" value="${k}">
      			</c:forTokens>		
      			
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
<table>
<c:forEach var="sc_dto" items="${result}">

   <tr>
      <th style="width:100px">재학기간</th>
         <td style="width: 520px">
            <input class="" type="text" style="width:210px" name="highschool_start_date" id="highschool_start_date" value="${sc_dto.school_start_date}"> ~
            <input class="" type="text" style="width:210px" name="highschool_last_date" id="highschool_last_date" value="${sc_dto.school_last_date}">
            <select class="" style="width: 80px" name="highschool_college" id="highschool_college">
               <option value="졸업">졸업</option>
               <option value="졸업예정">졸업예정</option>      
            </select>         
         </td>
   </tr>

   <tr>      
      <th>학교명</th>
      <td> <input class="" type="text" style="width:200px" name="highschool_name" id="highschool_name">
         <select class="" style="width: 150px" name="highschool_name_kind" id="highschool_name_kind">
            <option value="문과계열">문과계열</option>
            <option value="이과계열">이과계열</option>      
            <option value="전문(실업)계열">전문(실업)계열</option>
            <option value="예체능계열">예체능계열</option>   
         </select>   
      </td>
   </tr>	
   </c:forEach>
























</table>




