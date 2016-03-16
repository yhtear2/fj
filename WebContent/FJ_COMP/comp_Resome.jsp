<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/defaultSetting.jsp"%>
    
	<div class="panel panel-default">
		<!-- 테이블 제목 부분 -->
		<table class="table table-hover">
		<tr>
			<th style="width: 30%">제목</th>
			<th style="width: 30%">자격요건</th>
			<th style="width: 30%">마감일</th>
		</tr>
		
		<c:forEach var="dto" items="${comp_resome1}" varStatus="status">
		
		<tr>
			<td>
				
				<h5 class="list-group-item-heading ">
					${dto.title}

				</h5>

			</td>
			
			<td>
				<h5 class="list-group-item-heading ">
					${dto.max_career}
				</h5>
			</td>
		</tr>
		</c:forEach>
		</table>
