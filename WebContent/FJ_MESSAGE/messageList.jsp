<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}message.css" rel="stylesheet" type="text/css">
<script src="${project}message.js"></script>

<div style="width: 600px">
<h2>쪽지함</h2>
<table class="table">
	<tr>
		<th style="width: 20%">보낸사람</th>
		<th style="width: 60%">내용</th>
		<th style="width: 20%">날짜</th>
	</tr>
<c:if test="${count == 0}">	

</c:if>
<c:if test="${count != 0}">	
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${recipient}</td>
			<td>
				<a href="messgaeContent.do?num=${dto.num}">
					${content}
				</a>
			</td>
			<td>${reg_date}</td>
		</tr>
	</c:forEach>
</c:if>

</table>
</div>