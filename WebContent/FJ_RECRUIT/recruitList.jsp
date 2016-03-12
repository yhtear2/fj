<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<!-- 전체 사이즈 조정 -->
<div class="recruit_mainsize" role="main">
	<!-- 상위 메뉴에 보여질 화면 -->
	<div class="nav" role="navigation"> 
		<div> 
			<h2>채용게시판</h2>
		</div>
		<div>
			<!-- 검색어 입력펌 -->
			<input type="search" name="query" class="form-control_hs" placeholder="검색어" style="width:200px;"> 
			<!-- 검색 버튼 -->
			<button type="submit" class="btn_hs"><i class="fa fa-search" style="width:35px; height : 18px;"></i></button>
			<!-- 상세검색 버튼 -->
			<a href="/fj/recruitWriteForm.do" class="create btn btn-success_hs btn-wide" 
			style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;"
			>
				<i class="fa fa-plus-square-o"></i> 상세검색 </a>
			<!-- 글쓰기 버튼 / member_flag가 2일 경우에만 글쓰기가 가능하도록 -->
			<c:if test="${sessionScope.member_flag == 2}">
				<a href="/fj/recruitWriteForm.do" class="create btn btn-success_hs btn-wide">
					<i class="fa fa-pencil"></i> 글쓰기 </a>
			</c:if>
		</div>
	</div>
	<!-- 게시글이 보여지는 화면 -->
	<div class="panel panel-default">
		<!-- 테이블 제목 부분 -->
		<table class="table table-hover">
			<tr>
			<th style="width: 15%">회사명</th>
			<th style="width: 50%">제목</th>
			<th style="width: 15%">자격요건</th>
			<th style="width: 10%">마감일</th>
			<th style="width: 10%">조회수</th>
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
				<td>
					<h5 class="list-group-item-heading ">
						${dto.name}
					</h5>
				</td>
				<!-- 제목 부분 -->
				<td>
					<h5 class="list-group-item-heading ">
						<a href="recruitcontent.do?recruit_id=${dto.recruit_id}&pageNum=${pageNum}">
							${dto.title}
						</a>
					</h5>
				</td>
				<!-- 자격요건 -->
				<td>
					<c:if test="${dto.max_career == -1}">신입</c:if>
					<c:if test="${dto.max_career == -2}">경력무관</c:if>
					<c:if test="${dto.max_career != -1}">경력 ${dto.min_career}년↑</c:if>
				</td>
				<!-- 마감일 -->
				<td id="date1">
					<input type="hidden" name="end_date" value="${dto.end_date}">
						<script type="text/javascript">
							<!--
								dateCalculation();
							//-->
					</script>
				</td>
				<!-- 조회수 -->
				<td>
					${dto.readcount}
				</td>
			</tr>
			</c:forEach>
			</c:if>				
		</table>

<c:if test="${count > 10}"> 	
	<!-- 한 페이지 10개의 쪽지만 보여지도록 함 -->
<br>
    <div class="text-center">
		<ul class="pagination pagination-sm">
			<li>
				<c:if test="${count > 0}">
				<c:if test="${startPage > pageBlock}">
				</c:if>
				</c:if> 
				<a href="messageList.do" class="prev disabled">◀◀</a>
				<a href="messageList.do?pageNum=${startPage-pageBlock}" class="prev disabled">◀</a>
			</li>	 
			<li>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}"> 
				<a>${i}</a>
				</c:if>
				<c:if test="${i != currentPage}">
				<a href="messageList.do?pageNum=${i}">${i}</a>
				</c:if>   
				</c:forEach> 
				<c:if test="${endPage < pageCount}">
					<a href="messageList.do?pageNum=${startPage+pageBlock}" class="prev disabled">▶</a>
					<a href="messageList.do?pageNum=${pageCount}" class="prev disabled">▶▶</a>
				</c:if>
			</li>   
		</ul>  
	</div>
	</c:if>
</div>
















