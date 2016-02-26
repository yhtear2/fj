<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<%@ include file="/defaultSetting.jsp" %>
<%@ include file="setting.jsp" %>   

<!DOCTYPE html>

<title>人 코딩 - 자유게시판</title> 

		<div id="article" class="content" role="main"> 
            <div class="nav" role="navigation"> 
                <a href="boardwriteForm.do" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 글쓰기 </a>

                <h4> 자유게시판 </h4>
            </div>
 
              <div class="panel panel-default clearfix">
                <div class="panel-heading clearfix"> 
			<div class="avatar avatar-medium clearfix pull-left">
				<a href="유저정보창 경로주기" class="avatar-photo"><img
					src="//www.gravatar.com/avatar/304e9274754765f6258ce23cd234682b?d=identicon&amp;s=40"></a>
					
				
				
				<div class="avatar-info">   <!-- div 있어야 글 뒤바탕 흰색 -->
					<!-- 작성자 구간 -->
					<!-- 
					<a class="nickname" href="유저정보창 경로주기"> 
				    
					</a>
					--> 
				
					<!-- 활동량 구현x -->
					<!--    
					<div class="activity">
						<span class="fa fa-flash"></span> 621
					</div>
					-->
					
					<!-- 작성날짜 부분 --> 
					<fmt:formatDate value="${dto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm"/> 
				</div>
			</div>
			<div class="content-identity pull-right">
					<!-- 댓글수 확인부분 -->
                    <div class="content-identity-count">
                    <i class="fa fa-comment"></i> 
                    <table>
                       <tr> 
                         <td> 
                           ${dto.re_count} 
                         </td>
                       </tr>
                   </table>
                  </div>
           			 <!-- 조회수 확인부분 -->
                    <div class="content-identity-count">
                    <i class="fa fa-eye"></i>
                    <table>
                       <tr>
                         <td>
                           ${dto.read_count}  
                         </td>
                       </tr>
                    </table>  
                   </div>
                 </div>
                </div> 
                <div class="content-container clearfix">
                    <div class="panel-body content-body pull-left">
                        <div class="content-tags">
                        	<!-- 글번호 부분 -->
                            <span class="list-group-item-text article-id">
                            	${number} 
                    			<c:set var="number" value="${number-1}"/>
                            </span>
                            
                            <!-- 카테고리 영역 -->
                            <a href="카테고리 클릭시 해당 카테고리 페이지로 이동하는 경로" class="list-group-item-text item-tag label label-info">
                            <i class="fa fa-comments"></i>
                            ${dto.category}
                            </a>
                             <a href="해쉬태그 경로"
							class="list-group-item-text item-tag label label-gray">${dto.hstag}</a>
   
						</div>
						
                        <!-- 해당 글제목 보여지는 부분 (h2 태그였는데 우선 보류) -->
                        <a class="panel-title">
                        ${dto.subject}
                        </a> 
                        <hr> 
                        <!-- 해당 글내용 보여지는 부분 -->
                        <article class="content-text">
                        
                        ${dto.content}   
                         
                        </article>
					</div>

					     
                    <div class="content-function pull-right text-center">
                        <div class="content-function-group">
                    <!-- 추천기능 부분 --> 
                    <a href="javascript://" class="note-vote-btn" role="button"
								data-type="vote" data-eval="false" data-id=""><i
								id="note-vote" class="fa fa-thumbs-up note-vote"
								data-toggle="tooltip" data-placement="left" title=""
								data-original-title="좋아요"></i></a>
                    
                    <!--  
					<a href="javascript://" class="note-vote-btn" role="button"
						data-type="unvote" data-eval="false" data-id="1034845"><i
						id="note-vote-1034845" class="fa fa-thumbs-up note-unvote"
						data-toggle="tooltip" data-placement="left" title=""
						data-original-title="추천 취소"></i></a>
					-->
					
					<!-- 추천수 보기 -->
					<div id="content-vote-count-1034845" class="content-count">
					 <table>
                       <tr>
                         <td>
                           ${dto.recom_count}  
                         </td>
                       </tr>
                    </table>   
					</div>
				</div>
				
					<!-- 스크랩 보기 --> 
                        <div class="content-function-group article-scrap-wrapper">
							<a href="javascript://" id="article-scrap-btn" data-type="scrap"><i
								class="fa fa-bookmark " data-toggle="tooltip"
								data-placement="left" title="" data-original-title="스크랩"></i></a>
							<div id="article-scrap-count" class="content-count">
							 <table>
		                       <tr>
		                         <td>
		                           ${dto.scrap_count}  
		                         </td>
		                       </tr>
		                    </table>  
							</div>
                        </div>
                    </div>
                    
                    <!-- 페이스북 공유버튼 -->
                    <div class="content-function-cog share-btn-wrapper">
                      <div class="dropdown"> 
					<a
						href="http://www.facebook.com/sharer/sharer.php?app_id=1451111438499030&amp;sdk=joey&amp;u=http%3A%2F%2Fokky.kr%2Farticle%2F314044&amp;display=popup&amp;ref=plugin"
						class="btn-facebook-share"><i
						class="fa fa-facebook-square fa-fw" data-toggle="tooltip"
						data-placement="left" title="" data-original-title="페이스북 공유"></i></a>
					  </div>  
   
                        <!-- 게시물 수정 및 삭제버튼기능 -->
                        <div class="dropdown">
                            <form action="boarddeletePro.do" method="post" name="article-delete-form" id="article-delete-form"><input type="hidden" name="_method" value="DELETE" id="_method">
                                <div class="dropdown"> 
                                    <a href="javascript://" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="" data-original-title="게시물 설정"></i></a>
                                    <ul class="dropdown-menu" role="menu">  
                                        <li><a href="boardmodifyView.do?board_num=${dto.board_num}&pageNum=${pageNum}" class="edit"><i class="fa fa-edit fa-fw"></i>${btn_modify}</a></li> 
                                        	<!--  
                                            <li><a href="javascript://" onclick="alert('댓글이 있는 글은 삭제하실 수 없습니다.');"><i class="fa fa-trash-o fa-fw"></i>${btn_delete}</a></li> 
                                            --> 
                                            <li>
                                            <a href="javascript://" onclick="deletewrite();" type="button"><i class="fa fa-trash-o fa-fw"></i>${btn_delete}</a>
                                            </li>  
                                        
                                    </ul>
                                </div>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>

             
             
            
             
             
             
             
             
			
            <div class="panel panel-default clearfix">
                <!-- List group -->
                <ul class="list-group">
                
                	<!-- 댓글 수  -->
                    <li id="note-title" class="list-group-item note-title">
                        <h3 class="panel-title">댓글 <span id="note-count">
                        ${dto.re_count}
                        </span> 
                        </h3>
                    </li>
                    
                    	
                    	<!-- 댓글 달았을 때 보이는 곳 (잠정보류) -->
                    	<!--  
                        <li class="list-group-item note-item clearfix" id="note-1034847">
                            <form action="/content/update/1034847" method="post" data-id="1034847" class="note-update-form"><input type="hidden" name="_method" value="PUT" id="_method">
                  			<div class="content-body panel-body pull-left">
							-->
						<!-- 작성자 이미지 -->
						<!--  
						<div class="avatar avatar-medium clearfix ">
							<a href="유저정보창 경로주기" class="avatar-photo"><img
								src="//www.gravatar.com/avatar/ea033f92e21318820a45c9bb5ca83403?d=identicon&amp;s=40"></a>
							<div class="avatar-info">
							-->
								<!-- 작성자 표시구간 -->
								<!--  
								<a class="nickname" href="유저정보창 경로주기">작성자</a>
								-->
								<!-- 작성자 활동량(구현x) -->
								<!--  
								<div class="activity">
									<span class="fa fa-flash"></span> 10
								</div>
								-->
								
								<!-- 댓글 남긴날짜 -->
								<!--  
								<fmt:formatDate value="${dto.reg_date}" type="both" pattern="yyyy-MM-dd HH:mm"/> 
								
							</div>
						</div>
						-->
						
						<!-- 댓글남겨지는 부분 (우선 content 로 해놈..) --> 
						<!--  
						<fieldset class="form">
                                        <article id="note-text-1034847" class="list-group-item-text note-text">
                                            
                                           <p>${dto.content}</p> 
                                        </article>
                                    </fieldset>
                                </div>
								-->
								<!-- 좋아요 버튼부분 -->
								<!--  
                                <div class="content-function pull-right text-center">
                                    <div class="content-function-group">
							<a href="javascript://" class="note-vote-btn" role="button"
								data-type="vote" data-eval="false" data-id="1034847"><i
								id="note-vote-1034847" class="fa fa-thumbs-up note-vote"
								data-toggle="tooltip" data-placement="left" title=""
								data-original-title="좋아요"></i></a>  -->
							
							<!-- 추천수 표시 -->	
							<!--  
							<div id="content-vote-count-1034847" class="content-count">
								<table>
			                       <tr>
			                         <td>
			                           ${dto.recom_count}  
			                         </td>
			                       </tr>
                   			    </table> 
						    </div>
						   </div>
                          </div>
							-->
                                <!-- 댓글 수정 및 삭제부분 -->
                                 <!--  
                                <div id="content-function-cog-1034847" class="content-function-cog">
                                    <div class="dropdown">
                                        <a href="javascript://" data-toggle="dropdown"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="" data-original-title="게시물 설정"></i></a>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="javascript://" class="note-edit-btn" data-id="1034847"><i class="fa fa-edit fa-fw"></i>수정</a></li>
                                            <li><a href="javascript://" class="note-delete-btn" data-id="1034847"><i class="fa fa-trash-o fa-fw"></i> 삭제</a></li>
                                        </ul>
                                    </div>  -->
                                    
                                    <!-- 수정하고 나서의 저장/취소 -->
                                      <!--  
                                    <div class="buttons" style="display: none;">
                                        <p><a href="javascript://" class="btn btn-default btn-wide note-edit-cancel-btn">취소</a></p>
                                        <p><input type="submit" name="create" class="btn btn-success btn-wide" value="저장" id="create"></p>
                                    </div>
                                </div> 
                              	</form>  -->
                              
                    <!-- 댓글 작성하는 부분  (경로부분 보류) -->
                    <li class="list-group-item note-form clearfix">
                        
                        	 
                            <form action="/fj/boardwritePro.do" method="post" class="note-create-form">
                                	<input type="hidden" name="board_num" value="${board_num}">  
                                    <input type="hidden" name="lastNoteId" value="1034849 " id="lastNoteId">
                                
                                
                                <div class="content-body panel-body pull-left">
                                    <div style="margin-left: 5px;">
                                        
                            <!-- 작성자 이미지  -->
							<div class="avatar avatar-medium clearfix ">
								<a href="유저정보 경로주기" class="avatar-photo"><img
									src="//www.gravatar.com/avatar/ea033f92e21318820a45c9bb5ca83403?d=identicon&amp;s=40"></a>
									
								<!-- 작성자 표시구간 (board_num 은 임시차원 생성)-->
								<div class="avatar-info">
									<a class="nickname" href="유저정보 경로주기">
									${board_num}
									</a>
									
									<!-- 활동량 구간(구현x) -->
									<!--  
									<div class="activity block">
										<span class="fa fa-flash"></span> 10
									</div>
									--> 
								</div>
							</div>
						</div>
							
								<!-- 댓글 적는 곳 (에디터 적용할 부분) --> 
									 
									
                                    <fieldset class="form">
                                    <textarea name="content" id="note-create" placeholder="댓글 쓰기" class="form-control" rows="15">
                                    
									${dto.content}	                                       
                                    </textarea>
                                    
								   </fieldset>   
                                    
                                      
                       		</div> 
                       			
                       			
                       			<!-- 댓글 등록 및 취소구간 -->  
                                <div class="content-function-cog note-submit-buttons clearfix">
                                    <p><a href="javascript://" id="note-create-cancel-btn" class="btn btn-default btn-wide" style="">${btn_cancel}</a></p>
                                    <input type="submit" name="create" class="create btn btn-success btn-wide wide" value="${btn_reply}"> 
                     
                                </div>
                            </form>
                        </li>
                         
                   
                </ul>
            </div>
        </div>