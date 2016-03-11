<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>  
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
    <meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  <!-- 익스플로러,크롬,엣지 전부호환 가능 -->
	<title>人 코딩 - 자유게시판 </title>
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
				 
</head>

<div id="list-article" class="content scaffold-list" role="main">
            <div class="nav" role="navigation"> 
                <a href="/fj/boardwriteForm.do" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 글쓰기 </a>
                
                <h4>자유게시판</h4>   
                <div class="category-filter-wrapper"> 
                <!-- 아래 action은 검색 action  --> 
                    <form action="searchboardlist.do" method="post">  
                        <div class="category-filter-query pull-right">
                            <div class="input-group input-group-sm">
                                <input type="search" name="search" class="form-control" placeholder="검색어"> 
                                <span class="input-group-btn">
                                <!-- 검색버튼 -->
                                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                    
                                </span>     
                            </div>
                        </div>
                        <!-- ▲ 여기까지 검색어 활성창 div  -->
                        
                        <!-- 순으로 리스트를 출력하려는데 아직 미구현  -->
                        <ul class="list-sort pull-left">
                        	<c:if test='${sort == "board_num"}'> <li><a href="searchboardlist.do?sort=board_num" class="category-sort-link active">최신순</a></li> </c:if>
                        	<c:if test='${sort != "board_num"}'> <li><a href="searchboardlist.do?sort=board_num" class="category-sort-link">최신순</a></li> </c:if>
                            <c:if test='${sort == "recom_count"}'> <li><a href="searchboardlist.do?sort=recom_count" class="category-sort-link active">추천순</a></li> </c:if>
                            <c:if test='${sort != "recom_count"}'> <li><a href="searchboardlist.do?sort=recom_count" class="category-sort-link ">추천순</a></li> </c:if>
                            <c:if test='${sort == "re_count"}'> <li><a href="searchboardlist.do?sort=re_count" class="category-sort-link active">댓글순</a></li> </c:if>
                            <c:if test='${sort != "re_count"}'> <li><a href="searchboardlist.do?sort=re_count" class="category-sort-link ">댓글순</a></li> </c:if>
                            <c:if test='${sort == "read_count"}'> <li><a href="searchboardlist.do?sort=read_count" class="category-sort-link active">조회순</a></li> </c:if>
                            <c:if test='${sort != "read_count"}'> <li><a href="searchboardlist.do?sort=read_count" class="category-sort-link ">조회순</a></li> </c:if>
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
                
				<c:if test="${count == 0}">
					게시글이 없습니다.
				</c:if>
				<c:if test="${count != 0 }">
				
				<!-- 변수명은 dto로 정하고 list 라는 저장할 집합체를 구성한다. -->
                <c:forEach var="dto" items="${list}">
                        <li class="list-group-item  list-group-has-note clearfix">
							
                            <div class="list-title-wrapper clearfix">
                                <div class="list-tag clearfix">
                               <!-- 카테고리 영역 -->
                                   	<a href="searchboardlist.do?category=${dto.category}" class="list-group-item-text item-tag label label-info">
                                    <i class="fa fa-comments"></i> 
                                   	${dto.category}
                                    </a>
                                   	&nbsp; 
                                   	
                               <!-- 해시태그 영역 --> 
                                  <!-- 태그 안 적으면 안뜨게 해야함  --> 
                                  	<c:if test='${dto.hstag != null}'>
	                               		<c:forEach var="tag" items="${fn:split(dto.hstag,',')}">
		                               		<a href="searchboardlist.do?tag=${tag}" class="list-group-item-text item-tag label label-gray">
		                                    ${tag}     
		                                   	</a>
		                                   	&nbsp;  
	                          			</c:forEach> 
                          			</c:if>        
                                </div>
									<br>     
								<!-- 제목 부분 (hidden 생략) -->
                                <h5 class="list-group-item-heading ">
                                    <a href="boardcontent.do?board_num=${dto.board_num}&pageNum=${pageNum}&number=${number+1}">
                                    	${dto.subject}
                                    </a> 
                                </h5>
                            </div>
                            
                            <div class="list-summary-wrapper clearfix">
                                
                                    <div class="list-group-item-summary clearfix">
                                    	
                                        <ul>
                                        	<!-- li 순서 : 댓글 - 추천 - 조회  -->  
                                        	
                                        	
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
					 
					<!-- 작성자 구간 -->
					<div class="avatar avatar-list clearfix ">  
						<div class="avatar-info">
							<!-- 작성자 이름 -->
							${dto.name}
							<br>
							<!-- 작성날짜 부분 -->
							<fmt:formatDate value="${dto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm"/>
						</div>
					</div>

				</div>
                   </li> 
                     </c:forEach>
                       <div class="text-center">
                   <ul class="pagination pagination-sm">
			<!-- 임시용 보류 
			<li>
				<c:if test="${count > 0}">
				
				<c:if test="${startPage > pageBlock}">
				<a
				href="boardlist.do"
				class="prev disabled">◀◀</a>
				<a 
				href="boardlist.do?pageNum=${startPage-pageBlock}"
				class="prev disabled">◀</a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
				<a>${i}</a>
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
			<!-- pageBlock 손봐야함  -->
			<li>
				<c:if test="${count > 0}">
				<c:if test="${startPage > pageBlock}">
				</c:if>
				</c:if> 
				<a 
				href="boardlist.do" 
				class="prev disabled">◀◀</a>
				<a 
				href="boardlist.do?pageNum=${startPage-pageBlock}"
				class="prev disabled">◀</a>
			</li>	 
			<li>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}"> 
				<a>${i}</a>
				</c:if>
				<c:if test="${i != currentPage}">
				<a href="boardlist.do?pageNum=${i}">${i}</a>
				</c:if>   
				</c:forEach> 
			<c:if test="${endPage < pageCount}">
				<a href="boardlist.do?pageNum=${startPage+pageBlock}" class="prev disabled">▶</a>
				<a href="boardlist.do?pageNum=${pageCount}" class="prev disabled">▶▶</a>
			</c:if>
			  
			</li>   
		    
		
		</ul>  
                </div>      
                </c:if> 
               
                </ul>
              
            </div>
            
          
	
	
 