<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/defaultSetting.jsp"%>
<script src="/fj/FJ_USER/introduce.js"></script>
<link href="/fj/FJ_USER/introduce.css" rel="stylesheet" type="text/css">



<!-- 자기소개서 입력 크기 잡아주기-->
<div class="introduce_mainsize">
	<h2> 자기 소개서 </h2>
	
	<form method="post" action="introduce_Pro.do" onsubmit="submitcheck()">
	<!-- 여기가 폼 하나시작 -->
	<div style="margin-top:30px;" id="standardID0">
	<input type="hidden" name="sub_name_0">
			<!-- 처음 보여지는 디폴트 값 -->
			<div id="sub_name0"  class="subject">
				<div id="sub_name_0" class="subject">자기소개</div>
				<div class="subject"><input type="button" class="btn btn-default" value="변경" name="modify" onclick="sub_name_modify('0')"></div>
			</div>	
			<!-- 변경을 누르면 나타나는 입력 폼 -->
			<div id="sub_change0" class="subject" style="display:none;">
				<input type="text" name="sub_change_name0" autofocus="autofocus" 
						style="background: #f2f7ff; border: 2px;" >
				<input type="button" value="확인" class="btn btn-default" onclick="sub_name_ok('0')">
				<input type="button" value="취소" class="btn btn-default" onclick="sub_name_cancel('0')"> 
			</div>
		<!-- 내용 입력하는 곳 -->
		<div> <textarea name="contents0" rows="13" cols="100%"></textarea> </div>
		<div> 
		<table style="width:100%;">
		<tr>
		<td align="right">
			<input type="button" class="btn btn-default" value="추가" onclick="add_introduce()">
			<input type="button" class="btn btn-default" value="삭제" onclick="del_introduce('0')"> 
		</td>
		</tr>
		<tr> <td  height="20px"></td> </tr>
		<tr>
		<td align="right">
			<input type="submit" class="btn btn-default" style="width:200px; font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;" value="저장">
		</td>
		</tr>
		</table>
			
		</div>
	</div>
	<input type="hidden" name="cnt"> 
	<input type="hidden" name="User_history_id" value="${User_history_id}">
</form>
</div>

