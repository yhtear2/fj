<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>  
  
<head>
        <meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>人 Coding - 커뮤니티 </title>
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
		
		 
	
	<style type="text/css"></style></head>

<div id="list-article" class="content scaffold-list" role="main">
            <div class="nav" role="navigation"> 
                <a href="/fj/boardwriteForm.do" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 글쓰기 </a>
                
                <h4>자유게시판</h4>   
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
				<c:if test="${count != 0 }">
				<!-- 변수명은 dto로 정하고 list 라는 저장할 집합체를 구성한다. -->
                <c:forEach var="dto" items="${list}">
                        <li class="list-group-item  list-group-has-note clearfix">
							
                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                                
                                <!-- 글번호 부분 (boardlist.do 출력창에서 위에서부터 최신순으로 보여야함  -->
                                <!-- 손봐야함 -->
                                    <span class="list-group-item-text article-id">		
                    					${number}
                    					<c:set var="number" value="${number-1}"/>
                    				 </span>
                                    
                               <!-- 카테고리 영역 -->
                                   	<a href="카테고리 클릭시 해당 카테고리 페이지로 이동하는 경로" class="list-group-item-text item-tag label label-info">
                                    <i class="fa fa-comments"></i> 
                                   	${dto.category}
                                    </a>
                                   	
                               <!-- 해시태그 영역 -->
                                   	<a href="해시태그 클릭시 해당 관련된 태그들이 있는 페이지로 이동하는 경로" class="list-group-item-text item-tag label label-gray">
                                    ${dto.hstag}
                                   	</a>
                                </div>
									<br>
								<!-- 제목 부분 (hidden 생략) -->
                                <h5 class="list-group-item-heading ">
                                    <a href="boardcontent.do?num=${dto.board_num}&pageNum=${pageNum}&number=${number+1}">
                                    	${dto.subject}
                                    </a>
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                    	
                                        <ul>
                                        	<!-- li 순서 :  추천 -  조회수 -  댓글 수   -->  
                                        	
                                            <li class="" >
                                            <i class="item-icon fa fa-comment"></i>
                                      		<table>
                                      			<tr> 
                                      				<td>
                                      					${dto.re_count}
                                      				</td>
                                      			</tr>
                                      		
                                      		</table>
                      		              	</li>
                                            <li class="item-icon-disabled"><i class="item-icon fa fa-thumbs-up"></i>
                                            <table>
                                            	<tr>
                                            		<td>
                                            			${dto.recom_count}
                                            		</td>
                                            	</tr>
                                            </table>
                                            </li>
                                            <li class=""><i class="item-icon fa fa-eye"></i>
                                            <table>
                                            	<tr>
                                            		<td>
                                            			${dto.read_count}  
                                            		</td>
                                            	</tr>
                                            </table>
                                            </li>
                                            
                                        </ul>
                                        
                                    </div>
                                
                            </div>
 
                            <div class="list-group-item-author clearfix">
					 
					<!-- 작성자 구간 (우선보류) -->
					<div class="avatar avatar-list clearfix ">  
						<a href="/user/info/31140" class="avatar-photo"><img
							src="//www.gravatar.com/avatar/14986ac9dab7a96bf26835c86f5b2665?d=identicon&amp;s=30"></a>
						<div class="avatar-info">
							<a class="nickname" href="유저정보창 경로주기">
							
							</a>
							<!-- 활동량 (구현x) 
							<div class="activity">
								<span class="fa fa-flash"></span> 32 
							</div>
							-->
							
							<!-- 작성날짜 참고부분 (OKKY) 
							<div class="date-created timeago" title="2016-02-20 19:09:44.0">7시간
								전</div>
							-->
							
							<!-- 작성날짜 부분 -->
							<fmt:formatDate value="${dto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm"/>
						</div>
					</div>

				</div>
                   </li> 
                     </c:forEach>
                </c:if> 
                </ul>
               
            </div>
            
            <div class="text-center">

		<ul class="pagination pagination-sm">
			<!-- 원래 이렇게 해야되는데 li 태그땜에 이동특문 사라짐, 손봐야할듯 -->
			<!--  
			<li>
				<c:if test="${count > 0}">
				
				<c:if test="${startPage > pageBlock}">
				<a
				href="boardlist.do"
				class="prev disabled">◀◀</a>
				<a 
				href="boardlist.do?pageNum=${startPage-pageBloack}"
				class="prev disabled">◀</a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
				<b>${i}</b>
				</c:if>
				<c:if test="${i != currentPage}">
				<a href="boardlist.do?pageNum=${i}">${i}</a>
				</c:if>   
				</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="boardlist.do?pageNum=${startPage + pageBlock}" class="prev disabled">▶</a>
				<a href="boardlist.do?pageNum=${pageCount}" class="prev disabled">▶▶</a>
			</c:if>
			</c:if>
			</li>
			-->
			<li>
				<c:if test="${count > 0}">
				<c:if test="${startPage > pageBlock}">
				</c:if>
				</c:if>
				<a
				href="boardlist.do" 
				class="prev disabled">◀◀</a>
				<a 
				href="boardlist.do?pageNum=${startPage-pageBloack}"
				class="prev disabled">◀</a>
			</li>	
			<li>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
				<b>${i}</b>
				</c:if>
				<c:if test="${i != currentPage}">
				<a href="boardlist.do?pageNum=${i}">${i}</a>
				</c:if>   
				</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="boardlist.do?pageNum=${startPage + pageBlock}" class="prev disabled">▶</a>
				<a href="boardlist.do?pageNum=${pageCount}" class="prev disabled">▶▶</a>
			</c:if>
			
			</li>
		</ul>
	</div>
		</div>