
/** 글쓰기 에디터 자바스크립트 부분  **/
$(document).ready(function() {
	$('#summernote').summernote({
		height : 400,  // 에디터 글쓰기 높이 
	});
});

//글내용 적기위한 onsubmit 처리 

/*
	$('input[name=content]').val( $('#summernote').summernote('code') );
*/
