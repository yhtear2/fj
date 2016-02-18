<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}message.css" rel="stylesheet" type="text/css">
<script src="${project}message.js"></script>

<!-- 제목 스타일 div -->

<h2 style="text-align: center;">보낸 쪽지</h2>



<!-- 폼의 크기 및 위치 지정 -->
<div style="height:700px; width: 600px; margin: 10px; padding: 10px; background-color: white;" class="form-group">
	<input type="hidden" name="sender" value="${sender}">
	<label class="col-sm-2 control-label">받는사람</label>
	<div class="col-sm-10">
	  <p class="form-control-static">${dto.email}</p>
	</div>
	
	<label for="inputPassword" class="col-sm-2 control-label">제목</label>
	<div class="col-sm-10" style="width: 300px; margin: 5px 0px 5px 0px;">
		${dto.title}
	</div>
	
	<div class="col-sm-10" style="border: solid 1px black; height: 60%">
		${dto.content}
	</div>
	
	<div class="col-sm-offset-2 col-sm-10">
	 	<button class="btn btn-default" onclick="messageSendDelete(${dto.read_yn}, ${dto.message_num})">삭제</button>
	 	<button class="btn btn-default" onclick="window.location='messageList.do?pageNum=${pageNum}'">뒤로</button>
 	</div>
</div>
