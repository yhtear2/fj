
// 날자를 계산해서 리스트에 남은 날자만 뿌리기 위해서..
$(document).ready(function() {
	for( var i=0; i<6; i++){
		var today = new Date();
		var dateString = $('input[name=date1'+i+']').val();
		var dateA = dateString.substring(0, 10);
		var dateArray = dateA.split("-");
		var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
		var betweenDay = (today.getTime() - dateObj.getTime())/1000/60/60/24;
		var bwd = parseInt(betweenDay).toString();
		if( bwd != '0'){
			$('span[id=date1'+i+']').text(bwd+"일 전") ;
		} else{
			$('span[id=date1'+i+']').text("오늘") ;
		}
	}
	
	for( var i=0; i<6; i++){
		var today = new Date();
		var dateString = $('input[name=date2'+i+']').val();
		var dateA = dateString.substring(0, 10);
		var dateArray = dateA.split("-");
		var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
		var betweenDay = (today.getTime() - dateObj.getTime())/1000/60/60/24;
		var bwd = parseInt(betweenDay).toString();
		if( bwd != '0'){
			$('span[id=date2'+i+']').text(bwd+"일 전") ;
		} else{
			$('span[id=date2'+i+']').text("오늘") ;
		}
	}
	
});
