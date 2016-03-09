/**
 *	제목 변경
 */
// 제목 변경 버트는 누르면 실행되는 메소드
var cnt = 0;
function sub_name_modify(count){	
	// id가 sub_name 이라는 div 사라지게함
	var sub_name = 'div[id=sub_name'+ count +']';
	$(sub_name).css("display", "none");
	// id가 sub_change 이라는 div 나타나게 함
	var sub_change = 'div[id=sub_change'+ count +']';
	$(sub_change).css("display", "block");
	// sub_name_ div에있는 텍스트 값 인풋폼에 등록
	var sub_change_name = 'input[name=sub_change_name'+ count +']';
	var sub_name_ = 'div[id=sub_name_'+ count +']'
	$( sub_change_name ).val( $( sub_name_ ).text() );	
}

// 확인 버튼을 누르면 실행되는 메소드
function sub_name_ok(count){
	var sub_name = 'div[id=sub_name'+ count +']';
	var sub_change = 'div[id=sub_change'+ count +']';
	var sub_change_name = 'input[name=sub_change_name'+ count +']';
	var sub_name_ = 'div[id=sub_name_'+ count +']'
	// div를 받아옴
	// innerHTML을 이용해 인풋폼에 있는 내용으로 변경
	$(sub_name_).text( $(sub_change_name ).val() );
	// 인풋폼 초기화
	$(sub_change_name).val("");
	// 위에설명 참고
	$(sub_name).css("display", "block");
	$(sub_change).css("display", "none");
}	
// 취소 버튼을 누르면 실행되는 메소드
function sub_name_cancel(count){
	var sub_name = 'div[id=sub_name'+ count +']';
	var sub_change = 'div[id=sub_change'+ count +']';
	//위에 설명 참고
	$(sub_name).css("display", "block");
	$(sub_change).css("display", "none");
}

/**
 * 	자기소개서 추가 삭제하기
 */
// 자기소개서 페이지 추가 메소드
function add_introduce(){
    var subject = ['자기소개서', '가족소개', '성장과정', '학창시절', '교외활동', '전공선택 이유와 적성', '성격의 장단점', '생활신조', '지원동기', '입사 후 포부', '자기소개서', '가족소개', '성장과정', '학창시절', '교외활동', '전공선택 이유와 적성', '성격의 장단점', '생활신조', '지원동기', '입사 후 포부'];
    var standardID = 'div[id=standardID'+ cnt +']'
    if( cnt < 10 ){
    	cnt++;
	    var html =	'<div style="margin-top:30px;"  id="standardID'+ cnt +'">'
	    		+ 	'<input type="hidden" name="sub_name_'+ cnt +'" value="">'
	    		+	'<div id="sub_name'+ cnt +'"  class="subject">'
	    		+	'<div id="sub_name_'+ cnt +'" class="subject" >'+ subject[cnt]+'</div>'
	    		+	'<div class="subject"><input type="button" value="변경" class="btn btn-default" name="modify" onclick="sub_name_modify('+cnt+')"></div>'
	    		+	'</div>'
	    		+	'<div id="sub_change'+ cnt +'" class="subject" style="display:none;">'
	    		+	'<input type="text" name="sub_change_name'+ cnt +'" style="background: #f2f7ff; border: 2px;" autofocus="autofocus" > '
	    		+	'<input type="button" value="확인" class="btn btn-default" onclick="sub_name_ok('+cnt+')">'
	    		+	'<input type="button" value="취소" class="btn btn-default" onclick="sub_name_cancel('+cnt+')">'
	    		+	'</div>'
	    		+	'<div> <textarea name="contents'+cnt+'" rows="13" cols="100%"></textarea> </div>'
	    		+	'<div>' 
	    		+	'<input type="button" value="추가" class="btn btn-default" onclick="add_introduce()">'
	    		+	'<input type="button" value="삭제" class="btn btn-default" onclick="del_introduce('+cnt+')">'
	    		+	'</div>'
	    		+	'</div>';
	    $(standardID).after(html);
    } else {
    	alert('작성 가능한 자소서항목은 최대 10개입니다.');
    }  
}

// 자기소개 페이지 삭제 메소드
function del_introduce(count){
	if ( cnt > 0 ) {
		var delDiv = 'div[id=standardID'+ count +']'
		if (confirm("삭제하시겠습니까?")) {
			$(delDiv).remove();
			cnt--;
		}
	} else {
		alert('한 개 이상의 자소서가 필요합니다.');
	}
}



// 섬잇 누르면 나오는것!!
function submitcheck(){
	$('input[name=cnt]').val(cnt);
	for(var i=0; i<cnt+1; i++){
		$('input[name=sub_name_'+ i +']').val( $('div[id=sub_name_'+ i +']').text());
	}
	
}