<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp"%>
<%@ include file="/defaultSetting.jsp"%>
<script src="script.js"></script>

<!-- map.put( "dto", dto );   				// 글의 정보
		map.put("result", result);					// 댓글의 정보
		map.put("joindto", joindto);				// 작성자 정보 -->

<!DOCTYPE html>

<title>人 코딩 - 자유게시판</title>

<div id="article" class="content" role="main" style="margin:50px">
	<div class="nav" role="navigation">
		<a href="boardwriteForm.do"
			class="create btn btn-success btn-wide pull-right" 
			style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3;
			border: 1px solid #0059b3;
			"><i
			class="fa fa-pencil"  
			
			></i> 글쓰기 </a>

		<h4>자유게시판</h4>
	</div>

	<div class="panel panel-default clearfix">
		<div class="panel-heading clearfix">
			<div class="avatar avatar-medium clearfix pull-left">
				${joindto.name}
				<div class="avatar-info">
					<!-- div 있어야 글 뒤바탕 흰색 -->
					<!-- 작성날짜 부분 -->
					<fmt:formatDate value="${dto.reg_date}" type="both"
						pattern="yyyy-MM-dd HH:mm" />
				</div>
			</div>
			<div class="content-identity pull-right">
				<!-- 댓글수 확인부분 -->
				<c:if test="${reresult == 1}">
					<div class="content-identity-count">
						<i class="fa fa-comment"></i>
						<table>
							<tr>
								<td>${dto.re_count}</td>
							</tr>
						</table>
					</div>
				</c:if>
				<!-- 조회수 확인부분 -->
				<c:if test="${addresult == 1}">
					<div class="content-identity-count">
						<i class="fa fa-eye"></i>
						<table>
							<tr>
								<td>${dto.read_count}</td>
							</tr>
						</table>
					</div>
				</c:if>
			</div>
		</div>
		<div class="content-container clearfix">
			<div class="panel-body content-body pull-left">
				<div class="content-tags">
					<!-- 글번호 부분 -->
					<span class="list-group-item-text article-id"> ${number} <c:set
							var="number" value="${number-1}" />
					</span>

					<!-- 카테고리 영역 -->
					<a href="카테고리 클릭시 해당 카테고리 페이지로 이동하는 경로"
						class="list-group-item-text item-tag label label-info" 
						style="background-color:#74b9ff";> <i
						class="fa fa-comments"></i> ${dto.category}
					</a> &nbsp;
					<c:forEach var="tag" items="${tags}">

						<a href="해쉬태그 경로"
							class="list-group-item-text item-tag label label-gray">
							${tag} </a>
	                             &nbsp; 
   							</c:forEach>
				</div>

				<!-- 해당 글제목 보여지는 부분 (h2 태그였는데 우선 보류) -->
				<a class="panel-title"> ${dto.subject} </a>
				<hr>
				<!-- 해당 글내용 보여지는 부분 -->
				<article class="content-text">${dto.content}</article>
			</div>

			<!-- 페이스북 공유버튼 -->
			<div class="content-function-cog share-btn-wrapper">
				<div class="dropdown">
					<a
						href="http://www.facebook.com/sharer/sharer.php?app_id=1451111438499030&amp;sdk=joey&amp;u=http%3A%2F%2Fokky.kr%2Farticle%2F314044&amp;display=popup&amp;ref=plugin"
						class="btn-facebook-share"><i
						class="fa fa-facebook-square fa-fw" data-toggle="tooltip"
						data-placement="left" title="" data-original-title="페이스북 공유"></i></a>
				</div>

				<!-- 게시물 수정 및 삭제버튼기능 -->
				<c:if test="${dto.email == sessionScope.memId}">
					<div class="dropdown">
						<form action="boarddeletePro.do" method="post"
							name="article-delete-form" id="article-delete-form">
							<input type="hidden" name="board_num" value="${board_num}"
								id="board_num"> <input type="hidden" name="pageNum"
								value="${pageNum}" id="pageNum">
							<div class="dropdown">
								<a href="javascript://" data-toggle="dropdown"
									aria-expanded="false"><i class="fa fa-cog"
									data-toggle="tooltip" data-placement="left" title=""
									data-original-title="게시물 설정"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a
										href="boardmodifyView.do?board_num=${dto.board_num}&pageNum=${pageNum}"
										class="edit"><i class="fa fa-edit fa-fw"></i>${btn_modify}</a></li>

									<li><a
										href="boarddeletePro.do?board_num=${dto.board_num}&pageNum=${pageNum}"
										onclick="deletecontent();" type="button"><i
											class="fa fa-trash-o fa-fw"></i>${btn_delete}</a></li>
								</ul>
							</div>
						</form>
					</div>
				</c:if>
				
				<c:if test="${3 == sessionScope.member_flag}">
					<div class="dropdown">
						<form action="boarddeletePro.do" method="post"
							name="article-delete-form" id="article-delete-form">
							<input type="hidden" name="board_num" value="${board_num}"
								id="board_num"> <input type="hidden" name="pageNum"
								value="${pageNum}" id="pageNum">
							<div class="dropdown">
								<a href="javascript://" data-toggle="dropdown"
									aria-expanded="false"><i class="fa fa-cog"
									data-toggle="tooltip" data-placement="left" title=""
									data-original-title="게시물 설정"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li><a
										href="boardmodifyView.do?board_num=${dto.board_num}&pageNum=${pageNum}"
										class="edit"><i class="fa fa-edit fa-fw"></i>${btn_modify}</a></li>

									<li><a
										href="boarddeletePro.do?board_num=${dto.board_num}&pageNum=${pageNum}"
										onclick="deletecontent();" type="button"><i
											class="fa fa-trash-o fa-fw"></i>${btn_delete}</a></li>
								</ul>
							</div>
						</form>
					</div>
				</c:if>

			</div>
		</div>
	</div>

	<div class="panel panel-default clearfix">
		<!-- List group -->
		<ul class="list-group">

			<!-- 댓글 수  -->
			<li id="note-title" class="list-group-item note-title">
				<h3 class="panel-title">
					댓글 <span id="note-count"> ${dto.re_count} </span>
				</h3>
			</li>


			<!--▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 여기서 부터댓글  ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ -->
			<!-- 댓글을 리스트 형식으로 출력  -->
			<c:if test="${count != 0}">		
				<c:forEach var="dto" items="${result}">
					<li class="list-group-item note-item clearfix" id="note-1034847">
						<form action="replyDeletePro.do" method="post" class="note-update-form">
						<div class="content-container clearfix">
							<input type="hidden" name="board_num" value="${dto.board_num}">
							<input type="hidden" name="comment_board_num" value="${dto.comment_board_num}">
							<input type="hidden" name="pageNum" value="${pageNum}">
							<input type="hidden" name="number" value="${number}">
							<div class="content-body panel-body pull-left" >
								<div class="avatar avatar-medium clearfix ">
									${dto.name}	<br>
									<!-- 댓글 남긴날짜 -->
									<fmt:formatDate value="${dto.reg_date}" type="both"	pattern="yyyy-MM-dd HH:mm" />
								</div>

								<!-- 댓글남겨지는 부분 -->
								<fieldset class="form">
									<article class="list-group-item-text note-text"> ${dto.recontent} </article>
								</fieldset>
							</div>
							<c:if test="${dto.email == sessionScope.memId}">
								<div>
									<input type="submit" class="btn btn-default btn-wide" style="width: 70px;height: 150px;
										border: 0px;" value="삭제">
								</div>
							</c:if>
						</div>
						</form>
					</li>
				</c:forEach>
			</c:if>
			
			
			<!-- ▼▼▼▼▼ 댓글 작성하는 부분 ▼▼▼▼▼ -->
			<li class="list-group-item note-form clearfix">
				<c:if test="${sessionScope.memId == null}">
					<div style="text-align: center;">
						<a href="joinMain.do">로그인</a>을 하시면 댓글을 등록할 수 있습니다.
					</div>
				</c:if>
				
				<c:if test="${sessionScope.memId != null}">
				<form action="/fj/boardreplyPro.do" method="post" class="note-create-form" onsubmit="return boardreplyFormCkeck()">
					<input type="hidden" name="board_num" value="${dto.board_num}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="number" value="${number}">
					<div class="content-body panel-body pull-left">
						<div style="margin-left: 5px;">
							${sessionScope.name} 
						</div>

						<!-- 댓글 적는 곳 (에디터 적용은 아직 미구현) -->
						<fieldset class="form">
							<textarea name="recontent" class="form-control" rows="3"></textarea>
						</fieldset>
					</div>

					<!-- 댓글 등록 및 취소구간 -->
					<div class="content-function-cog note-submit-buttons clearfix">
						<p>	<input type="reset" class="btn btn-default btn-wide" value="${btn_cancel}"
						     style="font-style:'돋움'; font-size:13px; color:#0059b3; background-color:#ffffff">	</p>
						<input type="submit" name="create"	class="create btn btn-success btn-wide wide" value="${btn_reply}"
						     style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;">
					</div>
				</form>
				</c:if>
			</li>
		</ul>
	</div>
</div>