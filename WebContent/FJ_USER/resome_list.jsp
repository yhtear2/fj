<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%> 
<%@ include file="setting.jsp"%>
<!-- 	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  익스플로러,크롬,엣지 전부호환 가능 -->

	<title>人 코딩 - 이력서 게시판 </title>
<script type="text/javascript">
function delete_resome() {
	if (confirm("정말 삭제하시겠습니까??") == true) { 
		location.resome_Delete_Pro; 
		return false;
	} else {  
	  return false;
	}
}
</script>
<!-- 전체 크기 먹이기 --> 	      
<div style="width:750px; margin: 30px 0px 0px 0px; background-color: white;">
<div id="list-article" class="content scaffold-list" role="main">
			  
			<!-- 지울 예정 -->
            <div class="nav" role="navigation">     
                <h4 style="text-indent: 15px">이력서 게시판</h4>   
                <div class="category-filter-wrapper">      
	                <!-- 순으로 리스트를 출력하려는데 아직 미구현  -->
	                <ul class="list-sort pull-left">  
	                </ul> 
                </div>    
			 </div>
			 
            <div class="panel panel-default">

                <!-- Table -->
                <ul class="list-group">
                <!-- 여기 없다고 지우지 마세여  -->
                </ul>
            </div>

<!-- resome_list test (수정자 외 건들지 말 것) -->
<!-- 여기서 부터 이력서 작성시 리스트로 출력되는 곳  -->

<!-- count 가 0이면 이 if문은 생략되고 다음으로 넘어감  -->
<c:if test="${count != 0}">
	<c:forEach var="dto" items="${list}" varStatus="status">
		<div class="my-imagewrap">
			<div class="my-image">s
				<span class="pic">
					<!--  
					<a href="/fj/resome.do">  -->      
						<img src='${dto.photo}'
						border="0" width="100" height="140" onclick="window.location='resomeContent.do?user_history_id=${dto.user_history_id}'">
		
				</span>
				<span class="btn"> 
					<a href="/fj/resomeModyfiForm.do?user_history_id=${dto.user_history_id}">
						<img src="//www.saraminimage.co.kr/person/renewal/btn_image_modify.gif"alt="${page_usermodify}">
					</a>
					
					<a href="/fj/resomeDelete_Pro.do?user_history_id=${dto.user_history_id}" onclick="delete_resome();">
						<img src="//www.saraminimage.co.kr/person/renewal/btn_image_del.gif" alt="${page_userdelete}">
					</a>
						<br> 
					<c:forEach var="last_date" items="${fnc:split(dto.last_date,'.')}" >
					${last_date}
					</c:forEach> 

				</span>
			</div>
		</div> 
	</c:forEach>
</c:if>
<div class="my-imagewrap-hs"></div>
<!-- count가 8보다 작을 경우 이력서 작성박스 생성 -->
<div class="my-imagewrap" style="border:1px solid grey;">
	<div class="container">
			<div class="row" style="margin-left: 40px; margin-top: 70px;">
				<!-- Standard button -->
				<button type="button" class="btn3d btn btn-default btn-lg" onclick="window.location='resome.do'"> 
				<span class="glyphicon glyphicon-download-alt"></span></button>
			</div>
		</div>
	</div>
</div>
</div>





