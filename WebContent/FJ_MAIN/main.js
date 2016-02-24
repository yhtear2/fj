/**
 * 메뉴가 움직이는 제이쿼리
 */
$(function(){
	// 처음 메인화면에서 클릭 했을때 보여지는 화면
	if( $('.m').val() == "main" ) {
		// 클릭하면 이벤트 발생
		$('.main_submanu').on('click',function() {
			var idx = $('.main_submanu').index($(this));
			if(	$('.menu_status').val() == 0) {
				$('.main_menu').stop().animate({'width':'50px'}, function(){
					$('.main_logo').stop().animate({'background-size':'50px'});
					$('.main_menu').stop().animate({'width':'50px'});
					$('.main_menu2').css({'z-index':'0'});
					$('.main_submanu').css({'text-align':'left'});
					$('.main_menu2').eq(idx).css({'z-index':'2'});
					$('.menu_status').val(1);
				});
			} else { 
				$('.main_menu').stop().animate({'width':'200px'}, function() {
					$('.main_menu2').css({'z-index':'0'});
					$('.main_submanu').animate({'text-align':'center'});
					$('.main_menu2').eq(idx).css({'z-index':'2'});
				}).animate({'width':'50px'});
			}
		});
	} else {
	// 이미 서브메뉴에 들어가 있을때 보여지는 화면
		var this_page = 0;
		if($('.m').val() == 'member') this_page = 0;
		if($('.m').val() == 'board') this_page = 1;
		$('.main_menu').css({'width':'50px'});
		$(".main_menu2").css({'z-index':'0'});
		$(".main_menu2").eq(this_page).css({'z-index':'2'});
		$('.main_submanu').on('click',function() {
			var idx = $('.main_submanu').index($(this));
			$('.main_menu').stop().animate({'width':'200px'},
				function() {
					$('.main_menu2').css({'z-index':'0'});
					$('.main_menu2').eq(idx).css({"z-index":"2"});
				}
			).animate({'width':'50px'});
			});
		}
	});



