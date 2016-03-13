/**
 *   제목 변경
 */
// 제목 변경 버트는 누르면 실행되는 메소드
var cnt = 0;

/* 대학 추가 쿠키저장을 위한 전역 지정 */
var school_name = "";
var school_name1 = "";

var school_kind_ida = null;
var school_kind_idb = null;

var school_start_date = "";
var school_last_date = "";
var school_college1 = "";
var school_college2 = "";
var school_major = "";
var school_rank1 = "";
var school_rank2 = "";

var license1 = "";
var license2 = "";
var license3 = "";


function skill_result() {
   var skills = document.getElementById('skill').value;
   opener.document.resome.skill.value = skills;
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

    var project = $.cookie('project');
    var input_file = $.cookie('input_file');
    
    var formCnt = $.cookie('formCnt');
    var license_cnt = $.cookie('license_cnt');
    
    var addedForm = document.getElementById("school_addedFormDiv");
    var license_addform = document.getElementById("license_addform");





    var highschool_start_date = $.cookie('highschool_start_date');
    var highschool_last_date = $.cookie('highschool_last_date');
    var highschool_college = $.cookie('highschool_college');
    var highschool_name = $.cookie('highschool_name');
    var highschool_name_kind = $.cookie('highschool_name_kind');
    
    //alert("here : " +$.cookie('school_kind1'));
   



	   
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
	    if(project != undefined) {
	        $("#project").val(project);
	    }
	    if(input_file != undefined) {
	        $("#input_file").val(input_file);
	    }            
    

    for(var i = 1; i <= formCnt; i++) {
        addForm();
     }
    
    for(var i = 1; i<=license_cnt; i++) {
    	license_addform();
    }
    
    
    //로그인 버튼 클릭시
    $("#user_button").click(function(){
    	
	   //    $.cookie('license_cnt', license_addform.childNodes.length);

        //아이디 미입력시
/*        if( $("#resome_title").val() == null && $("#resome_title").val() == "" ) {
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
        	*/
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

            $.cookie('input_file',$("#input_file").val());
            $.cookie('project', $("#project").val());
            
            
       		for(var j=1; j<=license_cnt; j++) {
       			
       			$.cookie('license1'+j, $("#license1"+j).val());                   
       			$.cookie('license2'+j, $("#license2"+j).val());                   
       			$.cookie('license3'+j, $("#license3"+j).val());                   

       		}

            alert("개인정보가 저장되었습니다.!!");
        
    })
    
    $("#school_save").click(function(){

       $.cookie('formCnt', addedForm.childNodes.length);
       		
       
	 //       $.cookie('school_kind1', $("#school_kind_ida1").val());
   	  //      $.cookie('school_kind1', $("#school_kind_ida2").val());
   	        
   	        
       		for(var j=1; j<=addedForm.childNodes.length; j++) {
       			
       			$.cookie('school_name'+j, $("#school_name"+j).val());                   
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
         
    })
    
})

$(function() {
    $("#imginput").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#img_view').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}



/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
/** resome.jsp에 있던 내용 **/

var count = 1;
var cnt = 1;
var request = null;

window.onload = function() {
   listComment();
}
function listComment() {
   request = new Request( listResult,"resome.jsp" );
   request.sendRequest();   
}
function listResult() {
   var debug = document.getElementById( "debug" );
   if( request.httpRequest.readyState == 4 ) {
      if( request.httpRequest.status == 200 ) {
            
            debug.innerHTML = "";
   
            
         } else {
            debug.innerHTML = request.httpRequest.status + " : 에러발생";   
         }         
      } else {
         debug.innerHTML = request.httpRequest.readyState + " : 통신중";   
      }      
}

function lic_submitcheck() {
	   
	  		var lo_table = document.getElementById("license_table");
	   	    var license_cnt = lo_table.rows.length-2;
	   	   	   	   
	       $('input[name=license_cnt_hidden]').val(license_cnt);

	}




function submitcheck() {
   var name = [];
   var names = $('input[name=school_name]');
   for (var i = 0; i < names.length; i++) {
      name[i] = names.eq(i).val();
   }
   $('input[name=school_name_send]').val(name);
   
    var start = [];
   var starts = $('input[name=school_start_date]');
   for (var i = 0; i < starts.length; i++) {
      start[i] = starts.eq(i).val();
   }
   $('input[name=school_start_send]').val(start);
   
    var last = [];
   var lasts = $('input[name=school_last_date]');
   for (var i = 0; i < lasts.length; i++) {
      last[i] = lasts.eq(i).val();
   }
   $('input[name=school_last_send]').val(last);
   
    var college1 = [];
   var college1s = $('input[name=school_college1]');
   for (var i = 0; i < college1s.length; i++) {
      college1[i] = college1s.eq(i).val();
   }
   $('input[name=school_college1_send]').val(college1);
   
    var college2 = [];
   var college2s = $('input[name=school_college2]');
   for (var i = 0; i < college2s.length; i++) {
      college2[i] = college2s.eq(i).val();
   }
   $('input[name=school_college2_send]').val(college2);
   
    var major = [];
   var majors = $('input[name=school_major]');
   for (var i = 0; i < majors.length; i++) {
      major[i] = majors.eq(i).val();
   }
   $('input[name=school_major_send]').val(major);
   
   
    var rank1 = [];
   var rank1s = $('input[name=school_rank1]');
   for (var i = 0; i < rank1s.length; i++) {
      rank1[i] = rank1s.eq(i).val();
   }
   $('input[name=school_rank1_send]').val(rank1);
   
    var rank2 = [];
   var rank2s = $('input[name=school_rank2]');
   for (var i = 0; i < rank2s.length; i++) {
      rank2[i] = rank2s.eq(i).val();
   }
   $('input[name=school_rank2_send]').val(rank2);      
   
   $('input[name=count]').val(count);


 }


//학력추가
function addForm(flag) {
   //최대 추가할 폼수 지정
   var MAX_ADDFROM = 3;
   
   //학력 구간 추가공간 지정(div객체)
   var school_addedFormDiv = document.getElementById("school_addedFormDiv");
   
   //학력 최대값 설정
   if (school_addedFormDiv.childNodes.length >= MAX_ADDFROM) {
      alert("더 이상 추가할 수 없습니다.");
      return;
   }
   

   /*   추가될 학력 구간 시작   */ 
   var str = "";

   
   str += "<table class='table table-hover'  id='mytable' style='width:750px'>";
   str += "<tr>";
   str += "	<td colspan='5' style='border-top: none;'><h5>대학교 / 대학원</h5></td>";
   str += "</tr>";
   str += "<tr>";
   str += "	<th style='width:100px'>분류</th>";
   str += "	<td colspan='5'>";
   str += "	<input type='radio' id='school_kind_ida"+count+"' name='school_kind"+count+"'value='대학교'/>&nbsp; 대학교 &nbsp;&nbsp; &nbsp;&nbsp;";
   str += "	<input type='radio' id='school_kind_idb"+count+"' name='school_kind"+count+"'value='대학원'/>&nbsp; 대학원";
   str += "</tr>";

   str += "<tr>";
   str += "	<th style='width:80px;'>재학기간</th>";
   str += "	<td colspan='5'>";
   str += "	<input class='form-control-hs' type='date' style='width:180px' id='school_start_date"+count+"' name='school_start_date'>";
   str += "	&nbsp;~&nbsp;" ;
   str += "	<input class='form-control-hs' type='date' style='width:180px' id='school_last_date"+count+"' name='school_last_date'>";
   str += "	&nbsp;&nbsp;";
   str += "	<select class='form-control-hs' style='width: 80px;padding-top: 1px;' id='school_college1"+count+"' name='school_college1'>";
   str += "		<option value='입학'>입학</option>";
   str += "		<option value='편입'>편입</option>";
   str += "	</select>&nbsp;";
   str += "	<select class='form-control-hs' style='width: 120px;padding-top: 1px;' id='school_college2"+count+"' name='school_college2'>";
   str += "		<option value='졸업예정'>졸업예정</option>";
   str += "		<option value='졸업'>졸업</option>";
   str += "		<option value='재학중'>재학중</option>";
   str += "		<option value='휴학중'>휴학중</option>";
   str += "		<option value='수료'>수료</option>";
   str += "		<option value='중퇴'>중퇴</option>";
   str += "		<option value='자퇴'>자퇴</option>";
   str += " 	</select>";   
   str += "	</td>";
   str += "</tr>";

   str += "	<th>학교명</th>";
   str += "	<td style='width:200px;text-align: center;'>"; 
   str += "		<input class='form-control-hs' style='padding-top: 1px;text-align: center;' type='text' id='school_name"+count+"' name='school_name'>";   
   str += "	</td>";
   str += "	<th style='width:50px; margin-left: 20px;'>전공</th>";
   str += "	<td style='width:180px;'>";
   str += "		<input class='form-control-hs' type='text' id='school_major"+count+"' name='school_major'>";
   str += "	</td>";
   str += "	<th style='width:50px; margin-left: 20px;text-align: right;'>학점</th>";
   str += "	<td>";
   str += "		<input class='form-control-hs' type='text' style='width:60px' id='school_rank1"+count+"' name='school_rank1' maxlength='3'> / ";
   str += "		<input class='form-control-hs' type='text' style='width:60px' id='school_rank2"+count+"' name='school_rank2' maxlength='3'>";
   str += "	</td>"	;
   str += "</tr>";
	   
   str += "<tr>";	
   str += "   <td colspan='6' align='right'>";
   str += "       <input  class='btn btn-default'  type='button' value='학력 추가' onclick='addForm()'>";
   str += "       <input  class='btn btn-default'  type='button' value='삭제' onclick='delForm()'>";
   str += "			&nbsp;&nbsp;";
   str += "   </td>";
   str += "</tr>";
   str += "</table>";

/*   추가될 학력 구간 종료   */
   
   var addedDiv = document.createElement("div");
   addedDiv.id = "added_" + count;
   addedDiv.innerHTML = str;
   school_addedFormDiv.appendChild(addedDiv);

   count++;
   document.resome.count.value = count;
   if(flag == "highAdd") addReturn();

   $("input[name=school_kind1]:checked").val();
   if($("#school_kind_ida1").attr("checked")=="checked")
 	  radio_checked=$("#school_kind_ida1").val();
 	  
   
   
   
   if( $.cookie('school_name') != "" ) {
 	  for(var i=1; i<=count; i++) {
   		$("#school_name"+i).val( $.cookie('school_name'+i) );
 		$("#school_start_date"+i).val( $.cookie('school_start_date'+i) );
 		$("#school_last_date"+i).val($.cookie('school_last_date'+i));
 	//	$("#school_kind_ida"+i).attr("checked", 'checked');
 	//	$("#school_kind_idb"+i).attr("checked", 'checked');

 
		//	$("#school_kind_ida1").attr("checked", 'checked');
		//	$("#school_kind_ida2").attr("checked", 'checked');
		
			$("#school_kind_idb1").attr("checked", 'checked');
			$("#school_kind_idb2").attr("checked", 'checked');
 	//	$('#school_kind_ida'+i).prop('checked',!$('#school_kind_ida'+i).prop('checked'));
 	//	alert($.cookie('school_kind'+i));
 		
 	//	$('#school_kind_idb'+i).prop('checked',!$('#school_kind_idb'+i).prop('checked'));

 		$("#school_college1"+i).val($.cookie('school_college1'+i));
 		$("#school_college2"+i).val($.cookie('school_college2'+i));
 		$("#school_major"+i).val($.cookie('school_major'+i));
 		$("#school_rank1"+i).val($.cookie('school_rank1'+i));
 		$("#school_rank2"+i).val($.cookie('school_rank2'+i));    		  
 		  
 	  }
   }

}



function delForm() {
   var school_addedFormDiv = document.getElementById("school_addedFormDiv");
   if (count > 1) {
      var addedDiv = document.getElementById("added_" + (--count));

      if (confirm("삭제하시겠습니까?")) {
         school_addedFormDiv.removeChild(addedDiv);
      }
   } else {
      document.resome.reset();
   }
}

var license_cnt = 0;
function license_addform() {
   /*var lo_table = document.getElementById("license_table");
   var row_index = lo_table.rows.length;*/
   var lo = document.getElementById("license_table_tr"+license_cnt);
   if( license_cnt < 9){
	   license_cnt = license_cnt + 1;
	   var html = 	"<tr id='license_table_tr"+license_cnt+"'>"
		   		+	"<td style='width:160px'> <input type='text' name='license1"+license_cnt+"' id='license1"+license_cnt+"' style='width:220px' class='form-control-hs' > </td>"
		   		+	"<td style='width:80px'> <input type='date' name='license2"+license_cnt+"' id='license2"+license_cnt+"' style='width:180px' class='form-control-hs' > </td>"
		   		+	"<td colspan='2' style='width:200px'> <input class='input' type='text' name='license3"+license_cnt+"' id='license3"+license_cnt+"' style='width:260px' class='form-control-hs' ></td>"
		   		+	"</tr>";
	   $(lo).after(html);
   } else {
	   alert("자격증은 10개까지 등록할 수 있습니다.")
   }
   
   /*newTr = lo_table.insertRow(row_index - 1);
   newTr.idName = "newTr" + row_index;
		      
   newTd = newTr.insertCell(0);
   newTd.innerHTML = license_cnt;
   newTd.innerHTML = "<td style='width:160px'> <input type='text' name='license1"+license_cnt+"' id='license1"+license_cnt+"' style='width:220px' class='form-control-hs' > </td>";

   newTd = newTr.insertCell(1);
   newTd.innerHTML = license_cnt;
   newTd.align = "center";
   newTd.innerHTML = "<td style='width:80px'> <input type='text' name='license2"+license_cnt+"' id='license2"+license_cnt+"' style='width:180px' class='form-control-hs' > </td>";

   newTd = newTr.insertCell(2);
   newTd.innerHTML = license_cnt;
   newTd.innerHTML = "<td colspan='2' style='width:200px'> <input class='input' type='text' name='license3"+license_cnt+"' id='license3"+license_cnt+"' style='width:260px' class='form-control-hs' ></td>";
	*/
/*   
   if( $.cookie('license1') != "" ) {
 	  for(var i=1; i<=license_cnt; i++) {
 		//  $.cookie('license1'+i, $('input[id=license1'+i+']').val());
   		$("#license1"+i).val( $.cookie('license1'+i) );
 		$("#license2"+i).val( $.cookie('license2'+i) );
 		$("#license3"+i).val($.cookie('license3'+i));
 
 	  }
   }*/
 		
}

function license_delForm() {

   var lo_table = document.getElementById("license_table");
   var row_index = lo_table.rows.length - 2; // 테이블(TR) row 개수
   license_cnt = license_cnt -1;
   if (row_index > 1)
      lo_table.deleteRow(row_index); 
} 


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

               document.getElementById('postcode').value = data.zonecode;
               document.getElementById('address1').value = fullAddr;

               document.getElementById('address2').focus();
            }
         }).open();
}

function conf_skill() {
   var url = "confirm_skill.do";
   open(url, "confrimWindow",
         "menubar=no, statusbar=no, scrollbar=no, toolbar=no, width=450, height=300");

}

/* ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ */




/*▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼*/
//*** career.jsp에 있던 자바스크립트
// 카운트는 오류 날까봐 임의로 이름 바꿈

var request = null;
var career_count = 1;


window.onload = function() {
	listComment();
}
function listComment() {
	request = new Request( listResult,"career.jsp" );
	request.sendRequest();	
}
function listResult() {
	var debug = document.getElementById( "debug" );
	if( request.httpRequest.readyState == 4 ) {
		if( request.httpRequest.status == 200 ) {
			debug.innerHTML = "정상종료";
	
			} else {
				debug.innerHTML = request.httpRequest.status + " : 에러발생";	
			}			
		} else {
			debug.innerHTML = request.httpRequest.readyState + " : 통신중";	
		}		
}

function chk() {
	var obj = window.event.srcElement;
	var addedFor = document.getElementById("career_addFormdiv");
	
	if (obj.type == "radio" && obj.name == "career_sort" && obj.value=="경력") {
		
		career_table.style.display = 'block';
		 // table2.style.display = 'block';
		  addedFor.style.display = 'block';
		  
	 }
	if (obj.type == "radio" && obj.name == "career_sort" && obj.value=="신입") {

		career_table.style.display = 'none';
		 // table2.style.display = 'none';
		  addedFor.style.display = 'none';
	 }
}

function career_addForm() {

    var career_addFormdiv = document.getElementById("career_addFormdiv");

    var str = "";
    str +="<table id='career_table1' class='table'>";
    str +="	<tr>";
    str +="		<th style='width:200px;'>근무기간</th>";
    str +="		<th style='width:450px;' colspan='4'>상세경력</th>";
    str +="	</tr>";
    str +="	<tr>";
    str +="		<td rowspan='4'>";
    str +="			<select class='form-control-hs' style='width: 100px' name='career_kind' onChange='change(this)'>";				
    str +="				<option value='퇴사'>퇴사</option>";
    str +="				<option value='재직중'>재직중</option>";		
    str +="			</select>";	
    str +="			<br><br>";
    str +="			<input class='form-control-hs' type='date' style='width:180px' name='career_start_date' id='career_start_date'>";
    str +="			<br>";
    str +="			&nbsp; ~ &nbsp;";
    str +="			<input class='form-control-hs' type='date' style='width:180px' name='career_last_date' id='career_last_date' >";
    str +="			<br><br>";
    str +="			<input class='btn btn-default' type='button' onclick='sort()' value='근무개월 계산'>";
    str +="			<input class='form-control-hs' type='text' style='width:100px' name='career_sort_date' id='career_sort_date'>";
    str +="		</td>";
    str +="		<th style='width:100px'>회사명</th>";
    str +="		<td colspan='3'><input class='form-control-hs' type='text' name='career_comp_name'></td>";
    str +="	</tr>";
    str +="	<tr>";
    str +="		<th>부서명 </th>";
    str +="		<td colspan='3'>";
    str +="			<input class='form-control-hs' type='text' style='width: 120px' name='career_department'>";
    str +="			&nbsp;";
    str +="			<select class='form-control-hs' style='width: 110px' name='career_position1'>";				
    str +="				<option value='직급선택'>직급선택</option>";
    str +="				<option value='사원(연구원)'>사원(연구원)</option>";
    str +="				<option value='주임/계장(연구원)'>주임/계장(연구원)</option>";
    str +="				<option value='대리(주임연구원)'>대리(주임연구원)</option>";
    str +="				<option value='과장(선임연구원)'>과장(선임연구원)</option>";
    str +="				<option value='차장(수석연구원)'>차장(수석연구원)</option>";
    str +="				<option value='부장(연구소장)'>부장(연구소장)</option>";
    str +="				<option value='임원'>임원</option>";
    str +="			</select>";
    str +="			&nbsp;";
    str +="			<select class='form-control-hs' style='width: 110px' name='career_position2'>";				
    str +="				<option value='직책선택'>직책선택</option>";
    str +="				<option value='팀원'>팀원</option>";
    str +="				<option value='팀장'>팀장</option>";
    str +="				<option value='매니저'>매니저</option>";
    str +="				<option value='파트장'>파트장</option>";
    str +="				<option value='실장'>실장</option>";
    str +="				<option value='지점장'>지점장</option>";
    str +="				<option value='지사장'>지사장</option>";
    str +="				<option value='원장'>원장</option>";
    str +="				<option value='국장'>국장</option>";
    str +="				<option value='본부장'>본부장</option>";
    str +="				<option value='센터장'>센터장</option>";
    str +="				<option value='공장장'>공장장</option>";
    str +="				<option value='그룹장'>그룹장</option>";
    str +="			</select>";			
    str +="		</td>";
    str +="	</tr>";
    str +="	<tr>";
    str +="		<th>담당업무(언어)</th>";
    str +="		<td style='width: 80px'>";
    str +="			<input class='form-control-hs' type='text' style='width: 150px' name='career_work'>";
    str +="		</td>";
    str +="		<th style='width:100px;margin-left: 10px;' align='right'>급여/연봉</th>";
    str +="		<td colspan='2'>";
    str +="			<input class='form-control-hs' type='number' style='width: 70px;text-align: center;' name='career_salary' placeholder='숫자'>";
    str +="			만원";
    str +="		</td>";
    str +="	</tr>";
    str +="	<tr>";
    str +="		<th>퇴사사유 </th>";
    str +="		<td colspan='4'>";
    str +="			<input class='form-control-hs' type='text' name='career_resign'>";
    str +="		</td>";
    str +="	</tr>";
    str +="	<tr>";
    str +="		<th style='text-align: center;' colspan='6'>경력 기술서</th>";
    str +="	</tr>";
    str +="	<tr>";
    str +="		<td colspan='6'>";
    str +="			<textarea name='career_content' rows='7' cols='90'></textarea>";
    str +="		</td>";
    str +="	</tr>";	
    str +="	<tr>";
    str +="		<td align='right' colspan='6'>";    
    str +="			<input  class='btn btn-default'  type='button' value='경력추가' onclick='career_addForm()'";
    str +="			style='font-style:'돋움'; font-size:13px; color:white; background-color:#0059b3; border: 1px solid #0059b3;'";
    str +="			>";
    str +="			<input  class='btn btn-default'  type='button' value='삭제' onclick='career_deleForm()'";
    str +="			style='font-style:'돋움'; font-size:13px; color:#ff5d5d; background-color:#f8f8f8;'";
    str +="			border: 1px solid #ff5d5d;";
    str +="			>";
    str +="		</td>";
    str +="	</tr>";
    str +="</table>";
    
	var addedDiv = document.createElement("div");
		addedDiv.id = "added_" + career_count;
		addedDiv.innerHTML = str;
		career_addFormdiv.appendChild(addedDiv);
	
		career_count++;
		document.resome.career_count.value = career_count;

}

function career_deleForm() {
	var career_addFormdiv = document.getElementById("career_addFormdiv");

	if (career_count > 1) {
		var addedDiv = document.getElementById("added_" + (--career_count));
		if (confirm("삭제하시겠습니까?")) {
			career_addFormdiv.removeChild(addedDiv);
		}
	} else {
		document.resome.reset();
	}
}

function change(sel) {
	
	var IdNum = sel.options[sel.selectedIndex].value;
	var career_last_date = document.getElementById("career_last_date");
    var d = new Date();
	 
    var s =
        leadingZeros(d.getFullYear(), 4) + '-' +
        leadingZeros(d.getMonth() + 1, 2) + '-' +
        leadingZeros(d.getDate(), 2);
	
	if (IdNum == "2") {
		career_last_date.value = s;
	}
	
	else if (IdNum == "1") {
		career_last_date.value = "";
		}
}

function leadingZeros(n, digits) {
    var zero = '';
    n = n.toString();
 
    if (n.length < digits) {
        for (i = 0; i < digits - n.length; i++)
            zero += '0';
    }
    return zero + n;
}


        function sort() {

            var career_start_date = $("#career_start_date").val().split("-");
            var career_last_date = $("#career_last_date").val().split("-");
			var c = null;
            var a1=new Date(career_start_date[0],career_start_date[1],career_start_date[2]).getTime();
            var a2=new Date(career_last_date[0],career_last_date[1],career_last_date[2]).getTime();
            var b=(a2-a1)/(1000*60*60*24);
            if (b>31) {
            c =  Math.ceil((b)/30) + "개월";
            
            } else {
            	c = "0개월 "+ b + "일";
            }
            
            $('#career_sort_date').val(c);
            
            
        }

