<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- include setting.jsp -->

<%@ include file="setting.jsp"%>
         
<!DOCTYPE html>    
<title>자유게시판 - 글쓰기 페이지</title>
 
   
<body id="main" onload="subjectfocus()"> 
	<div id="article-create" class="contents" role="main">
 
		<div class="content-header">  
			<h3>글쓰기</h3>  
		</div> 
	</div> 
	<div class="panel-body">
		<form action="/fj/boardwritePro.do" method="post" name="writeform" onsubmit="return writecheck_check()"> 
		
		<input type="hidden" name="re_step" value="2">
		<input type="hidden" name="re_count" value="0"> 
		<input type="hidden" name="recom_count" value="0">
		<input type="hidden" name="bad_count" value="0">
		<input type="hidden" name="read_count" value="0">
		<input type="hidden" name="scrap_count" value="0"> 
		<input type="hidden" name="content" value="${content}">        
		 
			 <!--  <input type="hidden" name="content" value=""> --> 
			<!-- 게시판의 종류를 선택하는 부분(메인 태그) -->
			<fieldset class="form">
				<div class="form-group  has-feedback">
						<select id="category" name="category" class="form-control" > 
							<option value="${category}" >게시판을 선택해 주세요.</option> 
							<option value="채용게시판">채용게시판</option> 
							<option value="건의사항">건의사항</option>
							<option value="정보나눔">정보나눔</option> 
							<option value="스터디모집">스터디모집</option>
							<option value="나만의 홍보">나만의 홍보</option>
						</select>
				</div>  
			</fieldset>  
			<!-- 제목을 입력하는 부분 -->
			<div class="form-group has-feedback">
				<input type="text" name="subject" placeholder="제목을 입력해 주세요." class="form-control" id="subject" maxlength="100">
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
				<a href="boardlist.do" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">취소</a> 
				  
					<input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="${btn_write}" > 
					
					<!--  
					<input type="submit" id="save" class="btn btn-primary" onclick="save()" type="button" value="${btn_write}">
					-->

				</fieldset>
			</div>
		</form>
	</div>
</body>
