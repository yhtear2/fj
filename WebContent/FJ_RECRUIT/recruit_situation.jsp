<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
    
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
