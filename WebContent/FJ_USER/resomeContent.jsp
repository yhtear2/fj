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
      <td rowspan="5"><img  class="img-rounded"  id="img_preview" name="img_preview" value="${photo}" style="margin-left: auto; margin-right: auto; display: block; width:150px; height:190px;"/>
   
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
			<input class="input" style="width:100px" name="tel1" maxlength="25" value="${e[0]}"> - 
			<input class="input" style="width:100px" name="tel2" maxlength="25" value="${e[1]}"> - 
			<input class="input" style="width:100px" name="tel3" maxlength="25" value="${e[2]}">
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
      <th> 스킬 </th>
		 <td class="form-control" style="text-align: center; width: 650px"> ${dto.skill} </td>
	</tr>	
   <tr>
      <th> 자격증 </th>
		 <td class="form-control" style="text-align: center; width: 650px"> ${dto.license} </td>
	</tr>		
</table>

<table class="table table-hover" style="width:800px">

   <tr>
      <th style="width:89px">보유기술</th>
         <td class="form-control" style="text-align: center; width: 650px"> ${dto.skill} </td>

   </tr>      
   <tr>
      <th>희망연봉</th>
         <td class="form-control" style="text-align: center; width: 650px"> ${dto.want_salary} </td>
   </tr>
</table>


   <table id="license_table" class="table table-hover" style="width:800px">
      <tr>
         <th>자격증 이름</th>
         <th>발행일자</th>
         <th>발행일처</th>
      </tr>
      <tr>
      		<c:if test='${dto.license != null && dto.license != "" }'>	
      		<c:forTokens var="e" items='${dto.license}' delims="/">
      			<c:forTokens var="k" items="${e}" delims="-">
      				 <td style="width:160px"> <input type="text" name="license10" id="license10" style="width:220px" value="${k}"> </td>		  
      			</c:forTokens>
      			
      		</c:forTokens>
      		
      		<!-- 
      			<c:set var="e" value='${fnc:split( dto.license, "/" )}'/>	
      				<c:forEach var="li_i" begin="0" end="${fn:length('${e[0]}')-1}" varStatus="stat">	
				        <td style="width:160px"> <input type="text" name="license10" id="license10" style="width:220px" value="${e[0]}"> </td>
				        <td style="width:80px"> <input type="text" name="license20" id="license20" style="width:180px" value="${e[1]}"> </td>
		         		<td colspan="2" style="width:200px"> <input type="text" style="width:260px" name="license30" id="license30" value="${e[2]}"></td>
		         	</c:forEach>
		      -->
        	 </c:if>
      </tr>
      </table>

x














