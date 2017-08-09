<%-- 정렬 링크 추가 --%>
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
 <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../js/chkginput.js"></script>

</head>
<body>
<jsp:include page="/Header.jsp"/>



<section class="mbr-section" id="form1-22" style="background-color: rgb(46, 46, 46); padding-top: 120px; padding-bottom: 120px;">
    
    <div class="mbr-section mbr-section__container mbr-section__container--middle">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-xs-center">
                    <h3 class="mbr-section-title display-2">Gallery</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="mbr-section mbr-section-nopadding">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-lg-10 col-lg-offset-1" >



                    <form action="add.do" method="post" enctype="multipart/form-data" >

                        <input type="hidden"  value="${sessionScope.member.no}" name="mno" id="mno">

                        <div class="row row-sm-offset">
							<c:if test="${empty sessionScope.member.no}">
                   		         <div class="col-xs-12 col-md-4">
                   		             <div class="form-group">
                     		               <label class="form-control-label" >Name</label>
                    		                <input type="text" class="form-control" name="mname" value="로그인 후 이용해주세요">
                     		           </div>
                    		        </div>
							</c:if>

							<c:if test="${!empty sessionScope.member.no}">
                	            <div class="col-xs-12 col-md-4">
                    	            <div class="form-group">
                        	            <label class="form-control-label" >Name</label>
                            	        <input type="text" readonly class="form-control" id="name" name="mname" value="${sessionScope.member.name}">
                            	    </div>
                            	</div>
							</c:if>

                            <div class="col-xs-12 col-md-4">
                                <div class="form-group">
                                    <label class="form-control-label" >Title</label>
                                    <input type="text" class="form-control" name="title"  id="title">
                                </div>
                            </div>

                            <div class="col-xs-12 col-md-4">
                                <div class="form-group">
                                    <label class="form-control-label" >Content</label>
                                    <input type="text" class="form-control" name="content" id="content">
                                </div>
                            </div>

                        </div>

                        <div class="form-group">
                            <label class="form-control-label" >Image</label>
                            <input type="file"  accept=".gif, .jpg, .png, .jpeg" class="form-control" name="filename0" id="contract_file" >
                         	<input type="file"  accept=".gif, .jpg, .png, .jpeg" class="form-control" name="filename1" id="contract_file" >
                         	<input type="file"  accept=".gif, .jpg, .png, .jpeg" class="form-control" name="filename2" id="contract_file" >
                         	<input type="file"  accept=".gif, .jpg, .png, .jpeg" class="form-control" name="filename3" id="contract_file" >
                         	<input type="file"  accept=".gif, .jpg, .png, .jpeg" class="form-control" name="filename4" id="contract_file" >
                         	<input type="file"  accept=".gif, .jpg, .png, .jpeg" class="form-control" name="filename5" id="contract_file" >
                         	<input type="file"  accept=".gif, .jpg, .png, .jpeg" class="form-control" name="filename6" id="contract_file" >
                         	<input type="file"  accept=".gif, .jpg, .png, .jpeg" class="form-control" name="filename7" id="contract_file" >
                        </div>
						<div><button type="submit" class="btn btn-success" id='button_contact' disabled=""  >CONTACT US</button></div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</section>



<jsp:include page="/Tail.jsp"/>
</body>
</html>