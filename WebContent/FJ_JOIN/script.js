/**
 * 회원 관리
 */

// <!--

var msg_id = "아이디를 입력하세요";
var msg_passwd = "비밀번호를 입력하세요";
var msg_repasswd = "비밀번호가 일치하지 않습니다";
var msg_name = "이름을 입력하세요";
var msg_jumin = "주민등록번호를 입력하세요";
var msg_tel = "전화번호를 입력하세요";	
var msg_email = "이메일 형식에 맞지 않습니다";
var msg_confirm = "중복확인을 해주세요";

var inputerror = "회원 가입에 실패했습니다.\n잠시 후 다시 시도하세요.";
var iderror = "입력하신 아이디가 없습니다.\n다시 확인하세요.";
var passwderror = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요.";
var deleteerror = "회원 탈퇴에 실패했습니다.\n잠시 후 다시 시도하세요.";
var modifyerror = "회원 정보 수정에 실패했습니다.\n잠시 후 다시 시도하세요.";

function erroralert( msg ) {
	alert( msg );
	history.back();
}

// 회원 정보 수정
function modifyfocus() {
	modifyform.passwd.focus();
}
function modifycheck() {
	if( ! modifyform.passwd.value ) {
		alert( msg_passwd );
		modifyform.passwd.focus();
		return false;
	} else if( modifyform.passwd.value != modifyform.repasswd.value ) {
		alert( msg_repasswd );
		modifyform.passwd.focus();
		return false;
	} else if( ( modifyform.email1.value && ! modifyform.email2.value )
			|| ( modifyform.email2.value && ! modifyform.email1.value ) ) {
		alert( msg_email );
		modifyform.email1.focus();
		return false;
	} else if( modifyform.tel1.value  
			|| modifyform.tel2.value 
			|| modifyform.tel3.value ) {
		if( modifyform.tel1.value.length < 3
			|| modifyform.tel2.value.length < 4
			|| modifyform.tel3.value.length < 4 ) {
			alert( msg_tel );
			modifyform.tel1.focus();
			return false;		
		}		
	} 	
}

// -->









