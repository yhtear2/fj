<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
	<tr>
		<th> No. </th>
		<th> 제목 </th>
		<th> 작성자 </th>
		<th> 작성일 </th>
		<th> 수정일 </th>
	</tr>
	
	<c:if test="${count != 0}">
		<c:forEach items="${recruitList}">
			<tr>
				<td> 번호 </td>
				<td> ${recruitList.title} </td>
				<td> ${recruitList.writer} </td>
				<td> ${recruitList.reg_date} </td>
				<td> ${recruitList.last_date} </td>
			</tr>		
		</c:forEach>
	</c:if>	
</table>


















