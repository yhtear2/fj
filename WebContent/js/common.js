/* name 		: focusAlert(msg, obj)
 * parameter 	: msg, obj
 * 	msg : 출력할 메세지
 * 	obj : 출력 후 포커스 할 오브젝트
 */
function focusAlert(msg, obj){
	alert(msg);
	obj.focus();
}

function errorAlert(msg){
	alert(msg);
	history.back();
}
















