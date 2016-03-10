<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<%@ include file="/defaultSetting.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>jQuery 테스트 페이지</title>
<style type="text/css">
 div#displayArea{
  width : 200px;
  height : 200px;
  border : 5px double #6699FF;
  }
</style>
<script src ="../js/jquery-1.11.0.min.js"></script>
<script>
 $(document).ready(function(){
  $("button").click(function(){
   $("#displayArea").html("<img src='ansi_main2s.png' border='0' /> ");
  });
 });
 
 
</script>
</head>
<body>
 <div id="displayArea">test</div>
 <button>표시</button>
</body>
</html>



