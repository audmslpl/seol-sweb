$(function(){

	  $('#content').keyup(function(){
	   if( $('#mno').val().length < 1 || $('#content').val().length < 1 || $('#title').val().length < 1){
		   $('#button_contact').prop('disabled',true);

	   }else{
		   $('#button_contact').prop('disabled',false);
	    }
	  }); //#chpass.keyup
	 });

