<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v3.12.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="../assets/images/logo.png" type="image/x-icon">
  <meta name="description" content="Website Maker Description">
  <title>게시판 목록</title>
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

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../js/chkminput.js"></script>

</head>
<body>
<jsp:include page="/Header.jsp"/>

<section class="mbr-section mbr-section-hero mbr-section-full extHeader1" id="extHeader1-0" style="background-image: url(../assets/images/sea.jpg);">

    <div class="mbr-overlay" style="opacity: 0.6; background-color: rgb(126, 155, 159);">
    </div>

    <div class="mbr-table mbr-table-full">
        <div class="mbr-table-cell">

            <div class="container">
                <div class="mbr-section row">
                    <div class="mbr-table-md-up">
                        
                        
                        

                        <div class="mbr-table-cell mbr-right-padding-md-up col-md-7 text-xs-center text-md-right">

                            <h3 class="mbr-section-title display-2">회원가입</h3>

                            <div class="mbr-section-text lead">
                                <p>회원 가입을 해주셔서 감사합니다! <br> 보안을 위해 비밀번호는 8자이상 16자 이하, 알파벳,숫자,특수문자 3가지 조합으로 구성해 주시면 감사하겠습니다!</p>
                            </div>

                            

                        </div>
                        <div class="form-table mbr-valign-top col-md-9  formblock" data-form-type="formoid" style="border: none;">

                            <form action="add.do" method="post" style="background-color: rgb(250, 250, 250);" data-form-title="INTRO WITH FORM">
                                    <div class="col-xs-12">
                                         <input type="text" class="form-control dark" name="name" required="" data-form-field="Name" id="name" placeholder="Name*" style="border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(152, 152, 152); color: rgb(152, 152, 152);">
                                    </div>

                                    <div class="col-xs-12"> 
                                         <input type="text" class="form-control dark" name="email" required="" data-form-field="Email" id="email" placeholder="Email*" style="border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(152, 152, 152); color: rgb(152, 152, 152);">    
                                     </div>
                                     <div class="col-xs-12"> 
										<c:if test="${emailCheck != null}">
										<p>${emailCheck}</p>
										</c:if>
									 </div>
                                    <div class="col-xs-12">
                                         <input type="password" class="form-control dark" name="password" id="password"required="" data-form-field="Password" placeholder="Password" style="border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(152, 152, 152); color: rgb(152, 152, 152);">
                                    </div>
                                    <div class="col-xs-12">
                                         <input type="password" class="form-control dark" name="chkpassword" id="chkpassword" required="" data-form-field="Password" placeholder="Retype Password" style="border-bottom-width: 1px; border-bottom-style: dotted; border-bottom-color: rgb(152, 152, 152); color: rgb(152, 152, 152);">
                                    </div>
                                    <div class="col-xs-12">
                                    	<p class="message"></p>
                                    </div>
									<div class="row">
                                		<div class="col-xs-12" style="margin-top: 10px; text-align: center"><button type="submit" class="btn btn-primary" id='button_joinus' disabled="">Register</button></div>
                            		</div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="mbr-arrow mbr-arrow-floating hidden-sm-down" aria-hidden="true"><a href="#extHeader2-0"><i class="mbr-arrow-icon"></i></a></div>

</section>




<jsp:include page="/Tail.jsp"/>
</body>
</html>