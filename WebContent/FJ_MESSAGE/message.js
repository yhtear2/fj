/**
 *	제목 변경
 */

// 메시지 유효성 확인 및 보내기
function sendMassge(){
	var title = $('input[name=title]').val();
	var content = $('textarea[name=content]').val();
	if( title == null || title == ""){
		alert("제목을 입력해 주세요");
		subject.focus();
		return false;
	} else if( content == null || content == "" ){
		alert("내용을 입력해 주세요");
		content.focus();
		return false;
	}
}

// 보낸 메시지 삭제할때 유효성검사(상대방이 읽었나 안읽었나)
function messageSendDelete(read_yn, message_num){
	if( read_yn == 1){
		if(confirm("상대방이 메세지를 확인하였습니다. \n그래도 삭제하시겠습니까??") ){
			window.location.href="messageDelete.do?message_num=" + message_num;
		}
	} else {
		if(confirm("상대방이 메세지를 확인하지 않았습니다. \n그래도 삭제하시겠습니까??") ){
			window.location.href="messageDelete.do?message_num=" + message_num;
		}
	}
}
