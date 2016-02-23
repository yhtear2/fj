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
			<label style="font-size: 1.5em;">기업정보 입력(필수)</label><br>
			<!-- 각 칸마다 크기 -->			
			<div class="form-group-hs">
				<!-- 하나하나 칸의 크기 -->
				<ul>
			    	<li>
						<input type="text" class="form-control" name="company_nm" onblur="" placeholder="회사명">
					</li>
					<li><input type="text" class="form-control" placeholder="대표자명"> </li>	
			    </ul>
			    <ui>
			    	
			   	</ui>
			</div>
			<div class="form-group-hs">
			    
			</div>
			<div class="form-group-hs">
			    <div class="col-lg-10">
			    	<nc>*</nc><input type="text" class="form-control" placeholder="우편번호 / 회사주소">
			    	<button class="btn btn-default">우편번호 검색</button>
				</div>
				<div class="col-lg-10">
					<input type="text" class="form-control" placeholder="상세주소">
				</div>
		    </div>
		    
		    <br>	
			<div class="form-group" style="background-color: white;">
				<div class="radio">
					<label for="inputEmail" class="col-lg-2 control-label"><nc>*</nc>기업구분</label>
					<input type="radio" name="optionsRadios" value="option2">일반
					<input type="radio" name="optionsRadios" value="option2">헤드헌팅
					<input type="radio" name="optionsRadios" value="option2">인재파견
				</div>
			    <div class="col-lg-10">
			    	<nc>*</nc><input type="text" class="form-control" placeholder="담당자">
		    	</div>
			    <div class="col-lg-10" style="width: 60">
			    	<nc>*</nc>
			    	<select class="form-control" id="select">
						<option>010</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
			        </select>
			        <input type="text" class="form-control" placeholder="휴대폰 번호 '-' 없이 입력">
				</div>
			</div>
				
								

			<br>		
			<label style="font-size: 1.5em;">기업정보 입력(선택)</label><br>
			<div class="form-group" style="background-color: white;">
				<div class="col-lg-10">	<input type="text" class="form-control" placeholder="설립일">	</div>
			   	
			   	<div class="col-lg-10">	<input type="text" class="form-control" placeholder="회사 자본금">	</div>
			   	
			   	<div class="col-lg-10"> <input type="text" class="form-control" placeholder="연매출">	</div>
			   	
			   	<div class="col-lg-10">	<input type="text" class="form-control" placeholder="사원수"> </div>
			   	
			   	<div class="col-lg-10">	<textarea rows="20" cols="80"></textarea> </div>
			</div>
			<br>
			
			<!-- 버튼 부분 -->
			<div class="form-group" >
				<div class="col-lg-10 col-lg-offset-2">
		      		<button type="reset" class="btn btn-default">취소</button>
		      		<button type="submit" class="btn btn-primary">입력</button>
		      	</div>
		    </div>
		</form>
	</div>
</c:if>
</body>



<!-- 사람인꺼 퍼왔어...ㅋㅋㅋ

<div class="cont_division">
	<ul class="write_base select_input">

		<li class="must item"><label for="corp_code" class="">사업자
				등록 번호</label><input type="text" id="corp_code" name="corp_code"
			class="ether_btn" maxlength="12" onblur="chkCorpCode(this);"
			placeholder="사업자 등록 번호">
			<p class="btn_check" onclick="membercompanyConfirm(); return false;">
				<a href="javascript:" class="">인증 확인</a>
			</p>
			<p class="alert_column warning_txt" id="msg_corp_code_1"
				style="display: block;">필수정보 입니다.</p>
			<p class="alert_column good_txt" id="msg_corp_code_2"
				style="display: none;">사업자 등록번호가 성공적으로 인증되었습니다.</p></li>

		<li class="must item">
			<label for="company_nm" id="company_nm_lb" class="">회사명</label>
			<input type="text" id="company_nm" name="company_nm" onblur="chkCompanyName(this);" placeholder="회사명">
			<p class="base_desc twiceline">	해당 지점(지사)명을 표기하고, 지점(지사)의<br>사업자등록번호를 입력해주시기 바랍니다.	</p>
			<p class="alert_column warning_txt" id="msg_company_name" style="display: block;">필수정보 입니다.</p>
		</li>

		<li class="must item"><label for="ceo_nm" id="ceo_nm_lb" class="">대표자명</label><input
			type="text" id="ceo_nm" name="ceo_nm" onblur="chkCeoName(this);"
			placeholder="대표자명">
			<p class="alert_column warning_txt" id="msg_ceo_nm"
				style="display: block;">필수정보 입니다.</p></li>

		<li class="adress_column must item"><label for="address_main"
			id="corp_adress_lb" class="">우편번호 / 회사주소</label> <input type="text"
			id="address_main" name="address_main" class="ether_btn" readonly=""
			placeholder="우편번호 / 회사주소">
			<div class="input_collect">
				<p class="btn_check"
					onclick="var w=window.open('/zf_user/popup/address?opener=join_c','postalcode','width=326,height=199,scrollbars=yes,resizable=no'); w.blur(); w.focus(); return false;">
					<a href="javascript:" class="">우편번호 검색</a>
				</p>
			</div>
			<p class="alert_column warning_txt" id="msg_address">&nbsp;</p></li>

		<li class="end item"><label for="address_details" class="">상세주소</label><input
			type="text" id="address_sebu" name="address_sebu"
			class="fullsize_input" placeholder="상세주소"> <input
			type="hidden" name="address_details" value="" id="address_details">
		</li>

	</ul>
</div>
 -->