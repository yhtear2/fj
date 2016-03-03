<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<%@ include file="setting.jsp"%>
<script src="/fj/jquery-1.12.0.js"></script>
<script src="/fj/FJ_USER/resome.js"></script>
<script src="/fj/jquery.cookie.js"></script>
<link href="${project}introduce.css" rel="stylesheet" type="text/css">
<script>
var int_cnt = 0;

function submitcheck() {
    var title = [];
    var titles = $('input[id=sub_name]');
    for (var i = 0; i < titles.length; i++) {
    	title[i] = titles.eq(i).val();
    }
    $('input[name=sub_name_send]').val(title);
    
    
    var cont = [];
    var conts = $('input[id=contents]');
    for (var i = 0; i < conts.length; i++) {
    	cont[i] = conts.eq(i).val();
    }
    $('input[name=contents_send]').val(cont);
    
}


</script>

<h2> 자기 소개서 </h2>

<!-- 자기소개서 입력 크기 잡아주기-->
<div id="introduce" class="introduce" onsubmit="submitcheck()">
    <input type="hidden" name="sub_name_send">
    <input type="hidden" name="contents_send">
    
	<!-- 스타일 시스 먹이기 -->
	<div class="standard" id="standardID0">
		<!-- 폼 이름 정해주기 -->
			<!-- 처음 보여지는 디폴트 값 -->
			<div id="sub_name"  style="display:block;">
				<div id="sub_name_" class="form-control" style="width:180px" >자기소개 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-default" value="변경" name="modify" onclick="sub_name_modify('0')"></div>
				<br>
			</div>	
			<!-- 변경을 누르면 나타나는 입력 폼 -->
			<div id="sub_change0" class="form-control" style="display:none;">
				<input type="text" class="form-control" name="sub_change_name0" autofocus="autofocus" 
						style="background: #f2f7ff; border: 2px; width:180px">
				<input class="btn btn-default" type="button" value="확인" onclick="sub_name_ok('0')">
				<input class="btn btn-default" type="button" value="취소" onclick="sub_name_cancel('0')">
			</div>
		<!-- 내용 입력하는 곳 -->
		<div> <textarea class="form-control" 
		name="contents'+int_cnt+'" rows="17" cols="100%"></textarea> </div>
		<div> 
			<input class="btn btn-default" type="button" value="추가" onclick="add_introduce()">
			<input class="btn btn-default" type="button" value="삭제" onclick="del_introduce('0')">
		</div>
	</div>
	<div id="introduces"><input class="btn btn-default" type="button" value="저장" onclick="window.location='introduce_Pro.do'"></div>
</div>


