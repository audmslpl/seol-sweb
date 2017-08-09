 $(function(){


  $('#chkpassword').keyup(function(){
   if($('#password').val()!=$('#chkpassword').val()  || $('#name').val().length < 1 || $('#email').val().length < 1){
       $('#button_del').prop('disabled',true);
	   $('#button_joinus').prop('disabled',true);

   }else{
		 var check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/ 
		  if(!check.test($('#password').val())){
			  $('.message').text("비밀번호 조건 불충족");
	      } else{
			  $('.message').text("비밀번호 조건 충족");
			  $('#button_del').prop('disabled',false);
			  $('#button_joinus').prop('disabled',false);
		  }
	}
   });
  }); //#chpass.keyup

