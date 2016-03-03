
/** 글쓰기 에디터 자바스크립트 부분  **/
$(document).ready(function() {
	$('#summernote').summernote({
		height : 400,  // 에디터 글쓰기 높이 
		toolbar: [
		          ['style', ['bold', 'italic', 'underline', 'clear']],
		          ['font', ['strikethrough', 'superscript', 'subscript']],
		          ['fontsize', ['fontsize']],
		          ['color', ['color']],
		          ['para', ['ul', 'ol', 'paragraph']],
		          ['height', ['height']],
		          ['Insert', ['table', 'hr', 'picture', 'link', 'video']]
		        ]
	});
});

// 스킬선택 창으로 넘어가는건데.. 아직 100%아님
// 자식창에서 부모창으로 데이터가 안넘어옴
function conf_skill() {
    var url = "confirm_skill.do";
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



