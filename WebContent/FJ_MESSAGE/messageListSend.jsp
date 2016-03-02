<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}message.css" rel="stylesheet" type="text/css">
<script src="${project}message.js"></script>

<!-- 전체 크기 및 백그라운드 색갈 주기 -->
<div style="width: 800px; background-color: white; margin: 20px;"
	class="table-responsive">
	<button class="btn btn-default" onclick="window.location='messageForm.do'">새쪽지</button>
	<button class="btn btn-default" onclick="window.location='messageList.do'">받은쪽지함</button>
	<button class="btn btn-default" onclick="window.location='messageListSend.do'">보낸쪽지함</button>
	<!-- 큰 제목 -->
	<h2 style="text-align: center;">보낸 쪽지함</h2>

	<!-- 테이블 제목 부분 -->
	<table class="table table-hover">
		<tr>
			<th style="width: 20%">받는 사람</th>
			<th style="width: 60%">내용</th>
			<th style="width: 20%">보낸날짜</th>
		</tr>

		<!-- 받은 쪽지가 없는경우 출력할 내용 -->
		<c:if test="${count == 0}">
			<td style="text-align: center;" colspan="6">보낸 쪽지가 없습니다.</td>
		</c:if>

		<!-- 받은 쪽지가 있을경우 출력할 내용 -->
		<c:if test="${count != 0}">
			<!-- dto리스트로 받아옴 -->
			<c:forEach var="dto" items="${list}">
				<!-- 상대방이 읽었으면 테이블 색깔 변경 -->
				<c:if test="${dto.read_yn == 1}">
					<tr class="success">
				</c:if>
				
				<!--  읽지 않았으면 원래 색깔로 -->
				<c:if test="${dto.read_yn == 0}">
					<tr>
				</c:if>
				
				<!-- 받는사람, 내용, 보낸날자 -->
					<td>${dto.email}</td>
					<td><a href="messgaeSendContent.do?message_num=${dto.message_num}&pageNum=${pageNum}">
							${dto.title} </a></td>
					<td><fmt:formatDate value="${dto.reg_date}" type="both"
							pattern="yyyy-MM-dd HH:mm" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>