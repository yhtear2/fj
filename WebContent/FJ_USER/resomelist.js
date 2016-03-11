/**
 * 
 */


var msg_userwrite = "무단등록 방지를 위하여 이력서는 최대 8개까지 등록이 됩니다. 더이상 작성하실 수 없습니다."; 


function erroralert( msg ) {
	alert( msg );
	history.back();
}
  


function userwritecheck() {
	if( ! resome_list.user_history_id.id ) {
		alert( msg_userwrite );
		return false;
	}
} 
