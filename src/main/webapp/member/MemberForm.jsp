<%-- 프런트 컨트롤러 적용 - 링크에 .do 붙임 --%>
<%@ page 
  language="java" 
  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 등록</title>
<script type="text/JavaScript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/JavaScript" src="../js/chkpass.js"></script>


</head>
<body>
<jsp:include page="/Header.jsp"/>
<h1>회원 등록</h1>
<form action='add.do' method='post'>
이름: <input type='text' name='name'><br>
이메일: <input type='text' name='email'><br>
암호: <input type='password' name='password' id='password'><br>
암호확인: <input type='password' name='chkpassword' id ='chkpassword'><br>
<font name="check" size="2" color="red"></font>

<input type='submit' value='추가' id='button_joinus' disabled="">
<input type='reset' value='취소'>
</form>
<jsp:include page="/Tail.jsp"/>
</body>
</html>
