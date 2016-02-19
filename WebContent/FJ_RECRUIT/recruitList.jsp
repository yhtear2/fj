<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<body>
	<table class="table table-hover">
		<thead>
			<tr>
				<th> recruit_id </th>
				<th> email </th>
				<th> title </th>
				<th> content </th>
			</tr>
		</thead>
		
		<tbody>
			<!-- Data Not Exist -->
			<c:if test="${count == 0}">
				<tr>
					<td colspan="4"> no data </td>
				</tr>
			</c:if>
			
			<!-- Data Exist -->
			<c:if test="${count != 0}">
				<c:forEach var="recruit" items="${list}">
					<tr>
						<td> ${recruit.recruit_id} </td>
						<td> ${recruit.email} </td>
						<td> ${recruit.title} </td>
						<td> ${recruit.content} </td>			
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	
	<c:if test="${count != 0}">
		<p>
			<c:if test="${startPage > pageBlock}">
				<a href="recruitList.do">[◀◀]</a>
				<a href="recruitList.do?pageNum=${startPage-pageBlock}">[◀]</a>						
			</c:if>	
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == pageNum}">
					<b>[${i}]</b>
				</c:if>
				<c:if test="${i != pageNum}">	
					<a href="recruitList.do?pageNum=${i}">[${i}]</a>
				</c:if>
			</c:forEach>	
			<c:if test="${endPage < pageCount}">
				<a href="recruitList.do?pageNum=${startPage + pageBlock}">[▶]</a>
				<a href="recruitList.do?pageNum=${pageCount}">[▶▶]</a>
			</c:if>	
		</p>
	</c:if>
</body>



















