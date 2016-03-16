<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/defaultSetting.jsp" %>
<link href="/fj/FJ_MAIN/main_page.css" rel="stylesheet" type="text/css">
<script src="/fj/FJ_MAIN/main_page.js" type="text/javascript" charset="utf-8"></script>

<!-- 전체 크기 잡아주기 -->    
<div class="mainSize" >

	<!-- 왼쪽 신규채용정보 -->
	<div class="inner-container">
		<!-- 신규 채용정보 타이틀 -->
		<div style="margin : 0px 0px 5px 10px;">
			<img src="${images}/newRcruit_1.png" class="img-title">
			<img src="${images}/newRcruit_2.png" class="img-title">
			<a href="recruitList.do">
				<img src="${images}/newRcruit_3.png" class="img-title">
				<img src="${images}/newRcruit_4.png" class="img-title">
			</a>	
		</div>
		<div>
			<img src="${images}/newRcruit_5.png">
		</div>
		<!-- 리스트로 뿌려줄 내용 -->
		<div class="reruit-List-container">
			<table style="width:100%">
				<!-- 이 tr은 위쪽에 여백주려고 만든거야~ -->
				<tr height="5px" align="center"> <td> </td> </tr>

				<c:forEach var="dto" items="${recruitList}">
					<tr height="5px" align="center"> <td> </td> </tr>
					<tr height="10px;">
						<td>
							<span class="newRcruit-comp">${dto.name}</span> 
							<span class="newRcruit-title">
								<a href="recruitcontent.do?recruit_id=${dto.recruit_id}">${dto.title}</a>
							</span>
						</td>
					</tr>
					<tr height="5px" align="center">
						<td>
							<img src="${images}/newRcruit_6.png">
						</td>
					</tr>
					<!-- 이 아이는 아래쪽 여백 -->
					<tr height="10px"> <td> </td> </tr>
				</c:forEach>
				
			</table>
		</div>
	</div>
	<!-- 오른쪽 -->
	<div  class="inner-container">
		<!-- 위 !공지사항! -->
		<div>
			<!-- 공지사항 타이틀 -->
			<div style="margin : 0px 0px 5px 10px;">
				<img src="${images}/notice_1.png" class="img-title">
				<img src="${images}/notice_2.png" class="img-title">
				<a href='searchboardlist.do?category=공지사항'>
					<img src="${images}/newRcruit_2.png" class="img-title">
					<img src="${images}/newRcruit_3.png" class="img-title">
					<img src="${images}/newRcruit_4.png" class="img-title">
				</a>	
			</div>
			
			<!-- 리스트로 뿌려줄 내용 -->
			<c:set var="i" value="${0}"/>
			<div class="notice-List-container">
				<table style="width:100%">
					<c:forEach var="dto" items="${noticeList}">
						<input type="hidden" name="date1${i}"  id="date" value="${dto.reg_date}">
					<tr height="35px;">
						<td>
							<a href="boardcontent.do?board_num=${dto.board_num}"><span class="notice-title">${dto.subject}</span></a> 
						</td>
						<td align="right">
							<span class="notice-name">${dto.name}</span>
							&nbsp;
							<span class="notice-date"><span id="date1${i}"></span></span>
							&nbsp;&nbsp;
						</td>
					</tr>
						<!-- 이거 중간에 선 그리는거야 -->
					<tr> <td style="border-top: 1.5px solid #c3c3c3; width:100%" colspan="3"> </td> </tr>	
					<c:set var="i" value="${i+1}"/>
				</c:forEach>
				
				</table>
			</div>
		</div>
		
		
		<!-- 아래 게시판 인기글 -->
		<c:set var="ii" value="${0}"/>
		<div style="margin-top: 70px;">
			<!-- 인기글 타이틀 -->
			<div style="margin : 0px 0px 5px 10px;">
				<img src="${images}/community_1.png" class="img-title">
				<img src="${images}/community_2.png" class="img-title">
				<a href="boardlist.do">
					<img src="${images}/newRcruit_2.png" class="img-title">
					<img src="${images}/newRcruit_3.png" class="img-title">
					<img src="${images}/newRcruit_4.png" class="img-title">
				</a>	
			</div>
			
			<!-- 리스트로 뿌려줄 내용 -->
			<div class="notice-List-container">
				<table style="width:100%">
				<c:forEach var="dto" items="${communityList}">
				<input type="hidden" name="date1${ii}"  id="date" value="${dto.reg_date}">
					<tr height="35px;">
						<td>
							<a href="boardcontent.do?board_num=${dto.board_num}"><span class="notice-title">${dto.subject}</span></a> 
						</td>
						<td align="right">
							<span class="notice-name">${dto.name}</span>
							&nbsp;
							<span class="notice-date"><span id="date2${ii}"></span></span>
							&nbsp;&nbsp;
						</td>
					</tr>
					<!-- 이거 중간에 선 그리는거야 -->
					<tr> <td style="border-top: 1.5px solid #c3c3c3; width:100%" colspan="2"> </td> </tr>
					<c:set var="ii" value="${ii+1}"/>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>