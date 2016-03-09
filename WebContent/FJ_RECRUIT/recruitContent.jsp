<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="setting.jsp"%>

<!-- 
	*** 핸들러에서 넘어오는 데이터 ***
		내용		  /	변수이름
	채용정보 입력한 내용 :	dto			빈이름 : RecruitDataBean
	기업정보 입력한 내용 :	compdto		빈이름 : CompDataBean
	페이지 넘버 :		pageNum
	
	참조페이지 (사람인)
	http://www.saramin.co.kr/recruit/RecruitBbsSearch.php?code=bbs_recruit&method=NL&mode=view&idx=26403226&t_ref=jobcategory_recruit&t_ref_content=generic
	
	화이팅!!
 -->
<script type="text/javascript">
	//탭메뉴 기능 삭제
</script> 

<!-- 전체 크기 잡기 -->
<div class="recruit_mainsize">
	<!-- 여기에는 기업정보에서 가져오는 기본입력 폼 -->
	<div class="panel panel-default">
		<!-- 대표자명 / 기업구분 / 담당자 / 전화번호  / 우편번호 / 주소 / 자본금 / 기업업종 / 회사설립일 / 연매출 / 사원수 -->	
		<div class="comptext panel panel-body">
			<h4>${dto.name}</h4>
			<h1>${dto.title}</h2>
			<table>
				<tr>
					<th>대표자명</th>
					<td> : ${compdto.ceo}</td>
					<th>기업구분</th>
					<td> : ${compdto.comp_part}</td>
				</tr>
				<tr>
					<th>담당자</th>
					<td> : ${compdto.incharge}</td>
					<th>전화번호</th>
					<td> : ${compdto.tel}</td>
				</tr>
				<tr>
					<th rowspan="2">주소</th>
					<td colspan="3">우편번호 : ${compdto.zipcode}</th>
				</tr>
				<tr>
					<td colspan="3">${compdto.address}</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td> : ${compdto.capital}</td>
					<th>기업업종</th>
					<td> : ${compdto.comp_type}</td>
				</tr>
				<tr>
					<th>회사설립일</th>
					<td colspan="3"> : ${compdto.comp_reg_date}</td>
				</tr>
				<tr>
					<th>연매출</th>
					<td colspan="3"> : ${compdto.year_sale}</td>
				</tr>
				<tr>
					<th>사원수</th>
					<td colspan="3"> : ${compdto.emp_count}</td>
				</tr>
			</table>
		</div>
		<!-- 여기는 담당업무, 근무조건 -->
		<div class="business panel panel-footer">
			<h2>${dto.title}</h2>
			<div>
				<h4>근무조건</h4>
				<table>
					<tr>
						<th>지역</th>
						<td colspan="2">${dto.work_area}</td>
					</tr>
					<tr>
						<th>급여</th>
						<td>${dto.min_salary} ~ </td>
						<td>${dto.max_salary}</td>
					</tr>
					<tr>
						<th>근무형태</th>
						<td colspan="2">${dto.work_type}</td>
					</tr>
					<tr>
						<th>근무요일</th>
						<td colspan="2">${dto.work_day}</td>
					</tr>
				</table>
			</div>
			<div>
				<h4>지원자격</h4>
				<table>
					<tr>
						<th>기술</th>
						<td>${dto.skill}</td>
					</tr>
					<tr>
						<th>경력</th>
						<td>${dto.min_career} ~ </td>
						<td>${dto.max_salary}</td> 
					</tr>
					<tr>
						<th>학력</th>
						<td>${dto.edu}</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>${dto.gender}</td>
					</tr>
					<tr>
						<th>나이</th>
						<td>${dto.min_age} ~ </td>
						<td>${dto.max_age}</td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<th>담당업무</th>
						<td>${dto.business_part}</td>
						<th>채용기간</th>
						<td>${dto.start_date} ~ </td>
						<td>${dto.end_date}</td>
					</tr>
				</table>
			</div>
			<!-- 제목 -->
			<!-- 근무조건 : 지역 / 급여 / 근무형태 / 근무요일 -->
			<!-- 지원자격 : 기술 / 경력 / 학력 / 성별 / 나이   -->
			<!-- 담당업무  / 채용시작일 / 채용종료일 -->
		</div>
	</div>

	<!-- 상세 내용 -->
	<div class="recruittext panel panel-default">
		${dto.content}
		임의 테스트<br>
		dto.content는 왜 불러와지지 않는가<br>
		아아아아아아아아아아아아아<br>
		임의 테스트<br>
		dto.content는 왜 불러와지지 않는가<br>
		아아아아아아아아아아아아아<br>
		임의 테스트<br>
		dto.content는 왜 불러와지지 않는가<br>
		아아아아아아아아아아아아아<br>
		임의 테스트<br>
		dto.content는 왜 불러와지지 않는가<br>
		아아아아아아아아아아아아아<br>
		임의 테스트<br>
		dto.content는 왜 불러와지지 않는가<br>
		아아아아아아아아아아아아아<br>
		임의 테스트<br>
		dto.content는 왜 불러와지지 않는가<br>
		아아아아아아아아아아아아아<br>
		임의 테스트<br>
		dto.content는 왜 불러와지지 않는가<br>
		아아아아아아아아아아아아아<br>
		임의 테스트<br>
		dto.content는 왜 불러와지지 않는가<br>
		아아아아아아아아아아아아아<br>
		임의 테스트<br>
		dto.content는 왜 불러와지지 않는가<br>
		아아아아아아아아아아아아아<br>
		
		<input type="button" value="탭1" onclick="tab1()">
		<input type="button" value="탭1" onclick="tab2()">
		<input type="button" value="탭1" onclick="tab3()">
		<input type="button" value="탭1" onclick="tab4()">
		<div class="tab1">
			탭1
		</div>
		<div class="tab2">
			탭2
		</div>
		<div class="tab3">
			탭3
		</div>
		<div class="tab4">
			탭4
		</div>
	</div>
	
	
</div>