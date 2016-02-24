// compView 페이지에서 기업구분 라디오를 체크하기 위한 메소드
function comp_part_check(comp_part){
	//var check = $('input[name=comp_part]').val();
	alert($('input[name=comp_part]').val());
	if( comp_part = $('input[name=com_part]').val() ){
		alert(this.val());
		this.attr("checked", "checked");
	}
	
}