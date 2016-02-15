<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="result" value="1"/>

<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("비번 확인");
		history.back();
	</script>
</c:if>
<c:if test="${result == 1}">
	<div style="background-color: #ffffff; width: 550px;">
		<form method="post" name="form" action="compInputPro.do">
			<div class="comp">
				<ul>
					<li>
						<input type="text" name="ceo" placeholder="대표자명">
					</li>
					<li>
						<input type="text" name="comp_reg_date" placeholder="설립일">
					</li>
					<li>
						<input type="text" name="comp_reg_date" placeholder="기업구분">
					</li>
					<li>
						<div>
							<select name="tel1">
								<option> 010 </option>
								<option> 011 </option>
								<option> 016 </option>
								<option> 017 </option>
								<option> 018 </option>
								<option> 019 </option>
							</select>
						
							<input type="text" name="tel2" placeholder="휴대폰 번호 '-' 없이 입력">
						</div>
					</li>
					
					<li>
						<input type="text" name="address" placeholder="우편번호 / 회사주소">
						<span style="display:inline-block; font-weight:bold; border:1px solid #dcdcdc;"> 우편번호 </span>
					</li>
					<li>
						<input type="text" name="address_detail" placeholder="상세주소">
					</li>
				</ul>
			</div>
			
			<div>
				<ul>
					<li>
						<input type="text" name="capital" placeholder="자본금">
					</li>
					<li>
						<input type="text" name="year_sale" placeholder="연매출">
					</li>
					<li>
						<input type="text" name="emp_count" placeholder="사원수">
					</li>
				</ul>
			</div>
			
			<p>
				<input type="submit" value="submit">
			</p>
			
		</form>
	</div>
</c:if>













