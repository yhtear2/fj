<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="/defaultSetting.jsp"%>
<%@ include file="setting.jsp"%>

<!-- style sheet -->
<link rel="stylesheet" href="/fj/FJ_COMP/comp.css">

<!-- body -->
<body>
<!-- 비밀번호 불일치 	 -->
<c:if test="${result == 0}">
	<script type="text/javascript">
		errorAlert("${msg_passwordCheck}");
	</script>
</c:if>

<!-- 비밀번호 일치 -->
<c:if test="${result == 1}">
	<!-- 전체 크기 설정 css -->
	<div class="container" >
		<!-- 포스트로 데이터 넘기기 위한 폼 -->
		<form method="post" action="compInputPro.do" onsubmit="compInputFormcheck()">
			<label><h2>기업정보 입력(필수)</h2></label><br>
			<!-- 각 칸마다 크기 -->			
			<div class="form-group-hs">
				${name}
			</div>
			<div class="form-group-hs">
				<input type="text" name="ceo" class="form-control" placeholder="대표자명">
			</div>
			<div class="form-group-hs">
				<div style="float: left;">
				<!-- 입력 막는거 일단 빼 놓음 readonly="readonly" -->
				<input type="text" name="zipcode" class="form-control" style="width: 300px;float: left;"  placeholder="우편번호 / 회사주소">
			    <button class="btn btn-default" style="float: right; margin: 0px 0px 10px 200px">우편번호 검색</button> <br>
			    </div>
				<input type="text" name="address" class="form-control" placeholder="상세주소">
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
		    	<input type="text" name="incharge" class="form-control" style="margin-bottom: 10px" placeholder="담당자">
		    	<select class="form-control" name="tel_1" style="width: 25%; float: left;">
		    		<option>직접입력</option>
					<option>010</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
		        </select>
		        <input type="text" name="tel_2" class="form-control" style="width: 75%" placeholder="전화번호 '-' 없이 입력">
			</div>
			<br><br>		
			<label><h2>기업정보 입력(선택)</h2></label><br>
			<div class="form-group-hs">
				<input type="date" name="comp_reg_date" class="form-control" style="float: left; width: 60%; margin-right: 10px" placeholder="설립일">
				<input type="text" name="capital" class="form-control" style="width: 38%;" placeholder="회사 자본금">
			</div>
			<div class="form-group-hs">   	
			   	<input type="text" name="year_sale" class="form-control" style="float: left; width: 33%;" placeholder="연매출">
				<input type="text" name="emp_count" class="form-control" style="float: left; width: 33%; margin: 0px 10px 0px 10px" placeholder="사원수 (숫자 입력)"> 
				<input type="text" name="comp_type" class="form-control" style="width: 30%" placeholder="업종">
			</div>
				<div class="recruit_size">
					<input type="hidden" name="content" value="">
					<div id="summernote" ></div>
				</div>
			<br>	
			<!-- 버튼 부분 -->
			<div class="form-group" >
				<div class="col-lg-10 col-lg-offset-2" align="right">
					<button type="submit" class="btn btn-primary">입력</button>
		      		<button type="reset" class="btn btn-default">취소</button>
		      	</div>
		    </div>
		</form>
	</div>
</c:if>
<c:if test="${result == 2}">
	<script type="text/javascript">
		window.location='compModifyView.do';
	</script>
</c:if>
</body>