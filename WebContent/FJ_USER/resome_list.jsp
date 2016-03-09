<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<!-- 전체 사이즈 조정 -->
	<!-- 상위 메뉴에 보여질 화면 -->
	<div class="nav" role="navigation"> 
		<div>
			<h2>이력서 리스트</h2>
		</div>
		<div style="">
			<!-- 글쓰기 버튼 -->
			<a href="/fj/resome.do" class="create btn btn-success_hs btn-wide">
				<i class="fa fa-pencil"></i> 글쓰기 </a>
		</div>
	</div>
	<!-- 게시글이 보여지는 화면 -->
	<div class="panel panel-default">
		<!-- 테이블 제목 부분 -->
		<table class="table table-hover">
			<tr>
			<th style="width: 35%">이력서 제목</th>
			<th style="width: 15%">작성자</th>
			<th style="width: 10%">작성일</th>
			
		</tr>
			<!-- 게시글이 없을 때  -->
 			<c:if test="${count == 0}">
			<td style="text-align: center;" colspan="5">게시글이 없습니다.</td>
			</c:if>
		
			<!-- 게시글이 있을 때 -->
			<c:if test="${count != 0 }">
			<c:forEach var="dto" items="${list}">
			<tr>
				<!-- 회사명 부분 -->
<%-- 				<td>
					<h5 class="list-group-item-heading ">
						${name}
					</h5>
				</td> --%>
				<!-- 제목 부분 -->
				<td>
					<h5 class="list-group-item-heading ">
						<a href="resomeContent.do?user_history_id=${dto.user_history_id}&pageNum=${pageNum}">
							${dto.resome_title}
						</a>
					</h5>
				</td>
				<td>
				${dto.email}
				</td>

				<!-- 마감일 -->
				<td>
					${dto.last_date}
				</td>
			</tr>
			</c:forEach>
			</c:if>				
		</table>