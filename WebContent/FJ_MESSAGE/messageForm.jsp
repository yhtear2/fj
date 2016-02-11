<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}message.css" rel="stylesheet" type="text/css">
<script src="${project}message.js"></script>

<h2>쪽지 보내기</h2>

<form>
	<table border="1">
		<tr>
			<th>받는이</th>
			<th>supar@fjkd.com</th>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="subject">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="contents" rows="17" cols="100%"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="전송" onclick="messagePro.do">
				<input type="button" value="취소">
			</th>
		</tr>
	</table>
</form>