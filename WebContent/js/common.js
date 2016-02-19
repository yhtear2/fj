/* name 		: focusAlert(msg, obj)
 * description 	: 메세지 출력 후 특정 오브젝트에 포커스 부여
 * parameter 	: msg, obj
 * - msg 		: 출력할 메세지
 * - obj 		: 출력 후 포커스 할 오브젝트
 */
function focusAlert(msg, obj){
	alert(msg);
	obj.focus();
}

/* name 		: errorAlert(msg)
 * description 	: 메세지 출력 후 페이지 뒤로가기 
 * parameter 	: msg
 * - msg 		: 출력할 메세지
 */
function errorAlert(msg){
	alert(msg);
	history.back();
}
















