<input type='radio' name='xx_test1' id='radio_aaa'  onclick="radio_change('aaa',1)" checked> simple
<input type='radio' name='xx_test1' id='radio_bbb' onclick="radio_change('bbb',1)"> category


<div id='list_aaa' style="border:1px solid red; display:block;">
  .....<br>
  simple MENU<br>
  ......<br>
</div>

<div id='list_bbb' style="border:1px solid blue; display:none;">
  .....<br>
  category MENU<br>
  ......<br>
</div>


<script type="text/javascript">
  function radio_change(str,save){
     document.getElementById('list_aaa').style.display='none';
     document.getElementById('list_bbb').style.display='none';
     document.getElementById('list_'+str).style.display='block';
     if(save==1)TnT_setcookie('TnT_menu_radio',str,5); // 쿠키저장 5시간
  }
  setTimeout(function(){
     if(TnT_getcookie('TnT_menu_radio')=='bbb'){
        radio_change('bbb');
        document.getElementById('radio_bbb').checked=true;
     }
  },50);
</script>