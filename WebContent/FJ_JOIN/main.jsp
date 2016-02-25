<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/defaultSetting.jsp" %>
<%@ include file="setting.jsp" %>
<link href="${join}join.css" rel="stylesheet" type="text/css">
<script src="${join}script.js"></script>

<h2> ${page_login} </h2>

<body id="join" onload="mainfocus()">
	<c:if test="${sessionScope.memId == null}">
      <form name="mainform" method="post" action="joinLoginPro.do" 
         onsubmit="return maincheck()">
         <table>
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
               <th colspan="2">
                  <input class="btn btn-default" type="submit" value="${btn_login}">
                  <input class="btn btn-default" type="reset" value="${btn_cancel}">
                  <input class="btn btn-default" type="button" value="${btn_input_member}"
                     onclick="window.location='joinInputForm.do'">
               </th>
            </tr>
         </table>
    	</form>
   	</c:if>  
	<c:if test="${sessionScope.memId != null}">
	  	<table>
	      <tr>
	         <td align="center">
	            <span>${sessionScope.memId}</span>${msg_login} ${sessionScope.member_flag}
	         </td>
	      </tr>
	      <tr>
	         <th>
	            <input class="btn btn-default" type="button" value="${btn_logout}" onclick="window.location='joinLogout.do'">
	            <input class="btn btn-default" type="button" value="${btn_modify_member}" onclick="window.location='joinModifyForm.do'">
	            <input class="btn btn-default" type="button" value="${btn_delete_member}" onclick="window.location='joinDeleteForm.do'">
	         </th>
	      </tr>    
	   </table>      
	</c:if>
</body>
  







