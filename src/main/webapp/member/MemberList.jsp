<%@ page 
  language="java" 
  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
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
                    <h1 class="mbr-section-title display-1">FRIENDS</h1>
                    <div class="mbr-section-btn"><a class="btn btn-lg btn-success" href="add.do"><span class="mbri-edit2 mbr-iconfont mbr-iconfont-btn"></span>Register</a></div>
                    
    </div>

    <div class="container table-wrapper" >
        
        <table class="table" >
        <thead>
        <tr>
        	<th><c:choose>
    			<c:when test="${orderCond == 'MNO_ASC'}">
    			  	<a href="list.do?orderCond=MNO_DESC">번호↑</a>
   		         </c:when>
  		    	 <c:when test="${orderCond == 'MNO_DESC'}">
      				<a href="list.do?orderCond=MNO_ASC">번호↓</a>
   		    	 </c:when>
    		<c:otherwise>
      			<a href="list.do?orderCond=MNO_ASC">번호︎</a>
    		</c:otherwise>
 		 		</c:choose>
 		 
 		 </th>
  		 <th><c:choose>
    <c:when test="${orderCond == 'NAME_ASC'}">
      <a href="list.do?orderCond=NAME_DESC">이름↑</a>
    </c:when>
    <c:when test="${orderCond == 'NAME_DESC'}">
      <a href="list.do?orderCond=NAME_ASC">이름↓</a>
    </c:when>
    <c:otherwise>
      <a href="list.do?orderCond=NAME_ASC">이름</a>
    </c:otherwise>
  </c:choose></th>  
  <th><c:choose>
    <c:when test="${orderCond == 'EMAIL_ASC'}">
      <a href="list.do?orderCond=EMAIL_DESC">이메일↑</a>
    </c:when>
    <c:when test="${orderCond == 'EMAIL_DESC'}">
      <a href="list.do?orderCond=EMAIL_ASC">이메일↓</a>
    </c:when>
    <c:otherwise>
      <a href="list.do?orderCond=EMAIL_ASC">이메일</a>
    </c:otherwise>
  </c:choose></th>
  <th><c:choose>
    <c:when test="${orderCond == 'CREDATE_ASC'}">
      <a href="list.do?orderCond=CREDATE_DESC">등록일↑</a>
    </c:when>
    <c:when test="${orderCond == 'CREDATE_DESC'}">
      <a href="list.do?orderCond=CREDATE_ASC">등록일↓</a>
    </c:when>
    <c:otherwise>
      <a href="list.do?orderCond=CREDATE_ASC">등록일</a>
    </c:otherwise>
  </c:choose></th>
  <th></th>
</tr>
<c:forEach var="member" items="${members}">
<tr> 
  <td>${member.no}</td>
  <td>${member.name}</td>
  <td>${member.email}</td>
  <td>${member.createdDate}</td>

									</tr>
									</c:forEach>
       								</tbody>
       	</table>
        
    </div>
    
</section>



<jsp:include page="/Tail.jsp"/>
</body>
</html>
