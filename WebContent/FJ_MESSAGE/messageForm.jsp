<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="setting.jsp"%>
<link href="${project}message.css" rel="stylesheet" type="text/css">
<script src="${project}message.js"></script>

<div style="text-align: center; width: 410px;">
<h2>쪽지 보내기djsfklajsdaklfjsdlk</h2>
</div>

<form method="post" action="messagePro.do" onsubmit="return sendMassge()">
	<input type="hidden" name="recipient" value="">
	<div style="height:700px; width: 600px; margin: 10px; padding: 10px;"> 
		<div class="form-group">
		    <label class="col-sm-2 control-label">받는사람</label>
		    <div class="col-sm-10">
		      <p class="form-control-static">email@example.com</p>
		    </div>
		</div>
		<div class="form-group">
		    <label for="inputPassword" class="col-sm-2 control-label">제목</label>
		    <div class="col-sm-10" style="width: 300px; margin: 5px 0px 5px 0px;">
		      <input type="text" class="form-control" name="title" placeholder="제목을 입력해 주세요" autofocus>
		    </div>
		    <textarea name="content" class="form-control" rows="10" placeholder="내용을 입력해 주세요" style="width: 390px;"></textarea>
		</div>
		<div class="form-group">
	    	<div class="col-sm-offset-2 col-sm-10">
	      		<button class="btn btn-default" type="submit">보내기</button>
	      		<button class="btn btn-default">취소</button>
	    	</div>
	 	</div>
	</div>
</form>
<!-- <div style="border-style: solid; position: absolute; height:370px; width: 410px; top: 65px; left:10px"></div> -->

