<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}message.css" rel="stylesheet" type="text/css">
<script src="${project}message.js"></script>

<!-- 제목 스타일 div -->

<h2 style="text-align: center;">받은 쪽지</h2>



<!-- 폼의 크기 및 위치 지정 -->
<div style="height:700px; width: 600px; margin: 10px; margin-left:50px; padding: 10px; background-color: white;" class="form-group">
	
	<label class="col-sm-2 control-label">보낸사람</label>
	<div class="col-sm-10">
	  <p class="form-control-static">${dto.sender}</p>
	</div>
	
	<label for="inputPassword" class="col-sm-2 control-label">제목</label>
	<div class="col-sm-10" style="width: 300px; margin: 5px 0px 5px 0px;">
		${dto.title}
	</div>
	
	<div class="col-sm-10" style="border: solid 1px #cccccc; height: 60%">
		${dto.content}
	</div>
	
	<div class="col-sm-offset-2 col-sm-10">
	 	<button class="btn btn-default" onclick="window.location='messageForm.do?pageNum=${pageNum}&sender=${dto.sender}'"
	 	style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#f8f8f8;
		border: 1px solid #0059b3;"
	 	>답장</button>
	 	<button class="btn btn-default" onclick="window.location='messageDelete.do?message_num=${dto.message_num}'"
	 	style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#f8f8f8;
		border: 1px solid #0059b3;" 
	 	>삭제</button>
	 	<button class="btn btn-default" onclick="window.location='messageList.do?pageNum=${pageNum}'"
	 	style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#f8f8f8;
		border: 1px solid #0059b3;" 
	 	>뒤로</button>
 	</div>
</div>
