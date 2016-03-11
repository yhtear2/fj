
/** 글쓰기 에디터 자바스크립트 부분  **/
$(document).ready(function() {
	$('#summernote').summernote({
		height : 400,  // 에디터 글쓰기 높이 
		lang: 'ko-KR' // default: 'en-US'
	});
	$('.dropdown-toggle').dropdown();
	
	// 인풋에다가 담기
	var content = $('input[name=content]').val();
	$('#summernote').summernote('code', content);

	
});

// 스킬선택 창으로 넘어가는거
function conf_skill() {
    var url = "recruitskill.do";
    open(url, "confrimWindow",
          "menubar=no, statusbar=no, scrollbar=no, toolbar=no, width=450, height=300");
}


// 체크박스 선택 제안하는 메소드
/*
 * 인터넷에서 퍼옴 참고해서 사용!
 * http://kin.naver.com/qna/detail.nhn?d1id=1&dirId=1040202&docId=68536412
 */
function checkCheckbox1(frm,obj,num) {
	var str = obj.name;
	var len = frm.length;
	var chk = 0;
	for(i=0; i<len; i++) {
		if (frm[i].name == str && frm[i].checked == true) {
			chk++;
		}
		if (chk > num) {
			alert("한 개만 선택 하실 수 있습니다");
			obj.checked = false;
			break;
		}
	}
}


// recruitWriteForm에서 섬잇을 누르면 실행되는 메소드
function recruitwritecheck(){
	// 일단 예외처리는 안할래....귀.찮....;;
	
	// 콘텐츠 내용에 쓴거 넘기기 위해서 이렇게~
	$('input[name=content]').val( $('#summernote').summernote('code') );
}


// 스킬을 선택하면 부모창으로 넣어주는 메소드
function skill_result() {
	var skills = document.getElementById('skill').value;
	opener.document.recruitWriteForm.skill.value = skills;
	window.close();
	   
}


// 날자를 계산해서 리스트에 남은 날자만 뿌리기 위해서..
function dateCalculation (){
	var today = new Date();
	var dateString = $('input[name=end_date]').val();
	var dateArray = dateString.split("-");  
	var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
	var betweenDay = (today.getTime() - dateObj.getTime())/1000/60/60/24;
	var bwd = parseInt(betweenDay).toString().substring(1)
	if( bwd == 0 ){
		bwd = "D-day";
	} else if ( bwd < 0){
		bwd = "채용종료";
	}
	
	$('td[id=date1]').text( "D -" + bwd );
	
	
}


//메세지를 보내는 메소드
function wsSendMassge(){
	var msg =  $.cookie('msg');
	if ( msg != null && msg != ""){
		ws.send( msg );
		$.cookie('msg', '');
	}
}



/** ▼▼▼▼▼▼		여기는 수정 화면에 필요한 메소드들	▼▼▼▼▼▼**/
// 수정화면 들어오자마자 실행되는 메소드
$(document).ready(function() {
	
	// ▼▼▼▼ 근무지역 ▼▼▼▼ 
	var work_areas = $('input[name=work_areas]').val().split(',');
	var city_names = ['서울', '부산', '인천', '대구', '대전', '광주', '울산', '제주', '세종', '경기',
	                  '경북', '경남', '전북', '전남', '충북', '충남', '강원']
	for(var i=0; i<work_areas.length; i++){
		for(var j=0; j<city_names.length; j++){
			var a = $('input[value='+city_names[j]+']');
			if( work_areas[i] == city_names[j]){
				$(a).prop('checked', true);
			}
		}
	}
	// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
	
	
	// ▼▼▼▼ 근무형태 ▼▼▼▼ 
	var work_types = $('input[name=work_types]').val().split(',');
	var works = ['정규직', '계약직', '인턴직', '프리랜서', '해외취업']
	for(var i=0; i<work_types.length; i++){
		for(var j=0; j<works.length; j++){
			var a = $('input[value='+works[j]+']');
			if( work_types[i] == works[j]){
				$(a).prop('checked', true);
			}
		}
	}
	// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
	
	
	// ▼▼▼▼ 최소 연봉 ▼▼▼▼ 
	var min_salarys = $('input[name=min_salarys]').val() + "만원 이상";
	var m_salary = ['1400만원 이상', '1800만원 이상', '2000만원 이상', '2400만원 이상', '2800만원 이상',
	                '3200만원 이상', '3600만원 이상', '4000만원 이상', '5000만원 이상', '6000만원 이상',
	                '7000만원 이상', '8000만원 이상', '9000만원 이상']
	
	for(var i=0; i<m_salary.length; i++){
		var a = $('select[name=min_salary]').find('option').eq(i);
		if( min_salarys == m_salary[i]){
			$(a).prop('selected', true);
			
		}
	}
	// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

	// ▼▼▼▼ 최대 연봉 ▼▼▼▼ 
	var max_salarys = $('input[name=max_salarys]').val() + "만원 이상";
	for(var i=0; i<m_salary.length; i++){
		var a = $('select[name=max_salary]').find('option').eq(i);
		if( max_salarys == m_salary[i]){
			$(a).prop('selected', true);
			
		}
	}
	// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
	
	
	
});


