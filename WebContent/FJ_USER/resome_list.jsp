<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<%@ include file="/defaultSetting.jsp"%>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  <!-- 익스플로러,크롬,엣지 전부호환 가능 -->
	<title>人 코딩 - 이력서 게시판 </title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="http://okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico" type="image/x-icon">
	<link rel="apple-touch-icon" href="http://okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
	<link rel="apple-touch-icon" sizes="114x114" href="http://okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
       <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
       <meta property="og:image" content="http://okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">
       
       <link rel="stylesheet" href="http://okky.kr/assets/application-178a471b205e52821f985abddea1ac34.css">
 
 	      
 	   
 	   
       <!--[if lt IE 9]>
           <script src="http://okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript" ></script>
       <![endif]--> 
   
              
	<meta name="layout" content="main">
			   

<div id="list-article" class="content scaffold-list" role="main">
			  
			<!-- 지울 예정 -->
            <div class="nav" role="navigation"> 
                <a href="/fj/resome.do" class="create btn btn-success btn-wide pull-right" >
                <i class="fa fa-pencil"></i> 
                	이력서 작성 </a>
                
                <h4>이력서 게시판</h4>   
                <div class="category-filter-wrapper">   
                <!-- 아래 action은 검색 action  -->
                
                	<!-- 지울 예정 -->
                     <form action="" method="get" name="category-filter-form" id="category-filter-form">  
                        <div class="category-filter-query pull-right">
                            <div class="input-group input-group-sm">
                                <input type="search" name="query" class="form-control" placeholder="검색어" value=""> 
                                <span class="input-group-btn">   
                                <!-- 검색버튼 -->
                                	
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button> 
                                    
                                </span>  
                            </div> 
                        </div>
                        <!-- ▲ 여기까지 검색어 활성창 div  -->
                        
                        <!-- 순으로 리스트를 출력하려는데 아직 미구현  -->
                        <ul class="list-sort pull-left">  
                        <!--  
                            <li><a href="/fj/boardlist.do?sort=id&amp;order=desc" data-sort="id" data-order="desc" class="category-sort-link active">최신순</a></li>
                            <li><a href="/fj/boardlist.do?sort=voteCount&amp;order=desc" data-sort="voteCount" data-order="desc" class="category-sort-link ">추천순</a></li>
                            <li><a href="/fj/boardlist.do?sort=noteCount&amp;order=desc" data-sort="noteCount" data-order="desc" class="category-sort-link ">댓글순</a></li>
                            <li><a href="/fj/boardlist.do?sort=scrapCount&amp;order=desc" data-sort="scrapCount" data-order="desc" class="category-sort-link ">스크랩순</a></li>
                            <li><a href="/fj/boardlist.do?sort=viewCount&amp;order=desc" data-sort="viewCount" data-order="desc" class="category-sort-link ">조회순</a></li>
                      	-->
                        </ul> 
                        
                        <input type="hidden" name="sort" id="category-sort-input" value="id">   
                        <input type="hidden" name="order" id="category-order-input" value="desc">
                    </form>
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
<html>

<link href="/css/ui/reset-fonts.css" media="all" rel="stylesheet"
	type="text/css">
	
<!-- 이력서 리스트 틀  -->
<style type="text/css">
a {
	text-decoration: none
}

.my-imagewrap {
	float: left;
	width: 164px;
	height: 263px;
	_height: 299px;
	padding-top: 36px;
	text-align: center;
	line-height: 0;
	font-size: 0;
	background: #f4f6fa
}

.my-imagewrap .pic {
	display: inline-block;
	width: 124px;
	height: 153px;
	_height: 164px;
	padding-top: 11px;
	text-align: center;
	background: url('//www.saraminimage.co.kr/person/renewal/bg_pf_img.gif')
		no-repeat;
}

.my-imagewrap .btn {
	display: block;
	height: 37px;
	_height: 47px;
	padding-top: 9px;
	letter-spacing: 1px;
	font-size: 12px;
	_font-size: 16px;
	line-height: 160%;
}

.my-imagewrap .sbtn {
	display: block;
	font-size: 11px;
	color: #878787;
	line-height: 15px; /*line-height:110%;_line-height:120%;*/
}

.my-imagewrap .sbtn a {
	display: inline-block;
	font-size: 11px;
	color: #878787;
	font-family: 돋움, dotum, sans-serif;
	letter-spacing: -1px;
	background:
		url('//www.saraminimage.co.kr/person/renewal/bg_slink_dot.gif')
		no-repeat right 2px;
}

.my-imagewrap .sbtn a:hover {
	color: #878787;
	text-decoration: none;
}

.my-imagewrap .sbtn a em {
	display: inline-block;
	cursor: pointer;
	padding-right: 8px;
	height: 13px;
	overflow: hidden;
	border-bottom: 1px solid #878787;
	font-style: normal
}         
</style>    
<!-- count 가 0이면 이 if문은 생략되고 다음으로 넘어감  -->
<c:if test="${count != 0}">
	<c:forEach var="dto" items="${list}" varStatus="status">
		<div class="my-imagewrap">
			<div class="my-image">
				<span class="pic">
					<!--  
					<a href="/fj/resome.do">  -->
						<img alt="" src="https://www.saramin.co.kr/zf_user/persons/picture?idx=5001590|4878d2c293208d3fca43f311609905c7c40f4a8554d8c688f42d3ad98fa6578b" 
						border="0" width="100" height="140">
					
				</span>
				<span class="btn"> 
					<a href="/fj/resomeContent.do?user_history_id=${dto.user_history_id}">
						<img src="//www.saraminimage.co.kr/person/renewal/btn_image_modify.gif"alt="${page_usermodify}">
					</a>
					<a href="/fj/deletePro.do">
						<img src="//www.saraminimage.co.kr/person/renewal/btn_image_del.gif" alt="${page_userdelete}">
					</a>
				</span>
			</div>
		</div>
		 
	</c:forEach>
</c:if>
<!-- count가 8보다 작을 경우 이력서 작성박스 생성 -->
<c:if test="${count<8}">
	<div class="my-imagewrap" style="border:1px solid grey;">
		<div class="container">
			<div class="row" style="margin-left: 40px; margin-top: 70px;">
				<!-- Standard button -->
       		 	<button type="button" class="btn3d btn btn-default btn-lg" onclick="window.location='resome.do'"> 
       		 	<span class="glyphicon glyphicon-download-alt"></span></button>
        	 </div>
        </div>
	</div>
</c:if>	
</html>

</div>






