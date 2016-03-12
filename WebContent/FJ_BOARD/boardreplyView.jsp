<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- include setting.jsp -->
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="setting.jsp"%>


<form action="/fj/boardreplyPro.do" method="post" class="note-create-form" onsubmit="boardreplyFormCkeck()"> 
                            		   
                                	<input type="hidden" name="board_num" value="${dto.board_num}">
                                	<!--  
                                	<input type="hidden" name="re_step" value="${dto.re_step}">
									<input type="hidden" name="re_count" value="${dto.re_count}"> 
									<input type="hidden" name="recom_count" value="${recom_count}"> 
									<input type="hidden" name="bad_count" value="${bad_count}">
									<input type="hidden" name="read_count" value="${read_count}">
									<input type="hidden" name="scrap_count" value="${scrap_count}">   -->               
                              <!--  <input type="hidden" name="lastNoteId" value="1034849 " id="lastNoteId">  -->
                              		
                                
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
							
								<!-- 댓글 적는 곳 (에디터 적용은 아직 미구현) -->
									
									
                                    <fieldset class="form">
                                    <textarea name="recontent" id="recontent" placeholder="댓글 쓰기" class="form-control" rows="15" > 
									 ${recontent}                              
                                    </textarea>
                                    
								   </fieldset> 
							 
                              	  
                                      
                       		</div> 
                       			   
                       			
                       			<!-- 댓글 등록 및 취소구간 -->   
                                <div class="content-function-cog note-submit-buttons clearfix">
                                    <p><a href="boardlist.do" id="note-create-cancel-btn" onclick="return confirm('정말로 취소하시겠습니까?')" class="btn btn-default btn-wide" 
                                    style="color:#0059b3; background-color:#f8f8f8; border:#0059b3 10px solid blue; font-size: 15px; 
									font-style:'돋움';" 
                                    >${btn_cancel}</a></p>
                                    <input type="submit" name="create" class="create btn btn-success btn-wide wide" value="${btn_reply}"
                                    style="font-style:'돋움'; font-size:15px; color:white; background-color:#0059b3; border:1px solid #0059b3;" 
                                    > 
                     
                                </div>
                            </form> 
                            