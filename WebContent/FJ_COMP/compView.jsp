<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="/defaultSetting.jsp"%>
<%@ include file="setting.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<!-- style sheet -->
		<link rel="stylesheet" href="/fj/FJ_COMP/comp.css">    	
	</head>
	<body>
		<!-- 전체 크기 설정 css -->
		<!-- email varchar2(50) not null,			// 이메일
				ceo varchar2(50) not null,			// 대표자명
				comp_part varchar2(20) not null,		// 기업구분
				tel varchar2(100) not null,			// 전화번호
				zipcode varchar2(20) not null,			// 우편번호
				address varchar2(100) not null,		// 주소
				info varchar2(2000) not null,			// 회사 소개
				capital varchar2(50),				// 자본금
				comp_type varchar2(50),			// 기업 업종
				incharge varchar2(30),			// 담당자 이름
				comp_reg_date varchar2(10),			// 회사 설립일
				year_sale varchar2(100),			// 연 매출
				emp_count number,				// 사원 수
				like_count number not null,			// 좋아요 수
				reg_date date not null,				// 등록일
				last_date date not null				// 수정일
				);-->
		<div class="container" >
			<h2>${sessionScope.name}</h2>
			<table class="table">
				<tr>
					<th>대표자</th>
					<td>${dto.ceo}</td>
				</tr>
				<tr>
					<th>기업구분</th>
					<td>${dto.comp_part}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${tel_1}-${tel_2}</td>
				</tr>
				<tr>
					<th rowspan="2">주소</th>
					<td>우편번호 : ${dto.zipcode}</td>
				</tr>
				<tr>
					<td>${dto.address}</td>
				</tr>
				<tr>
					<th>회사소개</th>
					<td>${dto.info}</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>${dto.capital}</td>
				</tr>
				<tr>
					<th>업종</th>
					<td>${dto.comp_type}</td>
				</tr>
				<tr>
					<th>담당자</th>
					<td>${dto.incharge}</td>
				</tr>
				<tr>
					<th>설립일</th>
					<td>${dto.comp_reg_date}</td>
				</tr>
				<tr>
					<th>연매출</th>
					<td>${dto.year_sale}</td>
				</tr>
				<tr>
					<th>사원수</th>
					<td>${dto.emp_count}</td>
				</tr>
				<tr>
					<th>좋아요</th>
					<td>${dto.like_count}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${dto.reg_date}</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>${dto.last_date}</td>
				</tr>
			</table>

		</div>	
	</body>
</html>

