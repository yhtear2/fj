<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- include setting.jsp -->
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="setting.jsp"%>
 
 
<!DOCTYPE html> 
<title>자유게시판 - 글쓰기 페이지</title>

<body id="main" onload="subjectfocus()"> 
	<div id="article-create" class="contents" role="main">
 
		<div class="content-header">  
			<h3> 글수정 </h3>  
		</div>
	</div>      
	
	<div class="panel-heading clearfix">
		<div class="avatar avatar-medium clearfix pull-left">
			<!-- 작성자 표시부분 -->	
			<div class="avatar-info">
				${dto.name} &ensp;
				<!-- 작성날짜 부분 -->
			   <fmt:formatDate value="${dto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm"/>
			</div>
		</div>
		<div class="content-identity pull-right">
			<!-- 추천수 -->
			<i class="item-icon fa fa-thumbs-up"></i> 
			${dto.recom_count} 
			&ensp;
			<!-- 댓글수 -->
            <i class="fa fa-comment"></i> 
            ${dto.re_count}
            &ensp;
            <!-- 조회수 -->
			<i class="fa fa-eye"></i>
			${dto.read_count}
			&ensp;  
		</div> 
	
	<div class="panel-body"> 
		<form action="/fj/boardmodifyPro.do" method="post" name="modifyview" onsubmit="return modifycheck()"> 
		<input type="hidden" name="board_num" value="${dto.board_num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="re_step" value="${dto.re_step}">
		<input type="hidden" name="re_count" value="${dto.re_count}"> 
		<input type="hidden" name="recom_count" value="${dto.recom_count}">
		<input type="hidden" name="bad_count" value="${dto.bad_count}">
		<input type="hidden" name="read_count" value="${dto.read_count}">
		<input type="hidden" name="scrap_count" value="${dto.scrap_count}">
		<input type="hidden" name="content" value="${dto.content}">   
		   
		 
			 <!--  <input type="hidden" name="content" value=""> --> 
			<!-- 게시판의 종류를 선택하는 부분(메인 태그) -->
			<fieldset class="form">  
				<div class="form-group  has-feedback">
						<select id="category" name="category" class="form-control"> 
							<option id="categoryselect" value="${dto.category}" >${dto.category}</option> 
							<c:if test="${dto.category == '1'}"> <option value="채용게시판" selected="selected">채용게시판</option> </c:if>  
							<c:if test="${dto.category != '1'}"> <option value="채용게시판">채용게시판</option> </c:if>
							<c:if test="${dto.category == '1'}"> <option value="건의사항" selected="selected">건의사항</option></c:if>
							<c:if test="${dto.category != '1'}"> <option value="건의사항">건의사항</option> </c:if>
							<c:if test="${dto.category == '1'}"> <option value="정보나눔" selected="selected">정보나눔</option> </c:if>
							<c:if test="${dto.category != '1'}"> <option value="정보나눔">정보나눔</option> </c:if>
							<c:if test="${dto.category == '1'}"> <option value="스터디모집" selected="selected">스터디모집</option></c:if>
							<c:if test="${dto.category != '1'}"> <option value="스터디모집">스터디모집</option> </c:if>
							<c:if test="${dto.category == '1'}"> <option value="나만의홍보" selected="selected">나만의 홍보</option> </c:if>
							<c:if test="${dto.category != '1'}"> <option value="나만의홍보">나만의 홍보</option> </c:if> 
						</select> 
				</div>   
			</fieldset>  
			<!-- 제목을 입력하는 부분 -->
			<div class="form-group has-feedback">
				<input type="text" name="subject" placeholder="제목을 입력해 주세요." class="form-control" id="subject" maxlength="100" value="${dto.subject}">
			</div>
			  
			<!-- 태그를 입력하는 부분 -->
         
			<div id="wrapper">   
				<div id="content"> 
					<ul id="myTags">
					<c:forEach var="tag" items="${fn:split(dto.hstag,',')}">
						<li> 
						${tag} 
						</li>
					</c:forEach>
					</ul>    
				</div> 
			</div>   
    
  
			<!-- 내용을 입력하는 부분 --> 
			  
			<div id="summernote" >
			</div>           
			 
			   
		   
			<!-- 글쓰기 등록 및 취소부분 --> 
			<div class="nav" role="navigation">
				<fieldset class="buttons">
				<a href="boardlist.do" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')"
					style="color:#0059b3; background-color:#f8f8f8; border:#0059b3 10px solid blue; font-size: 15px; 
					font-style:'돋움';" 
				>${btn_cancel}</a> 
				  
				  	
					<input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="${btn_modifies}"
					style="font-style:'돋움'; font-size:15px; color:white; background-color:#0059b3; border:1px solid #0059b3;"
					> 
					
					<!--  
					<input type="submit" id="save" class="btn btn-primary" onclick="save()" type="button" value="${btn_modifies}">
					-->

				</fieldset>
			</div>
		</form>
	</div>
</body>

