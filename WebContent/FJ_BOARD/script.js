/**
 * 게시판
 */

var msg_writer = "작성자를 입력하세요";
var msg_subject = "제목을 입력하세요";
var msg_content = "내용을 입력하세요";
var msg_passwd = "비밀번호를 입력하세요";

var writerror = "글쓰기에 실패했습니다\n잠시 후 다시 시도하세요";
var passwderror = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요";
var updateerror = "글수정에 실패했습니다\n잠시 후 다시 시도하세요";
var deleteerror = "글삭제에 실패했습니다\n잠시 후 다시 시도하세요";
var replyerror = "답글이 있는 경우는 삭제할 수 없습니다";

function erroralert( msg ) {
	alert( msg );
	history.back();
}



// 글수정
function modifyfocus() {
	modifyform.subject.focus();	
}
function modifycheck() {
	if( ! modifyform.subject.value ) {
		alert( msg_subject );
		modifyform.subject.focus();
		return false;
	} else if( ! modifyform.content.value ) {
		alert( msg_content );
		modifyform.content.focus();
		return false;
	} else if( ! modifyform.passwd.value ) {
		alert( msg_passwd );
		modifyform.passwd.focus();
		return false;
	}	
}

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

// 글쓰기
function writefocus() {
	writeform.writer.focus();
}
function writecheck() {
	if( ! writeform.writer.value ) {
		alert( msg_writer );
		writeform.writer.focus();
		return false;
	} if( ! writeform.subject.value ) {
		alert( msg_subject );
		writeform.subject.focus();
		return false;
	} if( ! writeform.content.value ) {
		alert( msg_content );
		writeform.content.focus();
		return false;
	} if( ! writeform.passwd.value ) {
		alert( msg_passwd );
		writeform.passwd.focus();
		return false;
	}
}

///////////////////////****************************////////////////////////////

//-- 글쓰기 에디터 자바스크립트 부분 -- //
$(document).ready(function() {
	$('#summernote').summernote({
		height : 400,
	});
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
function postForm()
{
	$('input[name=content]').val( $('#summernote').summernote('code') );
}















