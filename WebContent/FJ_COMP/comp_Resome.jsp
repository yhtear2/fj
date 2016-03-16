<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/defaultSetting.jsp"%>
    
	<div class="panel panel-default">
		<!-- 테이블 제목 부분 -->
		<table class="table table-hover">
		<tr>
			<th style="width: 260px">제목</th>
			<th style="width: 120px">자격요건</th>
			<th style="width: 150px">마감일</th>
		</tr>
		
		<c:forEach var="dto" items="${comp_resome}" varStatus="status">
		
		
		<tr>
			<td>			
				<h5 class="list-group-item-heading ">
					${dto.title}
				</h5>
			</td>
			
			<td>
				<h5 class="list-group-item-heading ">
				<c:if test="${dto.max_career == -1}">
				신입
				</c:if>
				<c:if test="${dto.max_career == -2}">
				신입
				</c:if>				
				<c:if test="${dto.max_career != -2 && dto.max_career != -1 }">
				${dto.min_career} 년 ~ ${dto.max_career} 년
				</c:if>						

				</h5>
			</td>
			<td>			
				<h5 class="list-group-item-heading ">
					${dto.end_date}
				</h5>
			</td>			
			
		</tr>
		</c:forEach>
		</table>
