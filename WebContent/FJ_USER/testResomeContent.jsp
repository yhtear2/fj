<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 폼 세팅구간 (지우지 마세요) -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="noindex,nofollow">
<link href="//www.saraminimage.co.kr/css_new/sub_global.css" rel="stylesheet" type="text/css">
<link href="//www.saraminimage.co.kr/css/ui/reset-fonts.css" rel="stylesheet" type="text/css" media="screen, print">
<link href="//www.saraminimage.co.kr/css/resume-20141031.css" rel="stylesheet" type="text/css" media="screen, print">
<script type="text/javascript" src="//www.saraminimage.co.kr/js/libs/prototype-1.6.0.3.js"></script>
<script type="text/javascript" src="//www.saraminimage.co.kr/js/libs/pngHack.mini.js"></script>

<!-- div 시작점  -->
<div class="resume">
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
        <div class="sec-btn-right h-subtext" style="font-family:굴림,sans-serif;padding-top:2px;text-align:right">
                        최근수정일 : 2016년 03월 17일 (목)               
        </div>
    </div>
</div>            <!-- //header (top icon & description) -->
            
            <!-- 저장된 순서대로 항목별 렌더 -->
            <!-- 이력서 제목 -->
<div id="resume_title_view">
    <a name="title_view_anchor"></a>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tbody><tr><td class="res-title-view-new " valign="middle"> 이력서 제목 불러오기 </td></tr>
    </tbody></table>
    
</div>
<!-- //이력서 제목 -->

<!-- 지원분야/희망연봉 -->
<div id="resume_apply_dept_view">
    <div class="item-header">
            </div>
    <table class="tbl-view" border="0" cellspacing="0" summary="지원분야/희망연봉" width="100%">
        <colgroup>
        <col width="118">
        <col width="320">
        <col width="70">
        <col>
        </colgroup>
        <tbody><tr>
            <th>지원분야</th>
            <td><label> 지원분야 dto 부르기 </label></td>
            <th>희망연봉</th>
            <td> 연봉 dto 부르기 </td>
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
                    <img src="https://www.saraminimage.co.kr/recruit/talent/resume_no_photo.gif" border="0">
                   </td>
                    <th>이름</th>
                    <td>
                    	이름 dto 부르기 
                     <span class="res-cut">  </span> 이름영문 dto 부르기 
                                                 
                    </td>
                    <th>나이/성별</th>
                    <td>나이 dto 부르기<span class="res-cut">&nbsp;|&nbsp;</span> 성별 dto 부르기  </td>
                </tr>
                                <tr>
                    <th>주소</th>
                    <td colspan="3">
                     			주소 dto 부르기 
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td colspan="3">
                    	전화번호 dto 부르기 
                     </td>
                 </tr><tr>
                    <th>휴대폰</th>
                    <td colspan="3">
                        <span id="cell_area">
                         	휴대폰 번호 dto 부르기 
                       </span>
                    </td>
                </tr>
                                <tr>
                    <th>이메일</th>
                    <td colspan="3">
                     	이메일 dto 부르기 
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
            <span class="title-person">최종학력 - <b>대학교(2,3년) 졸업예정</b></span>
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
                    <th>구분</th>
                    <th>학교명</th>
                    <th>전공</th>
                    <th>학점</th>
                </tr>
                                                                                <tr>
                        <td> 재학기간 dto 부르기 </td>
                        <td class="center-td">
                        		구분 dto 부르기 (졸업/편입 등)
                        </td>
                        <td>
                            	학교명 dto 부르기 
                       </td>
                        <td style="">
                        		전공 dto 부르기 
                         </td>
                        <td class="center-td">-</td>
                    </tr>
                                                                                        <tr>
                        <td> 재학기간 dto 부르기 </td>
                        <td class="center-td">
                        		구분 dto 부르기 
                        </td>
                        <td>
                        		학교명 dto 부르기 
                        </td>
                        <td style="">
                        		전공 dto 부르기 
                        </td>
                        <td class="center-td"> 학점 dto </td>
                    </tr>
                                                                        </tbody></table>
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
                <th>발행처/발행기관</th>
                <th>합격구분</th>
                <th>취득일</th>
            </tr>
                        <tr>
                <td class="center-td">자격증 dto </td>
                <td class="center-td">발행기관 dto</td>
                <td class="center-td">합불 dto </td>
                <td class="center-td">취득일 dto </td>
            </tr>
                    </tbody></table>
    </div> 
</div><div id="oa_ability_view" class="divide-view-item">
    <a name="oa_ability_view_anchor"></a>
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
                                                                <tbody><tr>
                    <th height="35"><b>자기소개</b></th>
                </tr>
                <tr>
                    <td class="career break-word" valign="top" height="100%">
                        <span id="introduce_contents">
    				이곳이 자기소개서 적는곳 
               </span>
                                            </td>
                </tr>
                                                              

                                            </tbody></table>
            </div>
	</div> 
            <!-- //저장된 순서대로 항목별 렌더 -->
            
            <!-- footer -->
            <div id="resume_footer">
                <div class="sign">
                    위의 모든 내용은 사실과 다름없음을 확인합니다.<br> 
                    작성일 :<b> 작성 날짜 dto 부르기 </b>
                     / 작성자 : <b> 작성자 dto 부르기 </b></div>
            </div>        
            <!-- //footer -->
            
</div>