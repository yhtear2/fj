/**
 * 게시판
 */


var msg_subject = "제목을 입력하세요";
var msg_content = "내용을 입력하세요";
var msg_category = "카테고리를 선택하세요";

var writerror = "글쓰기에 실패했습니다\n잠시 후 다시 시도하세요";

var updateerror = "글수정에 실패했습니다\n잠시 후 다시 시도하세요";
var deleteerror = "글삭제에 실패했습니다\n잠시 후 다시 시도하세요";

function erroralert( msg ) {
	alert( msg );
	history.back();
}
  


// 글수정
function modifyfocus() {
	modifyform.subject.focus();	
}
function modifycheck_check() {
	if( ! modifyform.category.value ) {
		alert( msg_category ); 
		modifyform.category.focus();
		return false; 
	} if( ! modifyform.subject.value ) {
		alert( msg_subject );
		modifyform.subject.focus();
		return false;   
		
	} 
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
 
// 글내용 적기위한 onsubmit 처리 
 
 /*
function postForm()
{
	$('input[name=content]').val( $('#summernote').summernote('code') );
}
*/














