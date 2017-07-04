<%-- 정렬 링크 추가 --%>
<%@ page 
  language="java" 
  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 목록</title>
</head>
<body>
<jsp:include page="/Header.jsp"/>
<h1>프로젝트 목록</h1>
<p><a href='add.do'>신규 프로젝트</a></p>
<table border="1">
<tr>
  <th><c:choose>
    <c:when test="${orderCond == 'BNO_ASC'}">
      <a href="list.do?orderCond=BNO_DESC">번호↑</a>
    </c:when>
    <c:when test="${orderCond == 'BNO_DESC'}">
      <a href="list.do?orderCond=BNO_ASC">번호↓</a>
    </c:when>
    <c:otherwise>
      <a href="list.do?orderCond=BNO_ASC">번호︎</a>
    </c:otherwise>
  </c:choose></th>
  <th><c:choose>
    <c:when test="${orderCond == 'TITLE_ASC'}">
      <a href="list.do?orderCond=TITLE_DESC">제목↑</a>
    </c:when>
    <c:when test="${orderCond == 'TITLE_DESC'}">
      <a href="list.do?orderCond=TITLE_ASC">제목↓</a>
    </c:when>
    <c:otherwise>
      <a href="list.do?orderCond=TITLE_ASC">제목︎</a>
    </c:otherwise>
  </c:choose></th>
  <th><c:choose>
    <c:when test="${orderCond == 'WRITER_ASC'}">
      <a href="list.do?orderCond=WRITER_DESC">작성자↑</a>
    </c:when>
    <c:when test="${orderCond == 'WRITER_DESC'}">
      <a href="list.do?orderCond=WRITER_ASC">작성자↓</a>
    </c:when>
    <c:otherwise>
      <a href="list.do?orderCond=WRITER_ASC">작성자</a>
    </c:otherwise>
  </c:choose></th>
  <th><c:choose>
    <c:when test="${orderCond == 'CREATEDDATE_ASC'}">
      <a href="list.do?orderCond=CREATEDDATE_DESC">작성일↑</a>
    </c:when>
    <c:when test="${orderCond == 'CREATEDDATE_DESC'}">
      <a href="list.do?orderCond=CREATEDDATE_ASC">작성일↓</a>
    </c:when>
    <c:otherwise>
      <a href="list.do?orderCond=CREATEDDATE_ASC">작성일</a>
    </c:otherwise>
  </c:choose></th>
  <th><c:choose>
    <c:when test="${orderCond == 'HITCOUNT_ASC'}">
      <a href="list.do?orderCond=HITCOUNT_DESC">조회수↑</a>
    </c:when>
    <c:when test="${orderCond == 'HITCOUNT_DESC'}">
      <a href="list.do?orderCond=HITCOUNT_ASC">조회수↓</a>
    </c:when>
    <c:otherwise>
      <a href="list.do?orderCond=HITCOUNT_ASC">조회수</a>
    </c:otherwise>
  </c:choose></th>
  <th></th>
</tr>
<c:forEach var="board" items="${boards}">
<tr> 
  <td>${board.no}</td>
  <td><a href='ShowOne.do?no=${board.no}'>${board.title}</a></td>
  <td>${board.mname}</td>
  <td>${board.createdDate}</td>
  <td>${board.count}</td>
  <td><a href='delete.do?no=${board.no}'>[삭제]</a></td>
</tr>
</c:forEach>
</table>
<jsp:include page="/Tail.jsp"/>
</body>
</html>