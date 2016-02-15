<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
${recruitCount}
<table border="1">
	<tr>
		<th> recruit_id </th>
		<th> email </th>
		<th> title </th>
		<th> content </th>
	</tr>
	<!-- Data Not Exist -->
	<c:if test="${recruitCount == 0}">
		<tr>
			<td colspan="4"> no data </td>
		</tr>
	</c:if>
	
	<!-- Data Exist -->
	<c:if test="${recruitCount != 0}">
		<c:forEach var="recruit" items="${recruitList}">
			<tr>
				<td> ${recruit.recruit_id} </td>
				<td> ${recruit.email} </td>
				<td> ${recruit.title} </td>
				<td> ${recruit.content} </td>			
			</tr>
		</c:forEach>
	</c:if>
</table>




















