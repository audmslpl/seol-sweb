<%-- 정렬 링크 추가 --%>
<%@ page 
  language="java" 
  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
  <!-- Site made with Mobirise Website Builder v3.12.1, https://mobirise.com -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v3.12.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="assets/images/logo.png" type="image/x-icon">
  <meta name="description" content="">
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
  <link rel="stylesheet" href="../assets/bootstrap-material-design-font/css/material.css">
  <link rel="stylesheet" href="../assets/tether/tether.min.css">
  <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/dropdown/css/style.css">
  <link rel="stylesheet" href="../assets/animate.css/animate.min.css">
  <link rel="stylesheet" href="../assets/theme/css/style.css">
  <link rel="stylesheet" href="../assets/mobirise/css/mbr-additional.css" type="text/css">
<style type="text/css">

  a {color:#000000;}

 </style>
</head>
<body>
<jsp:include page="/Header.jsp"/>

 <section class="mbr-section extTable1 " id="extTable1-0" style="background-color: rgb(204, 204, 204); padding-top: 120px; padding-bottom: 120px;">
    <div class="container">
                    <h1 class="mbr-section-title display-1">BOARD</h1>
                    <p class="mbr-section-lead lead"> 글 많이 달아주세용 <br> 많은 관심부탁드려요 ㅠ</p>
                    <div class="mbr-section-btn"><a class="btn btn-lg btn btn-black" href="add.do"><span class="mbri-edit2 mbr-iconfont mbr-iconfont-btn"></span>게시판에 글쓰기</a></div>
                    
    </div>

    <div class="container table-wrapper" >
        
        <table class="table" >
        <thead>
        <tr>
        	<th><c:choose>
   								 <c:when test="${orderCond == 'BNO_ASC'}">
   		    						<a href="list.do?orderCond=BNO_DESC" >번호↑</a>
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
       	</tr>
        </thead>
     						   <tbody>
      							 <c:forEach var="board" items="${boards}">
									<tr> 
							  			<td>${fn:escapeXml(board.no)}</td>
  										<td><a href='ShowOne.do?no=${board.no}'>${fn:escapeXml(board.title)}</a></td>
 								        <td>${fn:escapeXml(board.mname)}</td>
 									    <td>${fn:escapeXml(board.createdDate)}</td>
 									    <td>${fn:escapeXml(board.count)}</td>
									</tr>
								</c:forEach>
       						</tbody>
       	</table>


       	<div class="row">
       		<ul class="nav nav-tabs" role="tablist">
								
									<c:if test="${startPage > 10}">
										<li class="nav-item col-1" style="display: inline-block;">									
											<a class="nav-link active"  href="list.do?orderCond=${orderCond}&currentPage=${startPage-10}">이전</a>
										</li>
									</c:if>									
									
									
									
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
										<c:if test="${orderCond==null}">
											<li class="nav-item col-1" style="display: inline-block;">										
												<a href="list.do?currentPage=${i}" class="nav-link active" >${i}</a>
											</li>
										</c:if>
										<c:if test="${orderCond!=null}">
											<li class="nav-item col-1" style="display: inline-block;">	
												<a href="list.do?orderCond=${orderCond}&currentPage=${i}" class="nav-link active">${i}</a>
											</li>
										</c:if>
									</c:forEach>
		
		

									<c:if test="${endPage >=startPage+10}">
										<li class="nav-item col-1" style="display: inline-block;">	
											<a class="nav-link active"  href="list.do?orderCond=${orderCond}&currentPage=${startPage+10}" >다음</a>
										</li>
									</c:if>

       			</ul>
       		</div>
     </div>
</section>

<jsp:include page="/Tail.jsp"/>
</body>
</html>