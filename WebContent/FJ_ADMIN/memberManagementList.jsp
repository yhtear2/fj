<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>

<!-- 
	개인회원 리스트 페이지
	MemberManagementListHandler에서
		map.put( "pageBlock", pageBlock );
		map.put( "count", count );
		map.put( "number", number );
		map.put( "pageNum", pageNum );
		map.put( "currentPage", currentPage );
		map.put( "startPage", startPage );
		map.put( "endPage", endPage );
		map.put( "pageCount", pageCount );
		map.put( "pageNum", pageNum );
		 
		map.put("list", list);			// 회원 정보를 가지고 있는 리스트
		map.put( "count", count );		// 회원의 수
	넘어옴
	10명이 넘으면 다음 페이지가 생성되게 일단 만들었음
	/ 회원 정보 보기/ 회원정보 수정 / 회원 정보 삭제/
	이런 기능을 넣을 수 있게 해야함

	// 기업회원 따로 만들까? 말까???? //
 -->

<!-- 관리자가 아니면 뒤로 빽! -->
<c:if test="${member_flag != 3}">
	<script type="text/javascript">
	<!--
		alert("권한이 없는 페이지 입니다");
		history.back();
	//-->
	</script>
</c:if>

<!-- 관리자면 리스트를 보여줄께요~ -->
<c:if test="${member_flag == 3}">
<!-- 전체적인 사이즈 잡기 -->
<div>
	<h2 style="text-align: center;">개인회원 리스트</h2>
	<table class="table table-hover">
		<tr>
			<th style="width: 25%">이메일</th>
			<th style="width: 25%">닉네임</th>
			<th style="width: 25%">회원가입일</th>
			<th></th>
		</tr>
		<c:if test="${count==0}">
		<tr>
			<td style="text-align: center;" colspan="3">회원이 존재하지 않습니다.</td>
		</tr>
		</c:if>
		<c:if test="${count!=0}">
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.email}</td>
				<td>${dto.name}</td>
				<td>${dto.reg_date}</td>
				<td>
					<input type="button" value="수정" onclick="window.location='memberManagementModify.do?email=${dto.email}'"
					style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#f8f8f8;
					border: 1px solid #0059b3;"
					>
					<input type="button" value="삭제" onclick="window.location='memberManagementDeletePro.do?email=${dto.email}'"
					style="font-style:'돋움'; font-size:13px; color:#ff5d5d; background-color:#f8f8f8;
					border: 1px solid #ff5d5d;" 
					>
					<input type="button" value="수정" 
					style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#f8f8f8;
					border: 1px solid #0059b3;"
					>
					<input type="button" value="삭제"
					style="font-style:'돋움'; font-size:13px; color:#ff5d5d; background-color:#f8f8f8;
					border: 1px solid #ff5d5d;" 
					>
				</td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
</c:if>