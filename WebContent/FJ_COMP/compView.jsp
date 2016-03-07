<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include setting.jsp -->
<%@ include file="/defaultSetting.jsp"%>
<%@ include file="setting.jsp"%>
<c:if test="${tel_1 == alert}">
	<script type="text/javascript">
		alert("기업정보를 먼저 입력해주세요.");
		window.location="compInputCheck.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
	<head>
		<!-- style sheet -->
		<link rel="stylesheet" href="/fj/FJ_COMP/comp.css">    	
	</head>
	<body id="comp">
		<div class="head">
			<h1>${sessionScope.name}</h1>
		</div>
		<div class="center">
			<h2>기본정보</h2>
			<table class="table table-hover basic">
				<tr>
					<th>대표</th>
					<td>${dto.ceo}</td>
					<th>기업구분</th>
					<td>${dto.comp_part}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="3">${tel_1}-${tel_2}</td>
				</tr>
				<tr>
					<th rowspan="2">주소</th>
					<td colspan="3">우편번호 : ${dto.zipcode}</td>
				</tr>
				<tr>
					<td colspan="3">${dto.address}</td>
				</tr>
				<tr>
					<th>자본금</th>
					<td>${dto.capital}</td>
					<th>업종</th>
					<td>${dto.comp_type}</td>
				</tr>
				<tr>
					<th>담당자</th>
					<td colspan="3">${dto.incharge}</td>
				</tr>
				<tr>
					<th>설립일</th>
					<td colspan="3">${dto.comp_reg_date}</td>
				</tr>
				<tr>
					<th>연매출</th>
					<td colspan="3">${dto.year_sale}</td>
				</tr>
				<tr>
					<th>사원수</th>
					<td>${dto.emp_count}</td>
					<th>좋아요</th>
					<td>${dto.like_count}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${dto.reg_date}</td>
					<th>수정일</th>
					<td>${dto.last_date}</td>
				</tr>
			</table>
		</div>
		<div class="middle">
			<div>
				<span class="span">자본금</span>
				<span class="span">${dto.capital}</span>
			</div>
			<div>
				<span class="span">설립일</span>
				<span class="span">${dto.comp_reg_date}</span>
			</div>
			<div>
				<span class="span">연매출</span>
				<span class="span">${dto.year_sale}</span>
			</div>
			<div>
				<span class="span">사원수</span>
				<span class="span">${dto.emp_count}</span>
			</div>
		</div>
		<div class="info">
			<h2>회사소개</h2>
			<div class="infotext">
				${dto.info}
			</div>
		</div>
	</body>
</html>

