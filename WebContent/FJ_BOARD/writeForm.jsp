<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!DOCTYPE html>
<html lang="en">
<head> 
  <meta charset="UTF-8">
     
   
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>자유게시판 - 글쓰기 페이지</title> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<link href="testse.css" rel="stylesheet"> 
        <!--  
        <meta property="og:image" content="http://okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">
        --> 
        
        <link rel="stylesheet" href="tests.css">    
   
<body id="main">
<div id="article-create" class="content" role="main">

            <div class="content-header">
                <h3> 글쓰기 </h3>
            </div>

			<!-- 게시자 이미지 넣는곳  -->
			<!--  
           <div class="panel panel-default clearfix">
                <div class="panel-heading clearfix">
                    <div class="avatar avatar-medium clearfix pull-left">
                    <a href="/user/info/40879" class="avatar-photo">
                    
                    	<a href="http://localhost:8080/TestEx/test1.jsp">
                    		<img src="C:\ExpertJava\Images\IU.png" border="0">
                    	</a>
                    </a> 
                    <div class="avatar-info">
                    <a class="nickname" href="/user/info/40879"></a> 
                    <div class="activity block"><span class="fa fa-flash"></span> 
                    		</div>
                    	</div>
                    </div>
                </div>
                -->
                <div class="panel-body">
                    <form action="writePro.do" method="post" class="article-form" role="form" onsubmit="return postForm()">
<input type="hidden" name="SYNCHRONIZER_TOKEN" value="3b7807a6-2802-4fb8-bc07-02fab3b15cc4" id="SYNCHRONIZER_TOKEN">
<input type="hidden" name="SYNCHRONIZER_URI" value="list.do" id="SYNCHRONIZER_URI">
                        <fieldset class="form">
                            
<div class="form-group  has-feedback">
        <div>
            <select id="category" name="categoryCode" class="form-control">
                <option value="">게시판을 선택해 주세요.</option>
                
                    	<option value="notice">소스 공유</option>
                    
                
                    
                        <option value="life">사람냄새</option>
                    
                
                    
                        <option value="forum">포럼</option>
                    
                
                    
                        <option value="gathering">구직모임</option>
                    
                
                    
                        <option value="promote">구직활동/기업홍보</option>
                    
                
            </select> 
        </div>
    </div>
    
<div class="form-group has-feedback">
    <div>
        <input type="text" name="subject" required="" value="" placeholder="제목을 입력해 주세요." class="form-control" id="title">
    </div>
</div>


<!-- 
    <div>
        <input type="text" name="tagString" value="" placeholder="Tags," data-role="tagsinput" class="form-control" id="tagString" style="display: none;"><div class="bootstrap-tagsinput"><input type="text" placeholder="Tags,"></div>
    </div>  
-->

 <div class="form-group has-feedback">
	
</div>
   

  <!-- include jquery -->
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 

  <!-- include libs stylesheets -->
  <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" />
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

  <!-- include summernote -->
  <link rel="stylesheet" href="../FJ_BOARD_FREE/summernote.css">
  <script type="text/javascript" src="../FJ_BOARD_FREE/summernote.js"></script>

  <script type="text/javascript">
    $(document).ready(function() {
      $('.summernote').summernote({     
        height: 300,
        tabsize: 2
      }); 
    });
  </script> 
</head>
<body>
<div class="container" style="width: 102%;">
  
  <div class="summernote"></div>
</div>   

<input type="hidden" name="content.textType" value="HTML" id="content.textType">

     

                            <div class="nav" role="navigation">
                                <fieldset class="buttons">
                                    <a href="writePro" class="btn btn-default btn-wide" onclick="return confirm('정말로 취소하시겠습니까?')">Cancel</a>
                                    <input type="submit" name="create" class="create btn btn-success btn-wide pull-right" value="Submit" id="create"
                                    				>    
                                </fieldset>
                            </div>   
                        </fieldset>
                    </form>
                </div>
            </div>
</body>
</html>
