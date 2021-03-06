// compView 페이지에서 기업구분 라디오를 체크하기 위한 메소드
function comp_part_check(comp_part){
	//var check = $('input[name=comp_part]').val();
	alert($('input[name=comp_part]').val());
	if( comp_part = $('input[name=com_part]').val() ){
		alert(this.val());
		this.attr("checked", "checked");
	}	
}


/** 글쓰기 에디터 자바스크립트 부분  **/
$(document).ready(function() {
	$('#summernote').summernote({
		height : 400,  // 에디터 글쓰기 높이 
		lang: 'ko-KR', // default: 'en-US'
		toolbar: [
		           // [groupName, [list of button]]
		           ['fontsize', ['fontsize']],
		           ['style', ['bold', 'italic', 'underline', 'clear']],
		           ['font', ['strikethrough', 'superscript', 'subscript']],
		           ['color', ['color']],
		           ['para', ['ul', 'ol', 'paragraph']],
		           ['insert', ['hr', 'picture', 'link', 'video' ]]
		        ]	
	});
	$('.dropdown-toggle').dropdown();
	
	var content = $('input[name=content]').val();
	$('#summernote').summernote('code', content);
	
});


//recruitWriteForm에서 섬잇을 누르면 실행되는 메소드
function compInputFormcheck(){
	// 일단 예외처리는 안할래....귀.찮....;;
	
	// 콘텐츠 내용에 쓴거 넘기기 위해서 이렇게~
	$('input[name=content]').val( $('#summernote').summernote('code') );
}


/**  우편번호 사용하기 메소드  **/
function execDaumPostcode() {
    new daum.Postcode(
          {
             oncomplete : function(data) {

                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                if (data.userSelectedType === 'R') {
                   fullAddr = data.roadAddress;

                } else {
                   fullAddr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {

                   if (data.bname !== '') {
                      extraAddr += data.bname;
                   }

                   if (data.buildingName !== '') {
                      extraAddr += (extraAddr !== '' ? ', '
                            + data.buildingName : data.buildingName);
                   }

                   fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                         + ')' : '');
                }

                $('input[name=zipcode]').val( data.zonecode );
                $('input[name=address]').val( fullAddr );
                $('input[name=address]').focus();

             }
          }).open();
 }