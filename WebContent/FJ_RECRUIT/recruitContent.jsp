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
 
<!-- 전체 크기 잡기 -->
<div>
	<!-- 여기에는 기업정보에서 가져오는 기본입력 폼 -->
	<div>
		<!-- 대표자명 / 기업구분 / 담당자 / 전화번호  / 우편번호 / 주소 / 자본금 / 기업업종 / 회사설립일 / 연매출 / 사원수 -->	
		<div>
		</div>
	</div>
		
	<!-- 여기는 담당업무, 근무조건 -->
	<div>
		<!-- 제목 -->
		<!-- 근무조건 : 지역 / 급여 / 근무형태 / 근무요일 -->
		<!-- 지원자격 : 기술 / 경력 / 학력 / 성별 / 나이   -->
		<!-- 담당업무  / 채용시작일 / 채용종료일 -->
	</div>

	<!-- 상세 내용 -->
	<div>
		${dto.content}
	</div>
</div>