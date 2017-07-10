 $(function(){
	 

  $('#chkpassword').keyup(function(){
   if($('#password').val()!=$('#chkpassword').val()){
	    $('#button_del').prop('disabled',true);

	   $('#button_joinus').prop('disabled',true);

   }else{
	    $('#button_del').prop('disabled',false);

	   $('#button_joinus').prop('disabled',false);
    }
  }); //#chpass.keyup
 });

