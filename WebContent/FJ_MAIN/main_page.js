
// 날자를 계산해서 리스트에 남은 날자만 뿌리기 위해서..
$(document).ready(function() {
	var today = new Date();
	var dateString = $('input[name=end_date]').val();
	var dateArray = dateString.split("-");  
	var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
	var betweenDay = (today.getTime() - dateObj.getTime())/1000/60/60/24;
	var bwd = parseInt(betweenDay).toString().substring(1)
	if( bwd == 0 ){
		bwd = "day";
	} else if ( bwd < 0){
		bwd = "채용종료";
	}
	
	$('td[id=date1]').text( "D -" + bwd );
	
	
});
