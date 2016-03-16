<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<script type="text/javascript">
function Result()
{
var chk_Value = "";
if (document.getElementById("java").checked) {chk_Value += document.getElementById("java").value + "/"}
if (document.getElementById("jsp").checked) {chk_Value += document.getElementById("jsp").value + "/"}
if (document.getElementById("c").checked) {chk_Value += document.getElementById("c").value + "/"}
if (document.getElementById("c++").checked) {chk_Value += document.getElementById("c++").value + "/"}
if (document.getElementById("c#").checked) {chk_Value += document.getElementById("c#").value + "/"}
if (document.getElementById("asp").checked) {chk_Value += document.getElementById("asp").value + "/"}
if (document.getElementById("php").checked) {chk_Value += document.getElementById("php").value + "/"}
if (document.getElementById("javascript").checked) {chk_Value += document.getElementById("javascript").value + "/"}
if (document.getElementById("spring").checked) {chk_Value += document.getElementById("spring").value + "/"}
if (document.getElementById("ajax").checked) {chk_Value += document.getElementById("ajax").value + "/"}
if (document.getElementById("visualbasic").checked) {chk_Value += document.getElementById("visualbasic").value + "/"}
if (document.getElementById("python").checked) {chk_Value += document.getElementById("python").value + "/"}
if (document.getElementById("struts").checked) {chk_Value += document.getElementById("struts").value + "/"}
if (document.getElementById("oracle").checked) {chk_Value += document.getElementById("oracle").value + "/"}
if (document.getElementById("mysql").checked) {chk_Value += document.getElementById("mysql").value + "/"}
if (document.getElementById("mariadb").checked) {chk_Value += document.getElementById("mariadb").value + "/"}


var str = "";
str += chk_Value.substring(0, chk_Value.length-1) + "\n";
document.getElementById("skill").value = str;
}
</script>
<div style="margin: 10px 0px 0px 30px;">
없는 기술은 마지막에 / 입력 후  직접 입력하시기 바랍니다.<br><br><br>

<input type="checkbox" id="java" name="chk_Type" value="java" onclick="Result();">JAVA
<input type="checkbox" id="jsp" name="chk_Type" value="jsp" onclick="Result();">JSP
<input type="checkbox" id="c" name="chk_Type" value="c" onclick="Result();">C언어 
<input type="checkbox" id="c++" name="chk_Type" value="c++" onclick="Result();">C++ <br>
<input type="checkbox" id="c#" name="chk_Type" value="c#" onclick="Result();">C#
<input type="checkbox" id="asp" name="chk_Type" value="asp" onclick="Result();">ASP
<input type="checkbox" id="php" name="chk_Type" value="php" onclick="Result();">PHP
<input type="checkbox" id="javascript" name="chk_Type" value="javascript" onclick="Result();">JAVASCRIPT <br>
<input type="checkbox" id="spring" name="chk_Type" value="spring" onclick="Result();">SPRING
<input type="checkbox" id="ajax" name="chk_Type" value="ajax" onclick="Result();">AJAX
<input type="checkbox" id="visualbasic" name="chk_Type" value="visualbasic" onclick="Result();">VISUALBASIC <br>
<input type="checkbox" id="python" name="chk_Type" value="python" onclick="Result();">파이썬
<input type="checkbox" id="struts" name="chk_Type" value="struts" onclick="Result();">STRUTS
<input type="checkbox" id="oracle" name="chk_Type" value="oracle" onclick="Result();">ORACLE
<input type="checkbox" id="mysql" name="chk_Type" value="mysql" onclick="Result();">MySql
<input type="checkbox" id="mariadb" name="chk_Type" value="mariadb" onclick="Result();">MariaDB <br><br><br>

<input type="text" name="skill" id="skill" style="width:340px">
<input  class="inputbutton"  type="button" value="추가" onclick="skill_result()">
</div>
