/**
 * 게시판
 */


var msg_subject = "제목을 입력하세요";
var msg_content = "내용을 입력하세요";
var msg_category = "카테고리를 선택하세요";

var writerror = "글쓰기에 실패하였습니다\n잠시 후 다시 시도하세요";
var replyupdate = "댓글쓰기에 실패하였습니다\n잠시 후 다시 시도하세요";

var updateerror = "글수정에 실패했습니다\n잠시 후 다시 시도하세요";
var replyerror = "댓글이 있는경우는 삭제가 불가능합니다."; 
var deleteerror = "글삭제에 실패했습니다\n잠시 후 다시 시도하세요";

function erroralert( msg ) {
	alert( msg );
	history.back();
}
  




/*
function passwdfocus() {
	passwdform.passwd.focus();
}
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( msg_passwd );
		passwdform.passwd.focus();
		return false;
	}
}
*/



// 글쓰기 유효성 검사 처리부분 
function subjectfocus() {
	writeform.subject.focus();
}
function writecheck_check() {
	if( ! writeform.category.value ) {
		alert( msg_category );
		writeform.category.focus();
		return false; 
	} if( ! writeform.subject.value ) {
		alert( msg_subject );
		writeform.subject.focus();
		return false;
	}
	
	// 글 에디터가 넘기는 거야
	$('input[name=hstag]').val($("#myTags").data("ui-tagit").tagInput.addClass("fancy"));
	$('input[name=content]').val( $('#summernote').summernote('code') );
	 
	/*
	if( ! $('#summernote').value)
		{
			alert('입력해라');
			$('#summernote').summernote('focus');
			return false;
		}else( $('#summernote').value)
		{
			alert('입력했다');
			return false;
		}
	*/
		
	/*
	if( $('#summernote').summernote('isEmpty')) 
	{
	  alert('내용을 입력해주세요'); 
	  $('#summernote').summernote('focus');
	  return false;
	} 
  	*/ 
			
}         

//글수정
function subjectfocus() { 
	modifyview.subject.focus();	
} 


function modifycheck() {
	if( ! modifyview.category.value ) {
		alert( msg_category ); 
		modifyview.category.focus();
		return false; 
	} if( ! modifyview.subject.value ) {
		alert( msg_subject );
		modifyview.subject.focus();
		return false;   
	} 
	
	  
	$("#myTags").data("ui-tagit").tagInput.addClass("fancy");
	$('input[name=content]').val( $('#summernote').summernote('code') );
	/*
	if( ! modifyform.content.value ) {
		alert( msg_content );   
		modifyform.content.focus();
		return false;
	} 
	*/ 
	
	/* 
	else if( ! modifyform.passwd.value ) {
		alert( msg_passwd );
		modifyform.passwd.focus();
		return false;
	}	 
	*/ 
}


// 글삭제 부분 
function deletecontent()
{
	if (confirm("정말 삭제하시겠습니까??") == true)
	{    //확인 
	  location.boarddeletePro; 
	  return false;
	}else
	{   //취소
	  return false;
	}
}









///////////////////////****************************////////////////////////////

//-- 글쓰기 에디터 자바스크립트 부분 -- //

$(document).ready(function() {
	$('#summernote').summernote({
		height : 400,  // 에디터 글쓰기 높이
		width : 800,
		minHeight: null, // 에디터 글쓰기 최소높이 제한 (마우스 클릭 후 이동시 제한알아낼 수 있음)
		maxHeight: null, // 에디터 글쓰기 최대높이 제한 (마우스 클릭 후 이동시 제한알아낼 수 있음)
		focus: true  // 포커스 有 
		
	});

	var content = $('input[name=content').val();
	$('#summernote').summernote('code', content);
	
	
	/*
	var save = function() {
		  var makrup = $('.click2edit').summernote('code');
		  $('.click2edit').summernote('destroy');
		};
		*/
});


// -- 태그 관련 자바 스크립트 -- //
 $(function(){
    var sampleTags = ['c++', 'java', 'php', 'coldfusion', 'javascript', 'asp', 'ruby', 'python', 'c', 'scala', 'groovy', 'haskell', 'perl', 'erlang', 'apl', 'cobol', 'go', 'lua'];

    //-------------------------------
    // Minimal
    //-------------------------------
    $('#myTags').tagit();

    //-------------------------------
    // Tag events
    //-------------------------------
    var eventTags = $('#eventTags');

    var addEvent = function(text) {
        $('#events_container').append(text + '<br>');
    };

    eventTags.tagit({
        availableTags: sampleTags,
        beforeTagAdded: function(evt, ui) {
            if (!ui.duringInitialization) {
                addEvent('beforeTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
            }
        },
        afterTagAdded: function(evt, ui) {
            if (!ui.duringInitialization) {
                addEvent('afterTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
            }
        },
        beforeTagRemoved: function(evt, ui) {
            addEvent('beforeTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
        },
        afterTagRemoved: function(evt, ui) {
            addEvent('afterTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
        },
        onTagClicked: function(evt, ui) {
            addEvent('onTagClicked: ' + eventTags.tagit('tagLabel', ui.tag));
        },
        onTagExists: function(evt, ui) {
            addEvent('onTagExists: ' + eventTags.tagit('tagLabel', ui.existingTag));
        }
    });

    //-------------------------------
    // Read-only
    //-------------------------------
    $('#readOnlyTags').tagit({
        readOnly: true
    });

    //-------------------------------
    // Tag-it methods
    //-------------------------------
    $('#methodTags').tagit({
        availableTags: sampleTags
    });

    //-------------------------------
    // Allow spaces without quotes.
    //-------------------------------
    $('#allowSpacesTags').tagit({
        availableTags: sampleTags,
        allowSpaces: true
    });

    //-------------------------------
    // Remove confirmation
    //-------------------------------
    $('#removeConfirmationTags').tagit({
        availableTags: sampleTags,
        removeConfirmation: true
    });
    
});
 
	$(document).ready(function() {
	    $("#myTags").tagit(); 
	 
	
	 var hstag = $('input[name=hstag]').val();
	 $('#myTags').data("ui-tagit").tagInput.addClass("fancy", hstag);
	});  
 
 
// 글내용 적기위한 onsubmit 처리 
 
 /*
function postForm()
{
	$('input[name=content]').val( $('#summernote').summernote('code') );
}
*/

  

    










