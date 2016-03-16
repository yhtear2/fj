<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/defaultSetting.jsp"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 폼 세팅구간 (지우지 마세요) -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="noindex,nofollow">


<link href="//www.saraminimage.co.kr/css/resume-20141031.css" rel="stylesheet" type="text/css" media="screen, print">

<style type="text/css">
	
	.res-title-view-new-hs {
	    background-color: #f1f7ff;
	    color: #455a77;
	    font-size: 14px;
	    font-weight: bold;
	    height: 38px;
	    letter-spacing: -1px;
	    text-align: center;
	    border: solid 1px #b3c8d7;
    }
    .tbl-view th {
	    padding: 4px 0 0;
	    border: 1px solid #b7cbd9;
	    background: #f2f7ff;
	    color: #4f637d;
	    font-weight: bold;
	    /* text-align: center; */
	    letter-spacing: -1px;
	}
	#resume {
	    color: #666666;
	    font-family: "gulim";
	    font-size: 9pt;
	}
</style>
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
        <tbody><tr><td class="res-title-view-new-hs" valign="middle"> ${dto.resome_title} </td></tr>
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
            <td style="text-align:center; overflow:auto;"><label>${dto.skill}</label></td>
            <th>희망연봉</th> 
            <td style="text-align:center;"> ${dto.want_salary}&nbsp;만원</td>
        </tr>
    </tbody></table>
</div>
<!-- //지원분야/희망연봉 -->
<div id="basic_view" class="divide-view-item" style="">
    <a name="basic_view_anchor"></a>
        <div class="item-header res-item" style="text-align:left">
        <h3><span class="item-title">기본정보</span></h3>
        <span class="res-cut"> | </span>
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
                    <img src='${dto.photo}' border="0" width="108" height="190">
                   </td>
                    <th>이름</th>
                    <td style="text-align:center;">
                    	${dto.kor_name} 
                     <span class="res-cut">  </span> &nbsp;(${dto.eng_name})
                                                 
                    </td>
                    <th>생년월일</th>
                    <td style="text-align:center;">${dto.birth}<span class="res-cut"></span> </td>
                </tr>
                                <tr>
                    <th>주소</th>
                    <td colspan="3" style="text-align:center;">
                    <c:forEach var="address" items="${fn:split(dto.address,'/')}">
                     	${address} 
                     </c:forEach>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td colspan="3" style="text-align:center;">
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
                    <td colspan="3" style="text-align:center;">
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
                    <td colspan="3" style="text-align:center;">
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
                        <table class="tbl-view" border="0" cellspacing="0" summary="학력사항" width="100%" style="text-align:center">
                <colgroup>
                <col width="170">
                <col width="115">
                <col width="145">
                <col width="115">
                <col width="100">
                <col>
                </colgroup>
                <tbody>
                
                <tr>
                    <th style="height: 35px;">재학기간</th>
                    <!--  
                    <th>구분</th>  -->
                    <th>학교명</th>
                    <th>전공</th>
                    <th>학점</th>
                    <th>구분</th>
                </tr>   
                <c:forEach var="sc_dto" items="${result}" end="0">
                	<tr>
                        <td style="text-align:center;">
         					${sc_dto.school_start_date_high} ~ ${sc_dto.school_last_date_high}
         				</td>
						<td style="text-align:center;">         				
         					${sc_dto.school_name_high}
         				</td>
         				<td style="text-align:center;">
         					${sc_dto.highschool_kind}
         				</td>
         				<td style="text-align:center;">
         					-
         				</td>
         				<td style="text-align:center;">
         					${sc_dto.school_college_high}
         				</td>
         			</tr> 
         		</c:forEach>
         		<c:forEach var="sc_dto" items="${result}" begin="1">
         			<c:if test='${sc_dto.school_name_high != null && sc_dto.school_name_high != "" }'>
                	<tr>
                        <td style="text-align:center;">
         				${sc_dto.school_start_date_college} ~ ${sc_dto.school_last_date_college} 
						
         				</td>
						<td style="text-align:center;">         				
         					${sc_dto.school_name_college} 
         				</td>
         				<td style="text-align:center;">
         					${sc_dto.school_major} 
         				</td>
         				<td style="text-align:center;">
         					<c:set var="e" value='${fnc:split( sc_dto.school_rank, "/" )}'/>
              				 ${e[0]} / ${e[1]} 
         				</td>
         				<c:if test="${sc_dto.school_college1 != null}">
         				<td style="text-align:center;">
         					${sc_dto.school_college1} 
         				</td>
         				</c:if>
         				<c:if test="${sc_dto.school_college1 == null}">
         				<td style="text-align:center;">
         					${sc_dto.school_college2}
         				</td>
         				</c:if>
         			</tr> 
         		   </c:if>
         		</c:forEach>
              </tbody>
              
            </table>
                       
        </div>
        
    </div>
</div><div id="license_view" class="divide-view-item">
    <a name="license_view_anchor"></a>
    <div class="item-header res-item">
        <h3><span class="item-title">자격증/면허증</span></h3>
        <span class="res-cut"> | </span> 
            </div> 
    <div class="item-contents">
        <table class="tbl-view" border="0" cellspacing="0" summary="자격증/면허증" width="100%">
            <colgroup>
            <col width="270">
            <col width="192">
            <col width="185">
            <col>
            </colgroup>
            <tbody>
            <tr>
                <th height="35">자격증/면허증</th>
                <th>취득일</th>
                <th>발행처</th>
                <!--  
                <th></th> -->
            </tr>
            <c:if test='${dto.license != null && dto.license != "" }'>
           		<c:forEach var="lincenses" items="${fn:split(dto.license,'/')}">
           			<tr>
           			<c:forEach var="lincense" items="${fn:split(lincenses,'#')}">
           				<td style="text-align:center;">
           					${lincense}
           				</td>
           			</c:forEach>
           			</tr>
           		</c:forEach>
        	 </c:if>
            
                    </tbody></table>
    </div> 
</div>

<!-- 
<div id="oa_ability_view" class="divide-view-item">
    <a name="oa_ability_view_anchor"></a>
    <h3><span class="item-title">포트폴리오</span></h3>
    <td class="center-td"> -->
    <!-- ▼ 이곳에 파일 경로 나타나게 하고 다운받게 해야함 -->
     
    <!-- ▲  --> 
    <!--  
    </td>
 
</div> -->

<!-- 경력사항을 추가하였을 때 나타나는 곳  -->

<br>
<br>

<c:forEach var="car_dto" items="${result_career}">
	<c:if test='${car_dto.career_sort == "경력" }'>
		<div class="item-header res-item" style="text-align:left">
        <h3><span class="item-title">경력사항</span></h3>
        <span class="res-cut"> | </span> 
        
        </div> 
         <table class="tbl-view" border="0" cellspacing="0" summary="경력사항" width="100%" style="text-align:center">
          <colgroup>
                <col width="210">
                <col width="125">
                <col width="135">
                <col width="177">
                <col width="80">
                <col width="120">
                </colgroup> 
                
                 <tbody>
                
                <tr>
                    <th style="height: 35px;">근무기간</th>
                    <!--  
                    <th>구분</th>  -->
                    <th>회사명</th>
                    <th>부서명</th>
                    <th colspan="0">직급&직책</th>
             
                </tr>  
               
                
                <tr>
                	<td style="text-align:center;">
                		${car_dto.career_start_date} ~
						${car_dto.career_last_date}
						(${car_dto.career_kind})
                		
                	</td>
                	<td style="text-align:center;">
                		${car_dto.career_comp_name}
                	</td>
                	<td style="text-align:center;">
                		${car_dto.career_department} 
                	</td>
                	<td style="text-align:center;">
						${car_dto.career_position1} / ${car_dto.career_position2}
					</td>
					
                	
                </tr>
                
                
                <tr>
                	<th style="height: 35px;">퇴사사유</th>
                	<th colspan="2">담당업무(언어)</th>
                	<th colspan="0">급여/연봉</th>
                </tr> 
                
              
                <tr>
                	<td style="text-align:center;">
                		${car_dto.career_resign} 
                	</td>
                	<td style="text-align:center;" colspan="2">
                		${car_dto.career_work}
                	</td>
                	<td style="text-align:center;" colspan="0">
                		${car_dto.career_salary} &nbsp;만원
                	</td>
                	
                </tr>
                
                <tr>
                	<th colspan="4">수행내용</th>
                </tr>
                
                <tr>
                	<td style="text-align:center;" colspan="4">
                		${car_dto.career_content}
                	</td>  
                </tr>
                
                
        	</tbody>
         </table>
	</c:if>
</c:forEach>







<!-- 여기서 부터 자기소개서 부분  -->
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