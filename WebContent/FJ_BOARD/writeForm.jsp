<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>자유게시판 - 글쓰기 페이지</title>

<!-- 태그 에디터 불러오기 -->    
<!-- INSTRUCTIONS -->
<link href="css/jquery.tagit.css" rel="stylesheet">
<link href="css/tagit.ui-zendesk.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
   
<!-- The real deal -->
<script src="js/tag-it.js" type="text/javascript" charset="utf-8"></script>
  
    
<!-- 글쓰기 에디터 불러오기 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>



<script type="text/javascript">
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
</script>

<body id="main">
	<div id="article-create" class="content" role="main">

		<div class="content-header">
			<h3>글쓰기</h3>
		</div>
	</div>
	<div class="panel-body">
		<form action="writePro.do" method="post" class="article-form" role="form" onsubmit="return postForm()">
			 <!--  <input type="hidden" name="content" value=""> --> 
			<!-- 게시판의 종류를 선택하는 부분(메인 태그) -->
			<fieldset class="form">
				<div class="form-group  has-feedback">
						<select id="category" name="categoryCode" class="form-control">
							<option value="">게시판을 선택해 주세요.</option>
							<option value="notice">테스트1</option>
							<option value="life">테스트2</option>
							<option value="forum">테스트3</option> 
							<option value="gathering">테스트4</option>
							<option value="promote">구직활동/기업홍보</option>
						</select>
				</div>
			</fieldset>  
			<!-- 제목을 입력하는 부분 -->
			<div class="form-group has-feedback">
				<input type="text" name="subject" placeholder="제목을 입력해 주세요." class="form-control" id="title">
			</div>
			
			<!-- 태그를 입력하는 부분 -->

			<div id="wrapper">
				<div id="content">
					<ul id="myTags"></ul>
				</div>
			</div>


			<!-- 내용을 입력하는 부분 -->
			  
			<div id="summernote">
				 
			</div>
		
			<!-- 글쓰기 등록 및 취소부분 -->
			<div class="nav" role="navigation">
				<fieldset class="buttons">
				<a href="/articles/community" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">취소</a>
					<input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="글등록">
				</fieldset>
			</div>
		</form>
	</div>
</body>
