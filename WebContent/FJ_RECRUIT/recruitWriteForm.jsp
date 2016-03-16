<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="setting.jsp"%>

<!-- 로그인을 안했을때  -->
	<c:if test="${sessionScope.memId == null}">
		<script type="text/javascript">
		<!--
			alert("로그인이 필요합니다");
			window.location.href='joinMain.do';
		//-->
		</script>
	</c:if>

<!-- 기업회원 정보 입력 안했을때 -->
	<c:if test="${compinfochekc == 0}">
		<script type="text/javascript">
		<!--
			alert("기업회원 정보를 먼저 입력해주세요");
			window.location.href='compInputCheck.do';
		//-->
		</script>
	</c:if>
 
<!-- 기업회원 정보 입력 했을때 -->
<c:if test="${compinfochekc == 1}">
<!-- 전체 크기 잡기 -->
<div class="recruit_mainsize">
<form name="recruitWriteForm" method="post" action="recruitWritePro.do" onsubmit="return recruitwritecheck()">
	<label><h2>채용공고</h2></label>
	<!-- 제목 -->
	<div class="recruit_size">
		<div>
			<label><h4>제목</h4></label>
			<input type="text" name="title" class="form-control_hs" placeholder="제목을 입력하세요">
		</div>
	</div>
	<br>
	<!-- 여기는 담당업무, 근무조건 -->
	<div class="recruit_size">
		<!-- 근무조건 : 지역 / 급여 / 근무형태 / 근무요일 -->
		<label><h4>근무조건</h4></label>
		<div class="recruit_minisize">
			<label style="margin-right : 30px;">근무지역</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="서울">서울</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="부산">부산</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="인천">인천</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="대구">대구</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="대전">대전</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="광주">광주</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="울산">울산</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="제주">제주</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="세종">세종</label>
			<br>
			<label style="margin-right : 86px;"></label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="경기">경기</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="경북">경북</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="경남">경남</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="전북">전북</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="전남">전남</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="충북">충북</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="충남">충남</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="강원">강원</label>
		</div>
		<div class="recruit_minisize">
				<label style="margin-right : 20px;">연봉(만원)</label>
				<select class="form-control_hs1" name="min_salary" style="width: 150px;" >
				 	<option>1400만원 이상</option>
				 	<option>1800만원 이상</option>
				  	<option>2000만원 이상</option>
				  	<option>2400만원 이상</option>
				  	<option>2800만원 이상</option>
				  	<option>3200만원 이상</option>
				  	<option>3600만원 이상</option>
				  	<option>4000만원 이상</option>
				  	<option>5000만원 이상</option>
				  	<option>6000만원 이상</option>
				  	<option>7000만원 이상</option>
				  	<option>8000만원 이상</option>
				  	<option>9000만원 이상</option>
				</select>
				<label style="width: 50px; text-align: center;"> ~ </label>
				<select class="form-control_hs1" name="max_salary" style="width: 150px; text-align: center;" >
				 	<option>1400만원 이하</option>
				 	<option>1800만원 이하</option>
				  	<option>2000만원 이하</option>
				  	<option>2400만원 이하</option>
				  	<option>2800만원 이하</option>
				  	<option>3200만원 이하</option>
				  	<option>3600만원 이하</option>
				  	<option>4000만원 이하</option>
				  	<option>5000만원 이하</option>
				  	<option>6000만원 이하</option>
				  	<option>7000만원 이하</option>
				  	<option>8000만원 이하</option>
				  	<option>9000만원 이하</option>
				 </select>
			 
			
		</div>

		<div class="recruit_minisize">
			<label style="margin-right: 30px;">근무형태</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="정규직">정규직</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="계약직">계약직</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="인턴직">인턴직</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="인턴직">프리랜서</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="해외취업">해외취업</label>      
		</div>
		
		<div class="recruit_minisize">  
			<label style="margin-right : 30px;">근무요일</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="월~일" onClick="checkCheckbox1(this.form,this,1)">월~일</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="월~토" onClick="checkCheckbox1(this.form,this,1)">월~토</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="월~금" onClick="checkCheckbox1(this.form,this,1)">월~금</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="토,일" onClick="checkCheckbox1(this.form,this,1)">토,일</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="주6일" onClick="checkCheckbox1(this.form,this,1)">주6일</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="주5일" onClick="checkCheckbox1(this.form,this,1)">주5일</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="주4일" onClick="checkCheckbox1(this.form,this,1)">주4일</label>
			<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="주3일" onClick="checkCheckbox1(this.form,this,1)">주3일</label>
		</div>
	</div>
	
	<!-- 지원자격 : 기술 / 경력 / 학력 / 성별 / 나이   -->
	<div class="recruit_size">
		<label><h4>지원자격</h4></label>
		<div class="recruit_minisize">
			<label style="margin-right: 20px;">학   력</label>
			<select class="form-control_hs" name="edu" style="width : 200px;">
				<option>학력무관</option>
				<option>고등학교 졸업</option>
				<option>대학 졸업(2,3년)</option>
				<option>대학교 졸업(4년)</option>	
				<option>석사졸업</option>
				<option>박사졸업</option>
			</select>
			
			<label style="margin : 0px 30px 0px 100px;">성   별</label>
			<label class="checkbox-inline"> <input type="checkbox" id="gender" name="gender" value="남자" onClick="checkCheckbox1(this.form,this,1)">남자</label>
			<label class="checkbox-inline"> <input type="checkbox" name="gender" value="여자" onClick="checkCheckbox1(this.form,this,1)">여자</label>
			<label class="checkbox-inline"> <input type="checkbox" name="gender" value="무관" onClick="checkCheckbox1(this.form,this,1)">무관</label>
		</div>
		<div class="recruit_minisize">
			<label style="margin-right: 20px;">연   령</label>
			<select class="form-control_hs" name="min_age" style="width : 200px;">
				<c:set var="a" value="${2015}"/>
				<c:forEach  begin="0" end="50" step="1"> 
					<option>${a}년 이상</option>
					<c:set var="a" value="${a-1}"/>
				</c:forEach>
			</select>
			<label style="width: 50; text-align: center;"> ~ </label>
			<select class="form-control_hs" name="max_age" style="width : 200px;">
				<c:set var="b" value="${2016}"/>
				<c:forEach  begin="0" end="50" step="1"> 
					<option>${b}년 이하</option>
					<c:set var="b" value="${b-1}"/>
				</c:forEach>
			</select>
			<label class="checkbox-inline"	style="margin-left:33px;"> <input type="checkbox" name="age" value="무관">무관</label>
		</div>
		
		<div class="recruit_minisize">
			<label style="margin-right: 20px;">경     력</label>
			<label class="checkbox-inline"> <input type="checkbox" name="career" value="신입" onClick="checkCheckbox1(this.form,this,1)">신입</label>
			<label class="checkbox-inline"> <input type="checkbox" name="career" value="경력" onClick="checkCheckbox1(this.form,this,1)">경력</label>
			<select class="form-control_hs" name="min_career" style="width: 150px; margin-left:10px;">
				<option>1년이상</option>
				<option>2년이상</option>
				<option>3년이상</option>
				<option>4년이상</option>
				<option>5년이상</option>
				<option>8년이상</option>
				<option>10년이상</option>
				<option>15년이상</option>
				<option>20년이상</option>
			</select>
			<label style="width: 26px; text-align: center;"> ~ </label>
			<select class="form-control_hs" name="max_career" style="width:150px;">
				<option>1년이하</option>
				<option>2년이하</option>
				<option>3년이하</option>
				<option>4년이하</option>
				<option>5년이하</option>
				<option>8년이하</option>
				<option>10년이하</option>
				<option>15년이하</option>
				<option>20년이하</option>
			</select>
			<label class="checkbox-inline" style="margin-left:33px;"> <input type="checkbox" name="career" value="경력무관" onClick="checkCheckbox1(this.form,this,1)">경력무관</label>
		</div>
		<!-- 담당자  / 채용시작일 / 채용종료일 -->
		<div class="recruit_minisize">
			<label style="margin-right: 10px;">담당업무</label>
			<input type="text" name="business_part" class="form-control_hs" style="width:200px;" placeholder="담당업무를 입력하세요">
				
			<!-- 기술(skill) -->
			<label style="margin : 0px 3px 0px 15px;">필요기술</label>
			<input type="text" name="skill" id="skill" class="form-control_hs" 
				style="width:300px;" placeholder="클릭해주세요"  onclick="conf_skill()">
		</div>
		<div class="recruit_minisize">
			<!-- 채용인원(people_count) -->
			<label style="margin-right: 10px;">채용인원</label>
			<input type="text" name="people_count" class="form-control_hs" style="width:60px;">
			<label>명</label>
			<label style="margin : 0px 3px 0px 15px;">채용일정</label>
			<input type="date" name="start_date" class="form-control_hs" style="width:200px;">
			<label style="width:20px; text-align: center;"> ~ </label>
			<input type="date" name="end_date" class="form-control_hs" style="width:200px;">
		</div>
		
	</div>
	
	
	<!-- 여기에는 기업정보에서 가져오는 기본입력 폼 -->
	<div class="recruit_size">
		<!-- 담당자 / 전화번호 -->
		<div class="recruit_minisize">
			<label style="margin-right : 15px;"> 담당자 </label>
			<input type="text" name="incharge" value="${dto.incharge}" class="form-control_hs" style="width:120px;">

			<label style="margin : 0px 10px 0px 15px;"> 전화번호 </label>
			<select class="form-control_hs" name="tel_1" style="width: 130px;">
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
		    <label style="width: 30px; text-align: center;"> ㅡ </label>
			<input type="text" name="tel_2" value="${tel_2}" class="form-control_hs" style="width:220px;">
		</div>
	</div>

	<!-- 상세 내용 적기 -->
	<br>
	<div class="recruit_size">
		<div id="summernote" ></div>
	</div>
	<input type="hidden" name="content" value="">
	
	<!-- 버튼 구현부 -->
	<div class="nav" role="navigation">
		<fieldset class="buttons">
		<a href="recruitList.do" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')"
			style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#ffffff"
		>취소</a> 	  
			<input type="submit" class="create btn btn-success btn-wide pull-right" value="전송" 
			style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;"
			> 
		</fieldset>
	</div>
</form>
</div>
</c:if>





	






