<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/defaultSetting.jsp"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 폼 세팅구간 (지우지 마세요) -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="noindex,nofollow">
<link href="//www.saraminimage.co.kr/css_new/sub_global.css" rel="stylesheet" type="text/css">
<link href="//www.saraminimage.co.kr/css/ui/reset-fonts.css" rel="stylesheet" type="text/css" media="screen, print">
<link href="//www.saraminimage.co.kr/css/resume-20141031.css" rel="stylesheet" type="text/css" media="screen, print">
<script type="text/javascript" src="//www.saraminimage.co.kr/js/libs/prototype-1.6.0.3.js"></script>
<script type="text/javascript" src="//www.saraminimage.co.kr/js/libs/pngHack.mini.js"></script>
<!-- div 시작점  -->
<div class="resume" style="margin:50px" >
            <!-- header (top icon & description) -->
            <div id="resume_header">
    <div class="item-header">   
    <!--  
        <div class="sec-btn-left">
                        <span id="scrap_btn" style="display:none">
                              <img src="//www.saraminimage.co.kr/resume/2011_new/btn_scrap.gif" style="cursor:pointer" onclick="scrap()" alt="관심인재로 등록">
                          </span> 
            <span id="mandb_btn" style="display:none"><img src="//www.saraminimage.co.kr/resume/2011_new/51_btnopen.png" style="cursor:pointer" onclick="useMandb(5129253)" onmousedown="try{n_trackEvent('', '', 'contact', 'layer1');}catch(e){}" alt="열람하기"></span>
            <span id="print_btn"><img src="//www.saraminimage.co.kr/resume/2011_new/btn_print2.png" style="cursor:pointer" onclick="printResume()" alt="인쇄"></span> 
            <span id="edit_btn"><img src="//www.saraminimage.co.kr/resume/2011_new/btn_modify_18px.gif" style="cursor:pointer" onclick="showEditResumeLayer(this)" alt="수정"></span> 
            <span id="pdf_btn" style="display:none"><img src="//www.saraminimage.co.kr/resume/2011_new/btn_print_pdf.gif" style="cursor:pointer" onclick="" alt="고품질(PDF)인쇄"></span>
            <span id="email_btn" style="display:none">
                              <a href="javascript:sendMail('5001590', '5129253')" onmousedown="try{n_trackEvent('mandb_resume', 'login_paid', 'send_mail', 'open');}catch(e){}"><img src="//www.saraminimage.co.kr/resume/2011_new/btn_mailsend.gif" style="cursor:pointer" onclick="" alt="메일발송"></a>
                          </span>
            <span id="sms_btn" style="display:none">
                <a id="send_sms_link" href="javascript:checkSendingSMS('5001590')">
                    <img src="//www.saraminimage.co.kr/resume/2011_new/btn_smssend.gif" style="cursor:pointer" alt="문자발송"></a>
            </span>
                    </div>  -->
        <div class="sec-btn-left h-subtext" style="padding-top:2px;">
        	<span id="mandb_service_text" style="display:none;font-size:8pt;"></span>
        </div>
        <!--  
        <div class="sec-btn-right h-subtext" style="font-family:굴림,sans-serif;padding-top:2px;text-align:right">
                        최근수정일 : 2016년 03월 17일 (목)               
        </div> -->
    </div>
</div>            <!-- //header (top icon & description) -->
            
            <!-- 저장된 순서대로 항목별 렌더 -->
            <!-- 이력서 제목 -->
<div id="resume_title_view">
    <a name="title_view_anchor"></a>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody><tr><td class="res-title-view-new " valign="middle"> ${dto.resome_title} </td></tr>
    </tbody></table>
    
</div>
<!-- //이력서 제목 -->

<!-- 보유기술/희망연봉 -->
<div id="resume_apply_dept_view">
    <div class="item-header">
            </div>
    <table class="tbl-view" border="0" cellspacing="0" summary="보유기술/희망연봉" width="100%">
        <colgroup>
        <col width="118">
        <col width="320">
        <col width="70">
        <col>
        </colgroup>
        <tbody><tr>
            <th>보유기술</th>
            <td><label> ${dto.skill} </label></td>
            <th>희망연봉</th> 
            <td> ${dto.want_salary}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(단위 : 만원)</td>
        </tr>
    </tbody></table>
</div>
<!-- //지원분야/희망연봉 -->
<div id="basic_view" class="divide-view-item" style="">
    <a name="basic_view_anchor"></a>
        <div class="item-header res-item" style="text-align:left">
        <h3><span class="item-title">기본정보</span></h3>
            </div>
        <div class="item-contents">
        <div id="basic_profile" class="mb10">
            <table class="tbl-view" border="0" cellspacing="0" summary="기본정보" width="100%">
                <colgroup>
                <col width="118">
                <col width="70">
                <col width="250">
                <col width="70">
                <col>
                </colgroup>
                <tbody><tr>
                    <td rowspan="5" valign="middle" class="res-photo" style="text-align:center">
                    <!-- 사진 불러오는 곳  -->
                    <img src='${dto.photo}' border="0">
                   </td>
                    <th>이름</th>
                    <td>
                    	${dto.kor_name} 
                     <span class="res-cut">  </span> &nbsp;(${dto.eng_name})
                                                 
                    </td>
                    <th>생년월일</th>
                    <td>${dto.birth}<span class="res-cut"></span> </td>
                </tr>
                                <tr>
                    <th>주소</th>
                    <td colspan="3">
                    <c:forEach var="address" items="${fn:split(dto.address,'/')}">
                     	${address} 
                     </c:forEach>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td colspan="3">
                    	<c:if test='${dto.tel != null && dto.tel != "" }'>										
							<c:set var="e" value='${fnc:split( dto.tel, "-" )}'/>	
<%-- 						<input class="input" style="width:100px; border:none" name="tel1" maxlength="25" value="${e[0]}"> - 
							<input class="input" style="width:100px; border:none" name="tel2" maxlength="25" value="${e[1]}"> - 
							<input class="input" style="width:100px; border:none" name="tel3" maxlength="25" value="${e[2]}"> --%>
							${e[0]} - ${e[1]} - ${e[2]}
						</c:if> 
                     </td>
                 </tr><tr>
                    <th>병역사항</th>
                    <td colspan="3">
                        <span id="cell_area">
                         	<c:if test='${dto.army != null && dto.army != "" }'>										
								<c:set var="e" value='${fnc:split( dto.army, "/" )}'/>	
								${e[0]}   
           						 &nbsp;&nbsp;/&nbsp;&nbsp; 복무기간 :  ${e[1]} &nbsp;&nbsp; - &nbsp;&nbsp; ${e[2]}  <br>
									${e[3]}&nbsp;&nbsp; /&nbsp;&nbsp; ${e[4]}&nbsp;&nbsp; /&nbsp;&nbsp;${e[5]}&nbsp;&nbsp; 
									/&nbsp;&nbsp; ${e[6]}
								
							</c:if> 
                       </span>
                    </td>
                </tr>
                                <tr>
                    <th>이메일</th>
                    <td colspan="3">
                     	${dto.email} 
                    </td>
                                    </tr>
            </tbody></table>
        </div>
        <div id="basic-option" class="mb10">
                    </div>
            </div>
    </div><div id="school_view" class="divide-view-item">
    <a name="school_view_anchor"></a>
    <div class="item-header res-item">
        <h3>
            <span class="item-title">학력사항</span> 
            <span class="res-cut"> | </span> 
            <!--  
            <span class="title-person">최종학력 - <b>대학교(2,3년) 졸업예정</b></span>
            -->
        </h3>
            </div>
    <div class="item-contents">
        <div id="basic_school_view" class="mb10">
            <!-- 초등학교, 중학교, 고입, 중입 검정고시 -->
                        <table class="tbl-view" border="0" cellspacing="0" summary="학력사항" width="100%">
                <colgroup>
                <col width="118">
                <col width="70">
                <col width="230">
                <col width="150">
                <col>
                </colgroup>
                <tbody><tr>
                    <th height="35">재학기간</th>
                    <!--  
                    <th>구분</th>  -->
                    <th>학교명</th>
                    <th>전공</th>
                    <th>학점</th>
                </tr>   
                       <tr>
                        
                        <td> ${sc_dto.school_start_date_high} - 
                       
                        ${sc_dto.school_last_date_high} &nbsp;&nbsp;&nbsp;&nbsp;
                       
                        	 ${sc_dto.school_college_high}
         				 	 
         				</td> 
         				 
         		 		<!--  
                        <td class="center-td">
                        		구분 dto 부르기 (졸업/편입 등)
                        </td> -->
                        
                        <!-- 학교명 -->
                        <td>
                        
                        ${sc_dto.school_name_high} &nbsp;&nbsp;&nbsp;/ &nbsp;&nbsp;&nbsp; 
                        ${sc_dto.highschool_kind}
                     	
                       </td>
                       
                      	 <!-- 전공 -->
                        <td style="">
                        
                        ${sc_dto.school_major}
                       
                         </td>
                        <td class="center-td">
                       		-
                        </td>  
                    </tr>
                        <tr>
                        <!-- 대학교 재학기간 -->                                                             <tr>
                        <td>  
                        ${sc_dto.school_start_date_college} &nbsp;&nbsp; / &nbsp;&nbsp;
						${sc_dto.school_last_date_college} &nbsp;&nbsp; ~ &nbsp;&nbsp;
						${sc_dto.school_college1} &nbsp;&nbsp; / &nbsp;&nbsp;
						${sc_dto.school_college2}
                         </td>
                         
                         <!-- 
                        <td class="center-td">
                        		구분 dto 부르기 
                        </td> -->
                           
                        <!-- 대학교명 -->
                        <td>
                       
                        		${sc_dto.school_name_college} 
                      
                        </td>   
                        
                        <!-- 전공 -->
                        <td style="">   
                        
                        	    ${sc_dto.school_major} 
                       	
                        </td>
                        
                        <!-- 학점 --> 
                        <td class="center-td">
              			 <c:set var="e" value='${fnc:split( sc_dto.school_rank, "/" )}'/>
              			 ${e[0]} &nbsp;&nbsp; / &nbsp;&nbsp; ${e[1]} 
                       </td>
                    </tr>
              </tbody>
            </table>
                        <!-- //고등학교, 대학교 -->
        </div>
        <!-- 직업전문학교/학원 -->
                <!-- //직업전문학교/학원 -->
    </div>
</div><div id="license_view" class="divide-view-item">
    <a name="license_view_anchor"></a>
    <div class="item-header res-item">
        <h3><span class="item-title">자격증/면허증</span></h3>
            </div> 
    <div class="item-contents">
        <table class="tbl-view" border="0" cellspacing="0" summary="자격증/면허증" width="100%">
            <colgroup>
            <col width="213">
            <col width="197">
            <col width="105">
            <col>
            </colgroup>
            <tbody><tr>
                <th height="35">자격증/면허증</th>
                <th>취득일</th>
                <th>발행처</th>
                <!--  
                <th></th> -->
            </tr>
                <tr>
                <!--  -->
              
                <!--  
                <td class="center-td">합불 dto </td> -->   
                
                <c:if test='${dto.license != null && dto.license != "" }'>	
      			<c:forTokens var="e" items='${dto.license}' delims="/">
      				<c:forTokens var="k" items='${e}' delims="-">
      				
      				 <td class="center-td" style="text-align:center" > 
      				 
      				  ${k}
      				 
      					</td>
      					
      				</c:forTokens>		
      				  <br>
      			</c:forTokens>

        	 </c:if>
            </tr>
                    </tbody></table>
    </div> 
</div>
<div id="oa_ability_view" class="divide-view-item">
    <a name="oa_ability_view_anchor"></a>
    <h3><span class="item-title">포트폴리오</span></h3>
    <td class="center-td">
    <!-- ▼ 이곳에 파일 경로 나타나게 하고 다운받게 해야함 -->
     
    <!-- ▲  --> 
    </td>
    <!-- 능력 폼  -->
           <!-- 
    <div class="item-header res-item">
        <h3><span class="item-title">OA능력</span></h3>
            </div>
           
    <div class="item-contents">
        <table class="tbl-view" border="0" cellspacing="0" summary="OA능력" width="100%">
            <colgroup>
            <col width="161">
            <col width="161">
            <col width="161">
            <col>
            </colgroup> 
            <tbody><tr>
                <th height="35">문서작성<br><span class="h-subtext">(한글/MS-Word)</span></th>
                <th>스프레드시트<br><span class="h-subtext">(Excel)</span></th>
                <th>프리젠테이션<br><span class="h-subtext">(PowerPoint)</span></th>
                <th>인터넷<br><span class="h-subtext">(정보검색/outlook)</span></th>
            </tr>
            <tr>
                <td class="center-td">
                    기본 문서작성 가능                                    </td>
                <td class="center-td">기본 sheet작성 가능</td>
                <td class="center-td">기본 ppt작성 가능</td>
                <td class="center-td">기본 검색/활용 가능</td>
            </tr>
        </tbody></table>
    </div>  -->
</div>
<!-- 교육이수내역 폼  -->
<!--  
<div id="education_view" class="divide-view-item">
    <a name="education_view_anchor"></a>
    <div class="item-header res-item">
        <h3><span class="item-title">교육이수내역</span></h3>
            </div>
    <div class="item-contents">
                            <div class="mb10">
                <table class="tbl-view" border="0" cellspacing="0" summary="교육이수내역" width="100%">
                    <colgroup>
                    <col width="118">
                    <col width="95">
                    <col>
                    </colgroup>
                                        <tbody><tr>
                        <th width="118" height="35">교육기간</th>
                        <th colspan="2">상세내용</th>
                    </tr>
                                                            <tr>
                        <td width="118" rowspan="2" style="vertical-align:top;">
                            2014.05 ~ 2014.11<br>(7개월)                        </td>
                        <th width="95">교육명</th>
                        <td>취업아카데미</td>
                    </tr>
                    <tr>
                        <th width="95">교육기관</th>
                        <td>노동부 주관</td>
                    </tr>
                                    </tbody></table>
            </div>
                        </div>
</div> -->

<div id="standard_introduction_view" class="divide-view-item" style="page-break-before: always;">
    <div class="item-header res-item">
        <h3><span class="item-title">자기소개서</span></h3>
    </div>
    <div class="item-contents">
               <table class="tbl-view" border="0" cellspacing="0" summary="자기소개서" width="100%">
               <tbody>
               <c:forEach var="intr_dto" items="${result_introduce}">
	   					<tr>
	      					<th height="35"><b>${intr_dto.intro_title}</b></th>
	      				</tr>
	      				<tr>
	         		 			<td class="career break-word" valign="top" height="100%">
	         		 			<span id="introduce_contents"> 
								${intr_dto.intro_contents}
								</span>
	         					</td>      
	   					</tr>
					</c:forEach>                                             
 
            	</tbody>
            </table>
            </div>
	</div> 
            <!-- //저장된 순서대로 항목별 렌더 -->
            
            <!-- footer -->
            <div id="resume_footer">
                <div class="sign">
                    위의 모든 내용은 사실과 다름없음을 확인합니다.<br> 
                    작성일 :<b> ${dto.reg_date} </b> 
                     / 작성자 : <b> ${dto.email} </b></div>
            </div>        
            <!-- //footer -->
              
</div>