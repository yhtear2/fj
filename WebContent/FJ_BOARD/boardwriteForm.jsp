<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>  
 
<!DOCTYPE html>
<title>자유게시판 - 글쓰기 페이지</title>

 
<!-- 태그 에디터 불러오기 -->    
<!-- INSTRUCTIONS -->
<link href="css/jquery.tagit.css" rel="stylesheet">
<link href="css/tagit.ui-zendesk.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
       
<!-- The real deal -->
<script src="js/tag-it.js" type="text/javascript" charset="utf-8"></script>
  
    
<!-- 글쓰기 에디터 불러오기 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->   
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet"> 

<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

 
<script src="script.js"></script>  
 

<body id="main" onload="subjectfocus()"> 
	<div id="article-create" class="contents" role="main">
 
		<div class="content-header">
			<h3>글쓰기</h3>
		</div>
	</div> 
	<div class="panel-body">
		<form action="boardwritePro.do" method="post" name="writeform" onsubmit="return writecheck()"> 
		<input type="hidden" name="board_num" value="${board_num}">
		<input type="hidden" name="re_step" value="${re_step}">
		<input type="hidden" name="re_count" value="${re_count}"> 
		<input type="hidden" name="recom_count" value="${recom_count}">
		<input type="hidden" name="bad_count" value="${bad_count}">
		<input type="hidden" name="read_count" value="${read_count}">
		<input type="hidden" name="scrap_count" value="${scrap_count}">
		<input type="hidden" name="content" value="">
		<input type="hidden" name="hstag" value=""> 
		
			 <!--  <input type="hidden" name="content" value=""> --> 
			<!-- 게시판의 종류를 선택하는 부분(메인 태그) -->
			<fieldset class="form">
				<div class="form-group  has-feedback">
						<select id="category" name="category" class="form-control" > 
							<option value="${category}" >게시판을 선택해 주세요.</option> 
							<option value="1">카테고리 테스트1</option> 
							<option value="2">카테고리 테스트2</option>
							<option value="3">카테고리 테스트3</option> 
							<option value="4">카테고리 테스트4</option>
							<option value="5">카테고리 테스트5</option>
						</select>
				</div> 
			</fieldset>  
			<!-- 제목을 입력하는 부분 -->
			<div class="form-group has-feedback">
				<input type="text" name="subject" placeholder="제목을 입력해 주세요." class="form-control" id="subject" maxlength="100" value="${subject}" >
			</div>
			  
			<!-- 태그를 입력하는 부분 -->
      
			<div id="wrapper">   
				<div id="content"> 
					<ul id="myTags">
					</ul>    
				</div>
			</div>   
    

			<!-- 내용을 입력하는 부분 --> 
			  
			<div id="summernote" >
			</div>           
			 
			
		  
			<!-- 글쓰기 등록 및 취소부분 --> 
			<div class="nav" role="navigation">
				<fieldset class="buttons">
				<a href="list.do" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">취소</a> 
				  
					<input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="${btn_write}" > 
					
					<!--  
					<input type="submit" id="save" class="btn btn-primary" onclick="save()" type="button" value="${btn_write}">
					-->

				</fieldset>
			</div>
		</form>
	</div>
</body>
