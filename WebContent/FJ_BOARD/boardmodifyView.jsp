<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- include setting.jsp -->

<%@ include file="setting.jsp"%>
  
 
<!DOCTYPE html>
<title>자유게시판 - 글쓰기 페이지</title>
    
<c:if test ="${result == 0 }">
<script type="text/javascript">
<!--
	alert("테스트");  
//-->
</script>       
</c:if>
    
<c:if test="${result != 0}">
<body id="main" onload="subjectfocus()"> 
	<div id="article-create" class="contents" role="main">
 
		<div class="content-header">  
			<h3> 글수정 </h3>  
		</div>
	</div>  
	
	<div class="panel-heading clearfix">
		<div class="avatar avatar-medium clearfix pull-left">
		
			<!-- 작성자 이미지 부분  -->
			<a href="유저정보 경로창" class="avatar-photo"><img
				src="//www.gravatar.com/avatar/ea033f92e21318820a45c9bb5ca83403?d=identicon&amp;s=40"></a>
				
			<!-- 작성자 표시부분 -->	
			<div class="avatar-info">
				<a class="nickname" href="유저정보 경로창">작성자</a>
				
				<!-- 활동량 부분(구현x) -->
				<!--  
				<div class="activity">
					<span class="fa fa-flash"></span> 10
				</div>
				-->
				
				<!-- 작성날짜 부분 -->
			   <fmt:formatDate value="${dto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm"/>
			</div>
		</div>
		<div class="content-identity pull-right">
						
						<!-- 글 번호 -->
                        <div class="article-id"> 
                        ${number} 
                    	<c:set var="number" value="${number-1}"/>
                        </div>
                        
                        <!-- 조회수 -->
                        <div><i class="fa fa-eye"></i>
                        <table>
                       <tr>
                         <td>
                           ${dto.read_count}  
                         </td>
                       </tr>
                    </table> 
                         </div>
                    </div>
                </div> 
	
	<div class="panel-body"> 
		<form action="boardmodifyPro.do" method="post" name="modifyview" onsubmit="return modifycheck()"> 
		<input type="hidden" name="board_num" value="${board_num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="re_step" value="${re_step}">
		<input type="hidden" name="re_count" value="${re_count}"> 
		<input type="hidden" name="recom_count" value="${recom_count}">
		<input type="hidden" name="bad_count" value="${bad_count}">
		<input type="hidden" name="read_count" value="${read_count}">
		<input type="hidden" name="scrap_count" value="${scrap_count}">
		<input type="hidden" name="content" value="${dto.content}">   
		<input type="hidden" name="hstag" value="${dto.hstag}">   
		 
			 <!--  <input type="hidden" name="content" value=""> --> 
			<!-- 게시판의 종류를 선택하는 부분(메인 태그) -->
			<fieldset class="form">
				<div class="form-group  has-feedback">
						<select id="category" name="category" class="form-control"> 
							<option id="categoryselect" value="${dto.category}" >${dto.category}</option> 
							<c:if test="${dto.category == '1'}"> <option value="1" selected="selected">채용게시판</option> </c:if>  
							<c:if test="${dto.category != '1'}"> <option value="1">채용게시판</option> </c:if>
							<c:if test="${dto.category == '1'}"> <option value="2" selected="selected">건의사항</option></c:if>
							<c:if test="${dto.category != '1'}"> <option value="2">건의사항</option> </c:if>
							<c:if test="${dto.category == '1'}"> <option value="3" selected="selected">정보나눔</option> </c:if>
							<c:if test="${dto.category != '1'}"> <option value="3">정보나눔</option> </c:if>
							<c:if test="${dto.category == '1'}"> <option value="2" selected="selected">스터디모집</option></c:if>
							<c:if test="${dto.category != '1'}"> <option value="2">스터디모집</option> </c:if>
							<c:if test="${dto.category == '1'}"> <option value="3" selected="selected">나만의 홍보</option> </c:if>
							<c:if test="${dto.category != '1'}"> <option value="3">나만의 홍보</option> </c:if> 
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
						<li> 
						${dto.hstag} 
						</li>
					</ul>    
				</div> 
			</div>   
    

			<!-- 내용을 입력하는 부분 --> 
			  
			<div id="summernote" >
			</div>           
			 
			  
		  
			<!-- 글쓰기 등록 및 취소부분 --> 
			<div class="nav" role="navigation">
				<fieldset class="buttons">
				<a href="boardcontent.do" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">${btn_cancel}</a> 
				  
					<input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="${btn_write}"> 
					
					<!--  
					<input type="submit" id="save" class="btn btn-primary" onclick="save()" type="button" value="${btn_write}">
					-->

				</fieldset>
			</div>
		</form>
	</div>
</body>
</c:if>
