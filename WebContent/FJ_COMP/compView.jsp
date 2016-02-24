<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="/defaultSetting.jsp"%>
<%@ include file="setting.jsp"%>

<!-- style sheet -->
<link rel="stylesheet" href="/fj/FJ_COMP/comp.css">    

<!-- 전체 크기 설정 css -->
<div class="container" >
	<!-- 포스트로 데이터 넘기기 위한 폼 -->
	<form method="post" action="compModify.do" onload="comp_part_check(${dto.comp_part})">
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
			<div style="float: left; margin-left: 30px; border-left-color: black;"> <input type="radio" name="comp_part" value="주식회사">주식회사</div>
			<div style="float: left; margin-left: 30px;"> <input type="radio" name="comp_part" value="사단법인">사단법인</div>
			<div style="float: left; margin-left: 30px;"> <input type="radio" name="comp_part" value="벤처기업">벤처기업</div>
			<div style="float: left; margin-left: 30px; margin-right: 30px;"> <input type="radio" name="comp_part" value="스타트업">스타트업</div>
			<div> <input type="radio" name="comp_part" value="개인">개인</div>
		</div>
	    <div class="form-group-hs">
	    	<input type="text" name="incharge" class="form-control" style="margin-bottom: 10px" value="${dto.incharge}">
	    	<select class="form-control" name="tel_1" style="width: 25%; float: left;"  >
	    		<option>직접입력</option>
				<option>010</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
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
		   	<textarea rows="20" cols="88%" name="info" placeholder="회사 소개를 입력해주세요">${dto.info}</textarea> 
		 </div>
		<br>	
		<!-- 버튼 부분 -->
		<div class="form-group" >
			<div class="col-lg-10 col-lg-offset-2" align="right">
				<button type="submit" class="btn btn-primary">수정</button>
	      		<button type="reset" class="btn btn-default">취소</button>
	      	</div>
	    </div>
	</form>
</div>