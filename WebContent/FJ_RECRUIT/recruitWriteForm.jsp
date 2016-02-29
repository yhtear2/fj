<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="setting.jsp"%>

<!-- 전체 크기 잡기 -->
<div>
	
	<!-- 제목 -->
	<div>
		<div>
			<label>제목</label>
			<input type="text" class="form-control1" placeholder="제목을 입력하세요">
		</div>
	</div>
			
	<!-- 여기는 담당업무, 근무조건 -->
	<div>
		<!-- 근무조건 : 지역 / 급여 / 근무형태 / 근무요일 -->
		<div>
			<label><h3>근무조건</h3></label>
			<div style="float : none">
				<div style="position : relative; float : left">
					<label>근무지역</label>
				</div>
				<div style="position : relative; float : left">
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
					<span></span>
					<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="경기">경기</label>
					<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="경북">경북</label>
					<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="경남">경남</label>
					<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="전북">전북</label>
					<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="전남">전남</label>
					<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="충북">충북</label>
					<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="충남">충남</label>
					<label class="checkbox-inline"> <input type="checkbox" name="work_area" value="강원">강원</label>
				</div>
			</div>
			<div>
					<label style="width: 100px">연봉(만원)</label>
					<select class="form-control11" name="min_salary" style="width: 200px" >
					 	<option>1,400만원 이상</option>
					 	<option>1,800만원 이상</option>
					  	<option>2,000만원 이상</option>
					  	<option>2,400만원 이상</option>
					  	<option>2,800만원 이상</option>
					  	<option>3,200만원 이상</option>
					  	<option>3,600만원 이상</option>
					  	<option>4,000만원 이상</option>
					  	<option>4,000만원 이상</option>
					  	<option>5,000만원 이상</option>
					  	<option>6,000만원 이상</option>
					  	<option>7,000만원 이상</option>
					  	<option>8,000만원 이상</option>
					  	<option>9,000만원 이상</option>
					  	<option>1억원 이상</option>
					</select>
					<label style="width: 50px"> ~ </label>
					<select class="form-control11" name="max_salary" style="width: 200px" >
					 	<option>1,400만원 이하</option>
					 	<option>1,800만원 이하</option>
					  	<option>2,000만원 이하</option>
					  	<option>2,400만원 이하</option>
					  	<option>2,800만원 이하</option>
					  	<option>3,200만원 이하</option>
					  	<option>3,600만원 이하</option>
					  	<option>4,000만원 이하</option>
					  	<option>4,000만원 이하</option>
					  	<option>5,000만원 이하</option>
					  	<option>6,000만원 이하</option>
					  	<option>7,000만원 이하</option>
					  	<option>8,000만원 이하</option>
					  	<option>9,000만원 이하</option>
					  	<option>1억원 이하</option>
					 </select>
				 
				
			</div>
			<div></div>
			<div>
				<label>근무형태</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="정규직">정규직</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="계약직">계약직</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="인턴직">인턴직</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="인턴직">프리랜서</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="인턴직 (정규직 전환가능)">인턴직 (정규직 전환가능)</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_type" value=" 연수생 (교육생)"> 연수생 (교육생)</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="별정직">별정직</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_type" value="해외취업">해외취업</label>      
			</div>
			
			<div>  
				<label>근무요일</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="월~일">월~일</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="월~토">월~토</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="월~금">월~금</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="토,일">토,일</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="주6일">주6일</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="주5일">주5일</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="주4일">주4일</label>
				<label class="checkbox-inline"> <input type="checkbox" name="work_day" value="주3일">주3일</label>
			</div>
		</div>
		
		<!-- 지원자격 : 기술 / 경력 / 학력 / 성별 / 나이   -->
		<div>
			<label><h3>지원자격</h3></label>
			<div>
				<label>학력</label>
				<select class="form-control1" name="edu">
					<option>학력무관</option>
					<option>고등학교 졸업</option>
					<option>대학 졸업(2,3년)</option>
					<option>대학교 졸업(4년)</option>
					<option>석사졸업</option>
					<option>박사졸업</option>
				</select>
				<!-- 여기에 성별, 나이 -->
				<label>성별</label>
				<label class="checkbox-inline"> <input type="checkbox" name="gender" value="남자">신입</label>
				<label class="checkbox-inline"> <input type="checkbox" name="gender" value="여자">신입</label>
				<label class="checkbox-inline"> <input type="checkbox" name="gender" value="무관">무관</label>
				<label>연령</label>
				<select class="form-control1" name="age_1">
					<c:set var="a" value="${2015}"/>
					<c:forEach  begin="0" end="50" step="1"> 
						<option>${a}년 이상</option>
						<c:set var="a" value="${a-1}"/>
					</c:forEach>
				</select>
				<label> ~ </label>
				<select class="form-control1" name="age_2">
					<c:set var="b" value="${2016}"/>
					<c:forEach  begin="0" end="50" step="1"> 
						<option>${b}년 이하</option>
						<c:set var="b" value="${b-1}"/>
					</c:forEach>
				</select>
				<label class="checkbox-inline"> <input type="checkbox" name="age_2" value="무관">무관</label>
			</div>
			
			<div>
				<label>경력</label>
				<label class="checkbox-inline"> <input type="checkbox" name="career_1" value="신입">신입</label>
				<label class="checkbox-inline"> <input type="checkbox" name="career_1" value="경력">경력</label>
				<select class="form-control1" name="career_2">
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
				<lable> ~ </lable>
				<select class="form-control1" name="career_3">
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
				<label class="checkbox-inline"> <input type="checkbox" name="career_1" value="경력무관">경력무관</label>
			</div>
			
		</div>
		<!-- 담당업무  / 채용시작일 / 채용종료일 -->
		<div>
			<label>담당업무</label>
			<input type="text">
		</div>
	</div>
	
	
	<!-- 여기에는 기업정보에서 가져오는 기본입력 폼 -->
	<div>
		<!-- 담당자 / 전화번호 -->	
		<div>
			
		</div>
	</div>

	<!-- 상세 내용 적기 -->
	<br>
	<div>
	<div id="summernote" ></div>
	</div>
</div>












