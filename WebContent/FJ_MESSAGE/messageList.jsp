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
	<h2 style="text-align: center;">받은 쪽지함</h2>

	<!-- 테이블 제목 부분 -->
	<table class="table table-hover">
		<tr>
			<th style="width: 20%">보낸사람</th>
			<th style="width: 60%">내용</th>
			<th style="width: 20%">받은날짜</th>
		</tr>
		<!-- 받은 쪽지가 없는경우 출력할 내용 -->
		<c:if test="${count == 0}">
			<td style="text-align: center;" colspan="6">받은 쪽지가 없습니다.</td>
		</c:if>

		<!-- 받은 쪽지가 있을경우 출력할 내용 -->
		<c:if test="${count != 0}">
			<!-- dto리스트로 받아옴 -->
			<c:forEach var="dto" items="${list}">
				<!-- 읽은 테이블 색깔 다르게 표시 -->
				<c:if test="${dto.read_yn == 1}">
					<tr class="active">
				</c:if>
				
				<c:if test="${dto.read_yn == 0}">
					<!-- 채용공고 일 경우 색깔 다르게 표시 -->
					<c:if test="${dto.tag == 1}">
						<tr class="warning">
					</c:if>
					<!-- 공지사항 쪽지일때 색깔 -->
					<c:if test="${dto.tag == 2}">
						<tr class="danger">
					</c:if>
					<!-- 일반 쪽지 일때 색깔-->
					<c:if test="${dto.tag == 3}">
						<tr>
					</c:if>
				</c:if>
				
				<!-- 보낸사람, 내용, 보낸날자 -->
					<td><a href="messageForm.do?pageNum=${pageNum}&sender=${dto.sender}">${dto.sender}</a></td>
					<td><a href="messgaeContent.do?message_num=${dto.message_num}&pageNum=${pageNum}">
							${dto.title} </a></td>
					<td><fmt:formatDate value="${dto.reg_date}" type="both"
							pattern="yyyy-MM-dd HH:mm" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<!-- 한 페이지 10개의 쪽지만 보여지도록 함 -->
<br>
    <div class="text-center">
		<ul class="pagination pagination-sm">
			<li>
				<c:if test="${count > 0}">
				<c:if test="${startPage > pageBlock}">
				</c:if>
				</c:if> 
				<a href="messageList.do" class="prev disabled">◀◀</a>
				<a href="messageList.do?pageNum=${startPage-pageBlock}" class="prev disabled">◀</a>
			</li>	 
			<li>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}"> 
				<a>${i}</a>
				</c:if>
				<c:if test="${i != currentPage}">
				<a href="messageList.do?pageNum=${i}">${i}</a>
				</c:if>   
				</c:forEach> 
				<c:if test="${endPage < pageCount}">
					<a href="messageList.do?pageNum=${startPage+pageBlock}" class="prev disabled">▶</a>
					<a href="messageList.do?pageNum=${pageCount}" class="prev disabled">▶▶</a>
				</c:if>
			</li>   
		</ul>  
	</div>  
</div>