/**
 *   제목 변경
 */
// 제목 변경 버트는 누르면 실행되는 메소드
var cnt = 0;

/* 대학 추가 쿠키저장을 위한 전역 지정 */
var school_name = "";
var school_name1 = "";

var school_kind_ida = "";
var school_kind_idb = "";

var school_start_date = "";
var school_last_date = "";
var school_college1 = "";
var school_college2 = "";
var school_major = "";
var school_rank1 = "";
var school_rank2 = "";


function skill_result() {
   var skills = document.getElementById('skill').value;
   opener.document.resome.skill.value = skills;
   window.close();
   
}


function addReturn(){
   
   if(school_name1 != undefined) {
        $("#school_name1").val(school_name1);
    }       
    if(school_kind1 != undefined) {
        $("#school_kind1").val(school_kind1);
        $("#school_kind1").attr("checked", 'checked');

    }
    if(school_start_date1 != undefined) {
        $("#school_start_date1").val(school_start_date1);
    }     
    if(school_last_date1 != undefined) {
        $("#school_last_date1").val(school_last_date1);
    }
    if(school_college11 != undefined) {
        $("#school_college11").val(school_college11);
    }
    if(school_college21 != undefined) {
        $("#school_college21").val(school_college21);
    }       
    if(school_college_high1 != undefined) {
        $("#school_college_high1").val(school_college_high1);
    }
    if(school_name_kind1 != undefined)
    {
        $("#school_name_kind1").val(school_name_kind1);
    }            
    if(school_major1 != undefined) {
        $("#school_major1").val(school_major1);
    }
    if(school_rank11 != undefined) {
        $("#school_rank11").val(school_rank11);
    }      
    if(school_rank21 != undefined) {
        $("#school_rank21").val(school_rank21);
    }
}


$(function(){
    //최초 쿠키에 login_id라는 쿠키값이 존재하면
    var resome_title = $.cookie('resome_title');
    var kor_name = $.cookie('kor_name');
    var eng_name = $.cookie('eng_name');
    var postcode = $.cookie('postcode');
    var address1 = $.cookie('address1');
    var address2 = $.cookie('address2');
    var tel1 = $.cookie('tel1');
    var tel2 = $.cookie('tel2');
    var tel3 = $.cookie('tel3');
    var birth = $.cookie('birth');
    var army1 = $.cookie('army1');
    var army2 = $.cookie('army2');
    var army3 = $.cookie('army3');
    var army4 = $.cookie('army4');
    var army5 = $.cookie('army5');
    var army6 = $.cookie('army6');
    var army7 = $.cookie('army7');       
    var skill = $.cookie('skill');
    var want_salary = $.cookie('want_salary');
    var license1 = $.cookie('license1');
    var license2 = $.cookie('license2');
    var license3 = $.cookie('license3');
    var project = $.cookie('project');
    var input_file = $.cookie('input_file');
    
    var formCnt = $.cookie('formCnt');
    var addedForm = document.getElementById("addedFormDiv");


    
	
    var highschool_start_date = $.cookie('highschool_start_date');
    var highschool_last_date = $.cookie('highschool_last_date');
    var highschool_college = $.cookie('highschool_college');
    var highschool_name = $.cookie('highschool_name');
    var highschool_name_kind = $.cookie('highschool_name_kind');
    
    //alert("here : " +$.cookie('school_kind1'));
   

    school_name1 = $.cookie('school_name1');
  	
	  $("#school_name1").val(school_name1); 


   for(var i=1; i<=addedForm.childNodes.length; i++) {

	    school_kind_ida[i] = $.cookie('school_kind_ida'+i);
	   	school_kind_idb[i] = $.cookie('school_kind_idb'+i);
	    school_start_date[i] = $.cookie('school_start_date'+i);
	    school_last_date[i] = $.cookie('school_start_date'+i);
	    school_college1[i] = $.cookie('school_college1'+i);
	    school_college2[i] = $.cookie('school_college2'+i);
	    school_major[i] = $.cookie('school_major'+i);
	    school_rank1[i] = $.cookie('school_rank1'+i);
	    school_rank2[i] = $.cookie('school_rank2'+i);
		    


	  //  $("#school_name"+i).val(school_name+i); 
	          
	    if(school_kind_ida[i] != undefined) {
	        
	       $("#school_kind_ida"+i).attr("checked", 'checked');
	    }
	    if(school_kind_idb[i] != undefined) {
	        
		       $("#school_kind_idb"+i).attr("checked", 'checked');
		    }	    
	    if(school_start_date[i] != undefined) {
	        $("#school_start_date"+i).val(school_start_date+i);
	    }     
	    if(school_last_date[i] != undefined) {
	        $("#school_last_date"+i).val(school_last_date+i);
	    }
	    if(school_college1[i] != undefined) {
	        $("#school_college1"+i).val(school_college1+i);
	    }
	    if(school_college2[i] != undefined) {
	        $("#school_college2"+i).val(school_college2+i);
	    }       
    
	    if(school_major[i] != undefined) {
	        $("#school_major"+i).val(school_major+i);
	    }
	    if(school_rank1[i] != undefined) {
	        $("#school_rank1"+i).val(school_rank1+i);
	    }      
	    if(school_rank2[i] != undefined) {
	        $("#school_rank2"+i).val(school_rank2+i);
	    }       
	    
   }
	   
	    if(highschool_start_date != undefined) {
	        $("#highschool_start_date").val(highschool_start_date);
	    }
	    if(highschool_last_date != undefined) {
	        $("#highschool_last_date").val(highschool_last_date);
	    }      
	    if(highschool_college != undefined) {
	        $("#highschool_college").val(highschool_college);
	    }        
	    if(highschool_name != undefined) {
	        $("#highschool_name").val(highschool_name);
	    }      
	    if(highschool_name_kind != undefined) {
	        $("#highschool_name_kind").val(highschool_name_kind);
	    }
	    

	    
	    
	    if(resome_title != undefined) {
	        $("#resome_title").val(resome_title);   //아이디에 쿠키값을 담는다.
	    }
	    if(kor_name != undefined) {
	        $("#kor_name").val(kor_name);
	    }
	    if(eng_name != undefined) {
	        $("#eng_name").val(eng_name);
	    }       
	    if(postcode != undefined) {
	        $("#postcode").val(postcode);
	    }
	    if(address1 != undefined) {
	        $("#address1").val(address1);
	    }          
	    if(address2 != undefined) {
	        $("#address2").val(address2);
	    }
	    if(tel1 != undefined) {
	        $("#tel1").val(tel1);
	    }
	    if(tel2 != undefined) {
	        $("#tel2").val(tel2);
	    }
	    if(tel3 != undefined) {
	        $("#tel3").val(tel3);
	    }       
	    if(birth != undefined) {
	        $("#birth").val(birth);
	    }
	    if(army1 != undefined) {
	        $("#army1").val(army1);
	    }          
	    if(army2 != undefined) {
	        $("#army2").val(army2);
	    }
	    if(army3 != undefined) {
	        $("#army3").val(army3);
	    }
	    if(army4 != undefined) {
	        $("#army4").val(army4);
	    }
	    if(army5 != undefined) {
	        $("#army5").val(army5);
	    }       
	    if(army6 != undefined) {
	        $("#army6").val(army6);
	    }
	    if(army7 != undefined) {
	        $("#army7").val(army7);
	    }     
	    if(skill != undefined) {
	        $("#skill").val(skill);
	    }
	    if(want_salary != undefined) {
	        $("#want_salary").val(want_salary);
	    }
	    if(license1 != undefined) {
	        $("#license1").val(license1);
	    }       
	    if(license2 != undefined) {
	        $("#license2").val(license2);
	    }
	    if(license3 != undefined) {
	        $("#license3").val(license3);
	    }            
	    if(project != undefined) {
	        $("#project").val(project);
	    }
	    if(input_file != undefined) {
	        $("#input_file").val(input_file);
	    }            
    
	    
    for(var i = 1; i <= formCnt; i++) {
        addForm();
     }
    
    
    //로그인 버튼 클릭시
    $("#user_button").click(function(){
        //아이디 미입력시
        if( $("#resome_title").val() == null && $("#resome_title").val() == "" ) {
            alert("이력서 제목을 입력하세요.");
            return;
        }  if( $("#kor_name").val() == null && $("#kor_name").val() == "" ) {
            alert("한국이름을 입력하세요.");
            return;
        }  if( $("#eng_name").val() == null && $("#eng_name").val() == "" ) {
            alert("영어이름을 입력하세요.");
            return;
        }  if( $("#postcode").val() == null && $("#postcode").val() == "" ) {
            alert("주소가 입력되지 않았습니다. 다시확인해주세요");
            return;
        }  if( $("#address1").val() == null && $("#address1").val() == "" ) {
            alert("주소가 입력되지 않았습니다. 다시확인해주세요");
            return;
        }  if( $("#address2").val() == null && $("#address2").val() == "" ) {
            alert("주소가 입력되지 않았습니다. 다시확인해주세요");
            return;
        } else {
        	
            $.cookie('resome_title', $("#resome_title").val()); 
            $.cookie('kor_name', $("#kor_name").val()); 
            $.cookie('eng_name', $("#eng_name").val());
            $.cookie('postcode', $("#postcode").val());                
            $.cookie('address1', $("#address1").val());
            $.cookie('address2', $("#address2").val());                   
            $.cookie('tel1', $("#tel1").val());
            $.cookie('tel2', $("#tel2").val());                
            $.cookie('tel3', $("#tel3").val());
            $.cookie('birth', $("#birth").val());    
            $.cookie('army1', $("#army1").val());                
            $.cookie('army2', $("#army2").val());
            $.cookie('army3', $("#army3").val());                   
            $.cookie('army4', $("#army4").val());
            $.cookie('army5', $("#army5").val());                
            $.cookie('army6', $("#army6").val());
            $.cookie('army7', $("#army7").val());                   
            $.cookie('skill', $("#skill").val());                   
            $.cookie('want_salary', $("#want_salary").val());
            $.cookie('license1', $("#license1").val());                
            $.cookie('license2', $("#license2").val());
            $.cookie('license3', $("#license3").val());
            $.cookie('input_file',$("#input_file").val());
            $.cookie('project', $("#project").val());
            
            

            alert("개인정보가 저장되었습니다.!!");
        }
    })
    
    $("#school_save").click(function(){

       $.cookie('formCnt', addedForm.childNodes.length);
			$.cookie('school_name1', $("#school_name1").val());                   

       		for(var j=1; j<=addedForm.childNodes.length; j++) {
       			
		        $.cookie('school_kind_ida'+j, $("#school_kind_ida"+j).val());
		        $.cookie('school_kind_idb'+j, $("#school_kind_idb"+j).val());

		        $.cookie('school_start_date'+j, $("#school_start_date"+j).val());                
		        $.cookie('school_last_date'+j, $("#school_last_date"+j).val());
		        $.cookie('school_college1'+j, $("#school_college1"+j).val());                   
		        $.cookie('school_college2'+j, $("#school_college2"+j).val());                   
		        $.cookie('school_major'+j, $("#school_major"+j).val());
		        $.cookie('school_rank1'+j, $("#school_rank1"+j).val());
		        $.cookie('school_rank2'+j,$("#school_rank2"+j).val());	
       		}

        $.cookie('highschool_start_date', $("#highschool_start_date").val());
        $.cookie('highschool_last_date', $("#highschool_last_date").val());                
        $.cookie('highschool_college', $("#highschool_college").val());
        $.cookie('highschool_name', $("#highschool_name").val());
        $.cookie('highschool_name_kind',$("#highschool_name_kind").val());
        
        
        alert("학력정보가 저장되었습니다.!");
         
    })
    
})


   $.fn.setPreview = function(opt) {   //이미지 미리보기
      "use strict"
      var defaultOpt = {
         inputFile : $(this),
         img : null,
         w : 200,
         h : 200
      };
      $.extend(defaultOpt, opt);

      var previewImage = function() {
         if (!defaultOpt.inputFile || !defaultOpt.img)
            return;

         var inputFile = defaultOpt.inputFile.get(0);
         var img = defaultOpt.img.get(0);

         // FileReader
         if (window.FileReader) {
            // image 파일만
            if (!inputFile.files[0].type.match(/image\//))
               return;

            // preview
            try {
               var reader = new FileReader();
               reader.onload = function(e) {
                  img.src = e.target.result;
                  img.style.width = defaultOpt.w + 'px';
                  img.style.height = defaultOpt.h + 'px';
                  img.style.display = '';
               }
               reader.readAsDataURL(inputFile.files[0]);
            } catch (e) {
               // exception...
            }
            // img.filters (MSIE)
         } else if (img.filters) {
            inputFile.select();
            inputFile.blur();
            var imgSrc = document.selection.createRange().text;

            img.style.width = defaultOpt.w + 'px';
            img.style.height = defaultOpt.h + 'px';
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" + imgSrc + "\")";
            img.style.display = '';
         } else {
            // Safari5, ...
         }
      };

      // onchange
      $(this).change(function() {
         previewImage();
      });
   };

   $(document).ready(function() {
      var opt = {
         img : $('#img_preview'),
         w : 200,
         h : 200
      };

      $('#input_file').setPreview(opt);
   });   //이미지 미리보기



function sub_name_modify(count){   
   // id가 sub_name 이라는 div 사라지게함
   var sub_name = 'div[id=sub_name'+ count +']';
   $(sub_name).css("display", "none");
   // id가 sub_change 이라는 div 나타나게 함
   var sub_change = 'div[id=sub_change'+ count +']';
   $(sub_change).css("display", "block");
   // sub_name_ div에있는 텍스트 값 인풋폼에 등록
   var sub_change_name = 'input[name=sub_change_name'+ count +']';
   var sub_name_ = 'div[id=sub_name_'+ count +']'
   $( sub_change_name ).val( $( sub_name_ ).text() );   
}

// 확인 버튼을 누르면 실행되는 메소드
function sub_name_ok(count){
   var sub_name = 'div[id=sub_name'+ count +']';
   var sub_change = 'div[id=sub_change'+ count +']';
   var sub_change_name = 'input[name=sub_change_name'+ count +']';
   var sub_name_ = 'div[id=sub_name_'+ count +']'
   // div를 받아옴
   // innerHTML을 이용해 인풋폼에 있는 내용으로 변경
   $(sub_name_).text( $(sub_change_name ).val() );
   // 인풋폼 초기화
   $(sub_change_name).val("");
   // 위에설명 참고
   $(sub_name).css("display", "block");
   $(sub_change).css("display", "none");
}   
// 취소 버튼을 누르면 실행되는 메소드
function sub_name_cancel(count){
   var sub_name = 'div[id=sub_name'+ count +']';
   var sub_change = 'div[id=sub_change'+ count +']';
   //위에 설명 참고
   $(sub_name).css("display", "block");
   $(sub_change).css("display", "none");
}

/**
 *    자기소개서 추가 삭제하기
 */
// 자기소개서 페이지 추가 메소드
function add_introduce(){
    var subject = ['자기소개서', '가족소개', '성장과정', '학창시절', '교외활동', '전공선택 이유와 적성', '성격의 장단점', '생활신조', '지원동기', '입사 후 포부', '자기소개서', '가족소개', '성장과정', '학창시절', '교외활동', '전공선택 이유와 적성', '성격의 장단점', '생활신조', '지원동기', '입사 후 포부'];
    var standardID = 'div[id=standardID'+ cnt +']'
    if( cnt < 10 ){
       cnt++;
       var html =   '<div class="standard" id="standardID'+ cnt +'">'
             +   '<div id="sub_name'+ cnt +'"  class="subject" style="display:;">'
             +   '<div id="sub_name_'+ cnt +'" class="subject" >'+ subject[cnt]+'</div>'
             +   '<div class="subject"><input type="button" value="변경" name="modify" onclick="sub_name_modify('+cnt+')"></div>'
             +   '</div>'
             +   '<div id="sub_change'+ cnt +'" class="subject" style="display:none;">'
             +   '<input type="text" name="sub_change_name'+ cnt +'" style="background: #f2f7ff; border: 2px;" autofocus="autofocus" > '
             +   '<input type="button" value="확인" onclick="sub_name_ok('+cnt+')">'
             +   '<input type="button" value="취소" onclick="sub_name_cancel('+cnt+')">'
             +   '</div>'
             +   '<div> <textarea name="contents'+cnt+'" rows="17" cols="100%"></textarea> </div>'
             +   '<div>' 
             +   '<input type="button" value="추가" onclick="add_introduce()">'
             +   '<input type="button" value="삭제" onclick="del_introduce('+cnt+')">'
             +   '</div>'
             +   '</div>';
       $(standardID).after(html);
    } else {
       alert('작성 가능한 자소서항목은 최대 10개입니다.');
    }  
}

// 자기소개 페이지 삭제 메소드
function del_introduce(count){
   if ( cnt > 0 ) {
      var delDiv = 'div[id=standardID'+ count +']'
      if (confirm("삭제하시겠습니까?")) {
         $(delDiv).remove();
         cnt--;
         alert(cnt+"");
      }
   } else {
      alert('한 개 이상의 자소서가 필요합니다.');
   }
}


$("#tooltip").tooltipsy({
    css: {
        'padding': '10px',
        'max-width': '200px',
        'color': '#303030',
        'background-color': '#ffffff',
        'border': '2px solid #4893BA',
        '-moz-box-shadow': '0 0 10px rgba(0, 0, 0, .5)',
        '-webkit-box-shadow': '0 0 10px rgba(0, 0, 0, .5)',
        'box-shadow': '0 0 10px rgba(0, 0, 0, .5)',
        'text-shadow': 'none'
    }
});


/*

http://jquerytools.github.io/demos/tooltip/form.html

http://annotations.tistory.com/66

 */
