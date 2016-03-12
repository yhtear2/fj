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
<link href="/fj/FJ_RECRUIT/recruit.css" type="text/css" rel="stylecheet">
<!-- 전체 크기 잡기 -->
<div class="recruit_contentsize">
	<!-- 여기에는 기업정보에서 가져오는 기본입력 폼 -->
	<div class="comptitle">
			<span class="comptitle_sub">${dto.name}</span>
			<h3 class="comptitle_sub">${dto.title}</h3>
			<span class="comptitle_sub">${compdto.comp_type}</span>
	</div>
	<div class="panel panel-default">
		<!-- 대표자명 / 기업구분 / 담당자 / 전화번호  / 우편번호 / 주소 / 자본금 / 기업업종 / 회사설립일 / 연매출 / 사원수 -->	
		<div class="comptext panel">
			<table class="table table-hover">
				<tr>
					<th>대표자명</th>
					<td>${compdto.ceo}</td>
					<th>기업구분</th>
					<td>${compdto.comp_part}</td>
				</tr>
				<tr>
					<th>담당자</th>
					<td>${compdto.incharge}</td>
					<th>전화번호</th>
					<td>${compdto.tel}</td>
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
					<td>${compdto.capital}</td>
					<th>기업업종</th>
					<td>${compdto.comp_type}</td>
				</tr>
				<tr>
					<th>회사설립일</th>
					<td colspan="3">${compdto.comp_reg_date}</td>
				</tr>
				<tr>
					<th>연매출</th>
					<td colspan="3">${compdto.year_sale}</td>
				</tr>
				<tr>
					<th>사원수</th>
					<td colspan="3">${compdto.emp_count}</td>
				</tr>
			</table>
		</div>
		<!-- 여기는 담당업무, 근무조건 -->
			<!-- 제목 -->
			<!-- 근무조건 : 지역 / 급여 / 근무형태 / 근무요일 -->
			<!-- 지원자격 : 기술 / 경력 / 학력 / 성별 / 나이   -->
			<!-- 담당업무  / 채용시작일 / 채용종료일 -->
	</div>
	<div class="middle">
		<div>
			<span class="span">자본금</span>
			<span class="span">${compdto.capital}</span>
		</div>
		<div>
			<span class="span">설립일</span>
			<span class="span">${compdto.comp_reg_date}</span>
		</div>
		<div>
			<span class="span">연매출</span>
			<span class="span">${compdto.year_sale}</span>
		</div>
		<div>
			<span class="span">사원수</span>
			<span class="span">${compdto.emp_count}</span>
		</div>
		<div>
			<span class="span">나이</span>
			<span class="span">${dto.min_age} ~ ${dto.max_age}</span>
		</div>
		<div>
			<span class="span">근무형태</span>
			<span class="span">${dto.work_type}</span>
		</div>
		<div>
			<span class="span">학력</span>
			<span class="span">${dto.edu}</span>
		</div>
		<div>
			<span class="span">담당업무</span>
			<span class="span">${dto.business_part}</span>
		</div>
	</div>
	<!-- 상세 내용 -->
	<div class="business panel">
		<div>
			<h4>근무조건</h4>
			<table class="table table-hover">
				<tr>
					<th>지역</th>
					<td>${dto.work_area}</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>${dto.min_salary} ~ ${dto.max_salary}</td>
				</tr>
				<tr>
					<th>근무형태</th>
					<td>${dto.work_type}</td>
				</tr>
				<tr>
					<th>근무요일</th>
					<td>${dto.work_day}</td>
				</tr>
			</table>
		</div>
		<div>
			<h4>지원자격</h4>
			<table class="table table-hover">
				<tr>
					<th>기술</th>
					<td>${dto.skill}</td>
				</tr>
				<tr>
					<th>경력</th>
					<td>${dto.min_career} ~ ${dto.max_career}</td>
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
					<td>${dto.min_age} ~ ${dto.max_age}</td>
				</tr>
			</table>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th>담당업무</th>
					<td>${dto.business_part}</td>
					<th>채용기간</th>
					<td>${dto.start_date} ~ ${dto.end_date}</td>
				</tr>
			</table>
		</div> 
	</div> 
	<div class="recruittext panel panel-default">
		${dto.content}
	</div>
	
	<!-- 버튼을 만들꺼에요~ -->
	<!-- 자기가 쓴글에만 보여야 하니깐 일단 이렇게 보류 -->
	<c:if test="${sessionScope.memId == dto.email}"></c:if>
	<br><br>
	<div>
		<form action="recruitModifyView.do" method="post" >
		<input type="hidden" name="recruit_id" value="${dto.recruit_id}">
		<a href="recruitList.do" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">취소</a> 	  
		<input type="submit" value="정보 수정" class="create btn btn-success btn-wide pull-right" >
		</form> 
	</div>
</div>

<!--  
font-style : '돋움';
font-size : 10px;
color : white;
background-color : #0059b3;

line : #cccccc
-->