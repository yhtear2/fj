<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}message.css" rel="stylesheet" type="text/css">
<script src="${project}message.js"></script>

<!-- 제목 스타일 div -->
<div style="text-align: center; width: 410px;">
<h2>쪽지 보내기</h2>
</div>

<!-- 보내기 폼 시작 -->
<form method="post" action="messagePro.do" onsubmit="return sendMassge()">
	<!-- 페이지 넘 넘기기 -->
	<input type="hidden" name="pageNum" value="${pageNum}">
	
	<!-- 폼의 크기 및 위치 지정 -->
	<div style="height:700px; width: 600px; margin: 10px; padding: 10px;">
		<!-- 클래스 먹이기 --> 
		<div class="form-group" style="width: 300px;">
		    <label style="margin-right:5px;">받는사람</label>
		      <input type="text" class="form-control-message" name="email" placeholder="받는사람을 적어주세요" value="${email}">
		</div>
		<div class="form-group" style="width: 300px;">
		    <label style="margin-right:18px;">제&nbsp;&nbsp;&nbsp;&nbsp;목</label>
		    <input type="text" class="form-control-message" name="title" placeholder="제목을 입력해 주세요" autofocus>
		</div>
		<div class="form-group" style="width: 300px;">
		    <textarea name="content" rows="10" cols="100%" placeholder="내용을 입력해 주세요" style="width: 300px; border:1px solid #cccccc;"></textarea>
		</div>
		<div class="form-group">
	    	<div class="col-sm-offset-2 col-sm-10">
	      		<button class="btn btn-default" type="submit"
	      		style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#f8f8f8;
				border: 1px solid #0059b3;"
	      		>보내기</button>
	      		<button class="btn btn-default"
	      		style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#f8f8f8;
				border: 1px solid #0059b3;"
	      		>취소</button>
	    	</div>
	 	</div>
	</div>
</form>
<!-- <div style="border-style: solid; position: absolute; height:370px; width: 410px; top: 65px; left:10px"></div> -->

