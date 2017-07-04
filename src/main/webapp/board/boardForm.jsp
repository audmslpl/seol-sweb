<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 등록</title>
<style>
ul { padding: 0; }
li { list-style:none; }

label {
  float: left;
  text-align: right;
  width: 60px;
}
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../js/chkboardadd.js"></script>

</head>
<body>
<jsp:include page="/Header.jsp"/>
<h1>게시판 글쓰기</h1>
<form action='add.do' method='post'>
<ul>
<li><label for="mname">작성자</label> 
  <input  type='text' name='mname' size="5" value="${sessionScope.member.name}"readonly>
  <input  type='hidden' name='mno' size="0" id="mno" value="${sessionScope.member.no}" type="hidden" readonly ></li>
<li><label for="title">제목</label> 
  <input id="title"   type='text' name='title' size="50"></li>
<li><label for="content">내용</label>
  <textarea id="content"   name='content' rows="5" cols="40"></textarea></li>
</ul>
<input type='submit' value='추가' id='button_joinus' disabled="">
<input type='reset' value='취소'>
</form>
<jsp:include page="/Tail.jsp"/>
</body>
</html>
