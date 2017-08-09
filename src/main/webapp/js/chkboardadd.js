
$(function(){

	  
	  $('#content').keyup(function(){
		  if( $('#mno').val().length < 1  || $('#title').val().length < 1 || $('#content').val().length < 1) {

		    $('#button_joinus').attr('disabled',true);
		   }else{
		    $('#button_joinus').attr('disabled',false);

		    }
		  }); //#chpass.keyup
		 
});

