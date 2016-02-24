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
		<form method="post" name="form" action="compInputPro.do">
			<label><h2>기업정보 입력(필수)</h2></label><br>
			<!-- 각 칸마다 크기 -->			
			<div class="form-group-hs">
				<input type="text" class="form-control" name="company_nm" onblur="" placeholder="회사명">
			</div>
			<div class="form-group-hs">
				<input type="text" class="form-control" placeholder="대표자명">
			</div>
			<div class="form-group-hs">
				<div style="float: left;">
				<input readonly="readonly" type="text" class="form-control" style="width: 300px;float: left;"  placeholder="우편번호 / 회사주소">
			    <button class="btn btn-default" style="float: right; margin: 0px 0px 10px 200px">우편번호 검색</button> <br>
			    </div>
				<input type="text" class="form-control" placeholder="상세주소">
		    </div>
			<div class="form-group-hs">
				<label style="width: 100px; float: left; font-weight: bold; font-size: 1.2em;" >기업구분</label>
				<div style="float: left; margin-left: 30px; border-left-color: black;"> <input type="radio" value="주식회사">주식회사</div>
				<div style="float: left; margin-left: 30px;"> <input type="radio" value="사단법인">사단법인</div>
				<div style="float: left; margin-left: 30px;"> <input type="radio" value="벤처기업">벤처기업</div>
				<div style="float: left; margin-left: 30px; margin-right: 30px;"> <input type="radio" value="스타트업">스타트업</div>
				<div> <input type="radio" value="개인">개인</div>
			</div>
		    <div class="form-group-hs">
		    	<input type="text" class="form-control" style="margin-bottom: 10px" placeholder="담당자">
		    	<select class="form-control" style="width: 25%; float: left;">
					<option>010</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
		        </select>
		        <input type="text" class="form-control" style="width: 75%" placeholder="휴대폰 번호 '-' 없이 입력">
			</div>
			<br><br>		
			<label><h2>기업정보 입력(선택)</h2></label><br>
			<div class="form-group-hs"">
				<input type="date" class="form-control" style="float: left; width: 60%; margin-right: 10px" placeholder="설립일">
				<input type="text" class="form-control" style="width: 38%;" placeholder="회사 자본금">
			</div>
			<div class="form-group-hs"">   	
			   	<input type="text" class="form-control" style="float: left; width: 30%;" placeholder="연매출">
				<input type="text" class="form-control" style="float: left; width: 30%; margin: 0px 10px 0px 10px" placeholder="사원수"> 
				<input type="text" class="form-control" style="width: 36%" placeholder="업종">
			</div>
			<div class="form-group-hs"">   	
			   	<textarea rows="20" cols="88%" placeholder="회사 소개를 입력해주세요"></textarea> 
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
</body>