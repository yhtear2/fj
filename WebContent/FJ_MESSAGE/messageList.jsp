<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}message.css" rel="stylesheet" type="text/css">
<script src="${project}message.js"></script>

<h2>쪽지함</h2>
<table border="1" style="width: 600px">
	<tr>
		<th style="width: 20%">보낸사람</th>
		<th style="width: 60%">내용</th>
		<th style="width: 20%">날짜</th>
	</tr>
<c:if test="${count == 0}">	

</c:if>
<c:if test="${count != 0}">	

</c:if>

</table>