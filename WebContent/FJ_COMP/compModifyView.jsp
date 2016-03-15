<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="/defaultSetting.jsp"%>
<%@ include file="setting.jsp"%>

<!-- style sheet -->
<link rel="stylesheet" href="/fj/FJ_COMP/comp.css">    

<!-- 전체 크기 설정 css -->
<div id="background">
<div class="container" >
	<!-- 포스트로 데이터 넘기기 위한 폼 -->
	<form method="post" action="compModifyPro.do" onload="comp_part_check(${dto.comp_part})">
		<input type="hidden" name="" value="">
		<label><h2>기업정보 입력(필수)</h2></label><br>
		<!-- 각 칸마다 크기 -->			
		<div class="form-group-hs">
			여기에 회사명(이름) 이 나오게...
		</div>
		<div class="form-group-hs">
			<input type="text" name="ceo" class="form-control" value="${dto.ceo}">
		</div>
		<div class="form-group-hs">
			<div style="float: left;">
			<!-- 입력 막는거 일단 빼 놓음 readonly="readonly" -->
			<input type="text" name="zipcode" class="form-control" style="width: 300px;float: left;" value="${dto.zipcode}">
		    <button class="btn btn-default" style="float: right; margin: 0px 0px 10px 200px">우편번호 검색</button> <br>
		    </div>
			<input type="text" name="address" class="form-control" value="${dto.address}">
	    </div>
		<div class="form-group-hs">
			<label style="width: 100px; float: left; font-weight: bold; font-size: 1.2em;" >기업구분</label>
			<div style="float: left; margin-left: 30px; border-left-color: black;">
				<c:if test="${dto.comp_part == '주식회사'}"> <input type="radio" name="comp_part" value="주식회사" checked="checked">주식회사 </c:if>
				<c:if test="${dto.comp_part != '주식회사'}"> <input type="radio" name="comp_part" value="주식회사">주식회사 </c:if>
			</div>
			<div style="float: left; margin-left: 30px;">
				<c:if test="${dto.comp_part == '사단법인'}"> <input type="radio" name="comp_part" value="사단법인" checked="checked">사단법인</c:if>
				<c:if test="${dto.comp_part != '사단법인'}"> <input type="radio" name="comp_part" value="사단법인">사단법인</c:if>
			</div>
			<div style="float: left; margin-left: 30px;">
				<c:if test="${dto.comp_part == '벤처기업'}"> <input type="radio" name="comp_part" value="벤처기업" checked="checked">벤처기업</c:if>
				<c:if test="${dto.comp_part != '벤처기업'}"> <input type="radio" name="comp_part" value="벤처기업">벤처기업</c:if>
			</div>
			<div style="float: left; margin-left: 30px; margin-right: 30px;">
				<c:if test="${dto.comp_part == '스타트업'}"> <input type="radio" name="comp_part" value="스타트업" checked="checked">스타트업</c:if>
				<c:if test="${dto.comp_part != '스타트업'}"> <input type="radio" name="comp_part" value="스타트업">스타트업</c:if>
			</div>
			<div> 
				<c:if test="${dto.comp_part == '개인'}"> <input type="radio" name="comp_part" value="개인" checked="checked">개인</c:if>
				<c:if test="${dto.comp_part != '개인'}"> <input type="radio" name="comp_part" value="개인">개인</c:if>
			</div>
		</div>
	    <div class="form-group-hs">
	    	<input type="text" name="incharge" class="form-control" style="margin-bottom: 10px" value="${dto.incharge}">
	    	<select class="form-control" name="tel_1" style="width: 25%; float: left;"  >
	    		<c:if test="${tel_1 == '0'}"> <option selected="selected">직접입력</option> </c:if>
	    		<c:if test="${tel_1 != '0'}"> <option>직접입력</option> </c:if>
				<c:if test="${tel_1 == 010}"> <option selected="selected">010</option> </c:if>
				<c:if test="${tel_1 != 010}"> <option>010</option> </c:if>
				<c:if test="${tel_1 == 011}"> <option selected="selected">011</option> </c:if>
				<c:if test="${tel_1 != 011}"> <option>011</option> </c:if>
				<c:if test="${tel_1 == 016}"> <option selected="selected">016</option> </c:if>
				<c:if test="${tel_1 != 016}"> <option>016</option> </c:if>
				<c:if test="${tel_1 == 017}"> <option selected="selected">017</option> </c:if>
				<c:if test="${tel_1 != 017}"> <option>017</option> </c:if>
				<c:if test="${tel_1 == 018}"> <option selected="selected">018</option> </c:if>
				<c:if test="${tel_1 != 018}"> <option>018</option> </c:if>
				<c:if test="${tel_1 == 019}"> <option selected="selected">019</option> </c:if>
				<c:if test="${tel_1 != 019}"> <option>019</option> </c:if>
	        </select>
	        <input type="text" name="tel_2" class="form-control" style="width: 75%" value="${tel_2}">
		</div>
		<br><br>		
		<label><h2>기업정보 입력(선택)</h2></label><br>
		<div class="form-group-hs">
			<input type="date" name="comp_reg_date" class="form-control" style="float: left; width: 60%; margin-right: 10px" value="${dto.comp_reg_date}">
			<input type="text" name="capital" class="form-control" style="width: 38%;" value="${dto.capital}">
		</div>
		<div class="form-group-hs">   	
		   	<input type="text" name="year_sale" class="form-control" style="float: left; width: 33%;" value="${dto.year_sale}">
			<input type="text" name="emp_count" class="form-control" style="float: left; width: 33%; margin: 0px 10px 0px 10px" value="${dto.emp_count}"> 
			<input type="text" name="comp_type" class="form-control" style="width: 30%" value="${dto.comp_type}">
		</div>
		<div class="form-group-hs">   	
			<input type="hidden" name="content" value="${dto.content}">
		   	<div class="recruit_size">
					<div id="summernote" ></div>
			</div>
			
		 </div>
		<br>	
		<!-- 버튼 부분 -->
		<div class="form-group" >
			<div class="col-lg-10 col-lg-offset-2" align="right">
				<button type="submit" class="btn btn-primary"
				style="font-style:'돋움'; font-size:15px; color:white; background-color:#0059b3; border:1px solid #0059b3;"
				>수정</button>
	      		<button type="reset" class="btn btn-default"
	      		style="color:#0059b3; background-color:#f8f8f8; border:#0059b3 10px solid blue; font-size: 15px; 
				font-style:'돋움';"
	      		>취소</button>
	      	</div>
	    </div>
	</form>
</div>
</div>