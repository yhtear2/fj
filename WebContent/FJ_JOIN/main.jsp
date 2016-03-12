<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/defaultSetting.jsp" %>
<%@ include file="setting.jsp" %>
<link href="${join}join.css" rel="stylesheet" type="text/css">
<script src="${join}script.js"></script>
<script type="text/javascript">
	/*
	function auto() {
		if( mainform.autologin.value == 0) {
			mainform.autologin.value = 1;
		} else {
			mainform.autologin.value = 0;
		}
	}*/
</script>

<body id="join" onload="mainfocus()">
	<c:if test="${sessionScope.memId == null}">
      <form name="mainform" method="post" action="joinLoginPro.do" 
         onsubmit="return maincheck()">
         
         <h2> ${page_login}</h2>
         <table class="table table-bordered">
            <tr>
               <th> ${str_email} </th>
               <td>
                  <input class="form-control" type="text" name="email" maxlength="30">
               </td>                  
            </tr>
            <tr>
               <th> ${str_passwd} </th>
               <td>
                  <input class="form-control" type="password" name="passwd" maxlength="20">
               </td> 
            </tr>
            <tr>
               <td class="table-button active" colspan="2">
               	  <input class="autologin" type="checkbox" name="autologin" value="0">자동로그인&nbsp;&nbsp;
                  <input class="btn btn-default" type="submit" value="${btn_login}"
                  style="font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3;"
                  >
                  <input class="btn btn-default" type="reset" value="${btn_cancel}"
                  style="font-style:'돋움'; font-size:13px; border:#0059b3 solid 1px; color:#0059b3;" 
                  >
                  <input class="btn btn-default" type="button" value="${btn_input_member}"
                     onclick="window.location='joinInputForm.do'"
                  style="font-style:'돋움'; font-size:13px; border:#0059b3 solid 1px; color:#0059b3;"   
                  > 
               </td>
            </tr>
         </table>
    	</form>
   	</c:if>  
	<c:if test="${sessionScope.memId != null}">
		<form>
			<h2> 회원정보 수정 </h2>
		  	<table class="table table-bordered">
		      <tr>
		         <td align="center">
		            <span style="color:#0059b3; font-size:20px;">${sessionScope.name}</span>${msg_login}
		         </td>
		      </tr>
		      <tr class="active"> 
		         <th>
		            <input class="btn btn-default" type="button" value="${btn_modify_member}" onclick="window.location='joinModifyForm.do'"
		            style="font-style:'굵게'; font-size:13px; color:white; background-color:#0059b3;">
		            <input class="btn btn-default" type="button" value="${btn_delete_member}" onclick="window.location='joinDeleteForm.do'"
		            style="font-style:'돋움'; font-size:13px; color:#ff5d5d; background-color:#f8f8f8; border: 1px solid #ff5d5d;">
		         </th>
		      </tr>    
		   </table>
		</form>      
	</c:if>
</body>






