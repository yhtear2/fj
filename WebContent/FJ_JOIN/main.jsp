<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="setting.jsp" %>
<link href="${project}style.css" rel="stylesheet" type="text/css">
<script src="${project}script.js"></script>

<h2> ${page_main} </h2>

<c:if test="${sessionScope.memId == null}">
   <body onload="mainfocus()">
      <form name="mainform" method="post" action="joinLoginPro.do" 
         onsubmit="return maincheck()">
         <table>
            <tr>
               <th> ${str_email} </th>
               <td>
                  <input class="input" type="text" name="email" maxlength="30">
               </td>                  
            </tr>
            <tr>
               <th> ${str_passwd} </th>
               <td>
                  <input class="input" type="password" name="passwd" maxlength="20">
               </td>
            </tr>
            <tr>
               <th colspan="2">
                  <input class="inputbutton" type="submit" value="${btn_login}">
                  <input class="inputbutton" type="reset" value="${btn_cancel}">
                  <input class="inputbutton" type="button" value="${btn_input_member}"
                     onclick="window.location='joinInputForm.do'">
               </th>
            </tr>
         </table>
      </form>
   </body>
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
            <input class="inputbutton" type="button" value="${btn_logout}" onclick="window.location='joinLogout.do'">
            <input class="inputbutton" type="button" value="${btn_modify_member}" onclick="window.location='joinModifyForm.do'">
            <input class="inputbutton" type="button" value="${btn_delete_member}" onclick="window.location='joinDeleteForm.do'">
         </th>
      </tr>    
   </table>      
</c:if> 
  







