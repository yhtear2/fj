/**
 * 메뉴가 움직이는 제이쿼리
 */
$(function(){
	// 처음 메인화면에서 클릭 했을때 보여지는 화면
	if( $('.m').val() == "main" ) {
		// 클릭하면 이벤트 발생
		var idx = "";
		$('.main_submanu').on('click',function() {
			idx = $('.main_submanu').index($(this));
			if(	$('.menu_status').val() == 0) {
				$('.main_menu').stop().animate({'width':'50px'}, function(){
					$('.main_menu').stop().animate({'width':'50px'});
					$('.main_menu2').css({'z-index':'0'});
					$('.main_submanu').css({'text-align':'left'});
					$('.main_menu2').eq(idx).css({'z-index':'2'});
					$('.menu_status').val(1);
				});
				$('.main_submanu').stop().animate({'padding-left':'15px'});
				//$('#logo').stop().animate({'width':'30px'}).fadeOut();
				$('#logo').css({'display':'none'});
				$('#logo_small').stop().fadeIn();
				$('.main_login').css({'display':'none'});
				$('.main_singup').css({'display':'none'});
				$('.main_signsub').stop().fadeIn();
				$('.logout').stop().animate({'left':'22px'});
				$('.messageicon').stop().animate({'left':'22px'});
				setInterval(function() {
					$('.main_submanu').eq(0).css({'background-color':'white'});
					setInterval(function() {
						$('.main_submanu').eq(0).css({'background-color':'#0059B3'});
					}, 100)
				},1000);
			} else if($('.menu_status').val() == 0 && idx == 4){
				window.location=window.location='https://github.com/yhtear2/fj.git';
			} else { 
				$('.main_menu').stop().animate({'width':'200px'}, function() {
					$('.main_menu2').css({'z-index':'0'});
					$('.main_submanu').animate({'text-align':'center'});
					$('.main_menu2').eq(idx).css({'z-index':'2'});
				}).animate({'width':'50px'});
			}
		});
		/*.on('click',function(){
			window.location.href='messageList.do';
		});*/
	} else {
	// 이미 서브메뉴에 들어가 있을때 보여지는 화면
		var this_page = 0;
		if($('.m').val() == 'message') this_page = 0;
		if($('.m').val() == 'member') this_page = 1;
		if($('.m').val() == 'comp') this_page = 1;
		if($('.m').val() == 'resome') this_page = 1;
		if($('.m').val() == 'board') this_page = 2;
		if($('.m').val() == 'recruit') this_page = 3;
		$('.main_menu').css({'width':'50px'});
		$('#logo').css({'display':'none'});
		$('#logo_small').css({'display':'inline'});
		$('.main_login').css({'display':'none'});
		$('.main_singup').css({'display':'none'});
		$('.main_signsub').css({'display':'inline'})
		$('#logo').stop().css({'width':'30px'});
		$('.logout').css({'left':'22px'});
		$('.messageicon').css({'left':'22px'});
		$('.main_submanu').css({'padding-left':'15px'});
		$(".main_menu2").css({'z-index':'0'});
		$(".main_menu2").eq(this_page).css({'z-index':'2'});
		$('.main_submanu').on('click',function() {
			var idx = $('.main_submanu').index($(this));
			if( idx == 4) {
				window.location='https://github.com/yhtear2/fj.git';
			}
			$('.main_menu').stop().animate({'width':'200px'},
				function() {
					$('.main_menu2').css({'z-index':'0'});
					$('.main_menu2').eq(idx).css({"z-index":"2"});
				}
			).animate({'width':'50px'});
		});
	}
	
	// 웹소켓 구현부
	var memId = $('input[id=memId]').val();
	if( memId != null && memId != ""){
		if(! window.WebSocket ){
			alert("이 브라우저는 실시간 쪽지를 지원하지 않습니다.");
			return;
		} else{
			// 연결한 웹소켓의 주소 및 아이디
			ws = new WebSocket('ws://192.168.30.125:8080/fj/websocket/chat?memId='+memId);
			// 서버에 연결하는 메소드
			ws.onopen = function(){
			}
			// 메세지를 수신하면 연결되는 메소드
			ws.onmessage = function( evt ){
				alert( evt.data );
				function blink() {
					$('.main_submanu').eq(0).css({'background-color':'white'}).delay(80).css({'background-color':'#0059B3'});
				}
				setInterval(blink, 800);
				
			}
			// 서버가 종료될때 연결되는 메소드
			ws.onclose = function(){
			}
		}
	}
	
});


// 실시간 쪽지를 보내는 메소드
function wsSendMassge( emails, msg ){
	var msg = $.cookie('msg');
	if ( msg != null && msg != ""){
		var email =  $.cookie('emails').split(',');	//실시간 쪽지 받을 사람들의 이메일	","이걸로 구분
		if( email !== null && email != "" ){
			// 쪽지 구성 :  받는사람이메일 # 구분	// 1:채용공고, 2:공지사항, 3:일반쪽지;
			for (var i=0; i<email.length; i++){
				ws.send( email[i]+"#"+msg );
			}
			$.cookie('emails', '');
			$.cookie('msg', '');
		} else{
			ws.send( msg );
			$.cookie('msg', '');
		}

	}
}
