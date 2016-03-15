<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
    
	<div class="panel panel-default">
		<!-- 테이블 제목 부분 -->
		<table class="table table-hover">
		<tr>
			<th style="width: 10%"></th>
			<th style="width: 60%">이력서제목</th>
			<th style="width: 30%">이메일</th>

		</tr>
		
		<c:forEach var="dto" items="${recruit_situation}" varStatus="status">
		
		<tr>
			<td>
			</td>
		
			<td>
				
				<h5 class="list-group-item-heading ">
				<a href="resomeContent.do?user_history_id=${dto.user_history_id}"> 
					${dto.resome_title}
				</a>
				</h5>

			</td>
			
			<td>
				<h5 class="list-group-item-heading ">
					${dto.email}
				</h5>
			</td>
		</tr>
		</c:forEach>
		</table>
