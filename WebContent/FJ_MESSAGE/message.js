/**
 *	제목 변경
 */

// 메시지 유효성 확인 및 보내기
function sendMassge(){
	var title = $('input[name=title]').val();
	var content = $('textarea[name=content]').val();
	if( title == null || title == ""){
		alert("제목을 입력해 주세요");
		//subject.focus();
		return false;
	} else if( content == null || content == "" ){
		alert("내용을 입력해 주세요");
		//content.focus();
		return false;
	}
	$('input[name=recipient]').val( $('p').text() );
}