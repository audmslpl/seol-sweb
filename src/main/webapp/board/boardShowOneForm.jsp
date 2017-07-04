<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 정보</title>
<style>
ul { padding: 0; }
li { list-style:none; }

label {
  float: left;
  text-align: right;
  width: 60px;
}
</style>
</head>
<body>
<jsp:include page="/Header.jsp"/>
<h1>프로젝트 정보</h1>
<form action='ShowOne.do' method='post'>
<ul>
<li><label for="no">번호</label> 
  <input id="no" 
  type='text' name='no' size="5" value="${board.no}"
  readonly></li>
<li><label for="mname">작성자</label> 
  <input id="mname" 
  type='text' name='mname' size="5" value="${board.mname}"
  readonly></li>
<li><label for="title">제목</label> 
  <input id="title" 
  type='text' name='title' size="50" value="${board.title}"></li>
<li><label for="content">내용</label>
  <textarea id="content" 
  name='content' rows="5" cols="40">${board.content}</textarea></li>

</ul>
<input type='submit' value='저장'>
<input type='button' value='삭제' 
  onclick='location.href="delete.do?no=${board.no}";'>
<input type='button' value='취소' onclick='location.href="list.do"'>
</form>
<jsp:include page="/Tail.jsp"/>
</body>
</html>