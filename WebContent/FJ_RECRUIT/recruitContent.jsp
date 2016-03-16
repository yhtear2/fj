<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="setting.jsp"%>
<script type="text/javascript">
function resome_sub() {
	
		   var url = "recruit_resomeList.do";
		   open(url, "confrimWindow",
		         "menubar=no, statusbar=no, scrollbar=no, toolbar=no, width=450, height=300");
}


</script>

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
		<span>${dto.name}</span>
		<h3 class="comptitle_sub">${dto.title}</h3>
		<span class="comptitle_sub">(${compdto.comp_type})</span>
	</div>
	
	<form name="recruitContent">
	<table>
	
	<tr>
		<th></th>
		
		<td>   
			<c:if test='${member_flag== 1}'>
		      	<input class="btn btn-default"  type="button" value="지원하기" style="width:100px" onclick="resome_sub()">
				<input type="hidden" name="str" id="str">
			</c:if>
			<c:if test='${member_flag!= 1}'>
				<br>
			</c:if>
	
		</td>
	</tr>
	<tr>
	<td>현재 지원 인원은 ${count} 명입니다.</td>
	
	</tr>
	</table>	
	</form>

	<form name="recruitContent">
	<table>
	
	<tr>
		<th></th>
		
		<td>   
			<c:if test='${member_flag== 2}'>
			<c:if test='${dto.email == memId}'>
			
		      	<input class="btn btn-default"  type="button" value="입사지원현황 보기" style="width:150px" onclick="window.location='recruit_situation.do?recruit_id=${dto.recruit_id}'">
				<input type="hidden" name="str" id="str">
			</c:if>
			</c:if>
			<c:if test='${member_flag!= 2}'>
			<c:if test='${dto.email != memId}'>
			
				<br>
			</c:if>
			</c:if>
	
		</td>
	</tr>
	</table>	
	</form>	
	
	<div class="panel panel-default">
		<!-- 대표자명 / 기업구분 / 담당자 / 전화번호  / 우편번호 / 주소 / 자본금 / 기업업종 / 회사설립일 / 연매출 / 사원수 -->	
		<div class="comptext panel">
			<table class="table table-hover">
				<tr>
					<th>대표자명</th>
					<td colspan="2">${compdto.ceo}</td>
					<th>기업업종</th>
					<td colspan="2">${compdto.comp_type}</td>
				</tr>
				<tr> 
					<th>주소</th>
					<td colspan="5">우편번호 : ${compdto.zipcode} / 주소 : ${compdto.address}</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>${compdto.capital}</td>
					<th>설립일</th>
					<td>${compdto.comp_reg_date}</td>
					<th>연매출</th>
					<td>${compdto.year_sale}</td>					
				</tr>   
				<tr>
					<th>사원수</th>
					<td>${compdto.emp_count}</td>
					<th>담당자</th>
					<td>${compdto.incharge}</td>
					<th>전화번호</th>
					<td>${tel}</td>
				</tr>
			</table>
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
		</div>
		<!-- 여기는 담당업무, 근무조건 -->
			<!-- 제목 -->
			<!-- 근무조건 : 지역 / 급여 / 근무형태 / 근무요일 -->
			<!-- 지원자격 : 기술 / 경력 / 학력 / 성별 / 나이   -->
			<!-- 담당업무  / 채용시작일 / 채용종료일 -->
	</div>
	
	<!-- 상세 내용 --> 
	
	
	<div class="business_title">
		<div><h4>근무조건</h4></div>
		<div><h4>지원자격</h4></div>
	</div>
	<div class="business panel panel-default">
		<div class="tablediv">
			<table class="business_table table table-hover">
				<tr>
					<th>지역</th>
					<td>${dto.work_area}</td>
				</tr>
				<tr>
					<th>급여</th>
					<td>${dto.min_salary}만원 ~${dto.max_salary}만원</td>
				</tr>
				<tr>
					<th>근무형태</th>
					<td>${dto.work_type}</td>
				</tr>
				<tr>
					<th>근무요일</th>
					<td>${dto.work_day}</td>
				</tr>
				<tr>
					<th>담당업무</th>
					<td>${dto.business_part}</td>
				</tr>
			</table>
		</div>
		<div class="tablediv">
			<table class="business_table table table-hover">
				<tr>
					<th>기술</th>
					<td>${dto.skill}</td>
				</tr>
				<tr>
					<th>경력</th>
					<td>${career}</td>
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
					<td>${age}</td>
				</tr>
			</table>
		</div>
		<div class="tablediv">
			<table class="table table-hover">
				<tr>
					<th class="lastth">채용기간</th>
					<td>${dto.start_date} ~ ${dto.end_date}</td>
				</tr>
			</table>
		</div>
		<div class="middle">
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
	</div>
	<div class="recruittitle"><h4>모집요강</h4></div>
	<div class="recruittext">
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

