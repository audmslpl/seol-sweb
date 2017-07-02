<SCRIPT LANGUAGE="Javascript"> 
 $(function(){
  $('#password').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#chkpassword').keyup(function(){
   if($('#password').val()!=$('#chkpassword').val()){
    $('font[name=check]').text('');
    $('font[name=check]').html("암호틀림");
    $button_joinus = $('.button_joinus').attr('disabled', true);


     }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("암호맞음");
    $button_joinus = $('.button_joinus').attr('disabled', false);

    }
  }); //#chpass.keyup
 });

</script>
