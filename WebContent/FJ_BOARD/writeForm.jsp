<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>자유게시판 - 글쓰기 페이지</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

<!-- include summernote-ko-KR -->
<script src="lang/summernote-ko-KR.js"></script>	

<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 400,
			lang: 'ko-KR' // default: 'en-US'
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
			<input type="hidden" name="content" value="">
			<!-- 게시판의 종류를 선택하는 부분(메인 태그) -->
			<fieldset class="form">
				<div class="form-group  has-feedback">
						<select id="category" name="categoryCode" class="form-control">
							<option value="">게시판을 선택해 주세요.</option>
							<option value="notice">소스 공유</option>
							<option value="life">사람냄새</option>
							<option value="forum">포럼</option>
							<option value="gathering">구직모임</option>
							<option value="promote">구직활동/기업홍보</option>
						</select>
				</div>
			</fieldset>
			<!-- 제목을 입력하는 부분 -->
			<div class="form-group has-feedback">
				<input type="text" name="subject" placeholder="제목을 입력해 주세요." class="form-control" id="title">
			</div>

			<!-- 내용을 입력하는 부분 -->
			<div id="summernote">내용을 입력해 주세요</div>
			
			<!-- 버튼 부분 -->
			<div class="nav" role="navigation">
				<fieldset class="buttons">
					<input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="Submit">
				</fieldset>
			</div>
		</form>
	</div>
</body>
