<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/fj/FJ_COMP/comp.css">

<c:set var="result" value="1"/>

<!-- 비밀번호 불일치 -->
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("비번 확인");
		history.back();
	</script>
</c:if>

<!-- 비밀번호 일치 -->
<c:if test="${result == 1}">
	<div class="container" >
		<form method="post" name="form" action="compInputPro.do" class="form-inline">
			<label>기본 정보</label>
			<div class="form-group">
				<ul>	
					<li>
						<input type="text" name="ceo" placeholder="대표자명">
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
			
			<label>상세 정보</label>
			<div>
				<ul>
					<li>
						<input type="text" name="comp_reg_date" placeholder="설립일">
					</li>
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
				<input type="submit" class="btn btn-default" value="submit">
			</p>
		</form>
	</div>
</c:if>













