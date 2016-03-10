<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="/defaultSetting.jsp"%>
<script src="/fj/FJ_USER/resome.js"></script>
<link href="/fj/FJ_USER/style.css" rel="stylesheet" type="text/css">
<script src="/fj/FJ_USER/request.js"></script>

<div id="list-article" class="content scaffold-list" role="main">
            <div class="nav" role="navigation"> 
                <a href="/fj/resome.do" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 글쓰기 </a>
                
                <h4>이력서 게시판</h4>   
                <div class="category-filter-wrapper"> 
                <!-- 아래 action은 검색 action  --> 
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
                            <li><a href="/fj/boardlist.do?sort=id&amp;order=desc" data-sort="id" data-order="desc" class="category-sort-link active">최신순</a></li>
                            <li><a href="/fj/boardlist.do?sort=voteCount&amp;order=desc" data-sort="voteCount" data-order="desc" class="category-sort-link ">추천순</a></li>
                            <li><a href="/fj/boardlist.do?sort=noteCount&amp;order=desc" data-sort="noteCount" data-order="desc" class="category-sort-link ">댓글순</a></li>
                            <li><a href="/fj/boardlist.do?sort=scrapCount&amp;order=desc" data-sort="scrapCount" data-order="desc" class="category-sort-link ">스크랩순</a></li>
                            <li><a href="/fj/boardlist.do?sort=viewCount&amp;order=desc" data-sort="viewCount" data-order="desc" class="category-sort-link ">조회순</a></li>
                        </ul> 
                        
                        <input type="hidden" name="sort" id="category-sort-input" value="id">   
                        <input type="hidden" name="order" id="category-order-input" value="desc">
                    </form>
                </div>   
			 </div>
			 
            <div class="panel panel-default">

                <!-- Table -->
                
				  
                <ul class="list-group">
                <!-- 글이 존재할 때  -->
                
				
					게시글이 없습니다.
				
				 
               
                </ul>
              
            </div>
            
          
</div>
<!-- resome_list test (수정자 외 건들지 말 것) -->
	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>이력서 수정/삭제</title>
<link href="/css/ui/reset-fonts.css" media="all" rel="stylesheet"
	type="text/css">
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

<div class="my-imagewrap">
	<div class="my-image">
		<span class="pic"><img alt=""
			src="https://pds.saramin.co.kr/person/photo/2016/03/1457575030_14575750291457575022IU.jpg"
			border="0" onmouseover="showTipLayer()" width="100" height="140"></span>
		<span class="btn"> <a href="/fj/resome.do"><img
				src="//www.saraminimage.co.kr/person/renewal/btn_image_modify.gif"
				alt="수정"></a> <a
			href="javascript:deletePhoto('person/photo/2016/03/1457575030_14575750291457575022IU.jpg')"><img
				src="//www.saraminimage.co.kr/person/renewal/btn_image_del.gif"
				alt="삭제"></a>
		</span>

	</div>
</div>
</div>
</head>
</html>