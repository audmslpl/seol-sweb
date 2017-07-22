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
  <link rel="stylesheet" href="../assets/et-line-font-plugin/style.css">
  <link rel="stylesheet" href="../assets/animate.css/animate.min.css">
  <link rel="stylesheet" href="../assets/mobirise-gallery/style.css">
  <link rel="stylesheet" href="../assets/mobirise/css/mbr-additional.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/Header.jsp"/>

<section class="mbr-section article mbr-after-navbar" id="msg-box8-p" style="background-color: rgb(46, 46, 46); padding-top: 120px; padding-bottom: 120px;">

    
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2 text-xs-center">
                <h3 class="mbr-section-title display-2">${gallery.title}</h3>
                
            </div>
        </div>
    </div>

</section>


<section class="mbr-section article mbr-section__container" id="content2-27" style="background-color: rgb(255, 255, 255); padding-top: 20px; padding-bottom: 20px;">

    <div class="container">
        <div class="row">
            <div class="col-xs-12 lead"><blockquote>${gallery.content}</blockquote></div>
        </div>
    </div>

</section>

<section class="mbr-slider mbr-section mbr-section__container carousel slide mbr-section-nopadding" data-ride="carousel"data-interval="5000" id="slider-q">
    <div>
        <div>
            <div>
                <ol class="carousel-indicators">
                	<c:forEach var="i" begin="0" step="1" end="${filecount-1}">
                		<c:if test="${i==0}">
                		 <li data-app-prevent-settings="" data-target="#slider-q" class="active" data-slide-to="${i}"></li>
                		</c:if>
                		<c:if test="${i!=0}">
                		<li data-app-prevent-settings="" data-target="#slider-q" data-slide-to="${i}"></li>
                		</c:if>
                	</c:forEach>

			
                </ol>
                <div class="carousel-inner" role="listbox">
                	<c:forEach var="galleryfile" items="${galleryfiles}" varStatus="status">
                		<c:if test="${status.index==0}">
                			<div class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full active"  style="background-image: url(../upload/${galleryfile.savedFilename});"></div>
                		</c:if>
						<c:if test="${status.index!=0}">
							<div class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full "  style="background-image: url(../upload/${galleryfile.savedFilename});"></div>
                		</c:if>
                	</c:forEach>
                    
                </div>

                <a data-app-prevent-settings="" class="left carousel-control" role="button" data-slide="prev" href="#slider-q">
                    <span class="icon-prev" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a data-app-prevent-settings="" class="right carousel-control" role="button" data-slide="next" href="#slider-q">
                    <span class="icon-next" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</section>

<section class="mbr-gallery mbr-section mbr-section-nopadding mbr-slider-carousel" id="gallery3-r" data-filter="false" style="background-color: rgb(46, 46, 46); padding-top: 1.5rem; padding-bottom: 1.5rem;">
    <!-- Filter -->
    

    <!-- Gallery -->
    <div class="mbr-gallery-row container">
        <div class=" mbr-gallery-layout-default">
            <div>
                <div>
                 <c:forEach var="galleryfile" items="${galleryfiles}" varStatus="status">
                			<div class="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1" >
                        		<div href="#lb-gallery3-r" data-slide-to="${status.index}" data-toggle="modal"><img alt="" src="../upload/${galleryfile.savedFilename}"> <span class="icon-focus"></span> </div>
                    		</div>
                </c:forEach>
          
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <!-- Lightbox -->
    <div data-app-prevent-settings="" class="mbr-slider modal fade carousel slide" tabindex="-1" data-keyboard="true" data-interval="false" id="lb-gallery3-r">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <ol class="carousel-indicators">
                    	<c:forEach var="i" begin="0" step="1" end="${filecount-1}">
                		<c:if test="${i==0}">
 	                        <li data-app-prevent-settings="" data-target="#lb-gallery3-r" class=" active" data-slide-to="${i}"></li>
                        </c:if>
						<c:if test="${i!=0}">
							<li data-app-prevent-settings="" data-target="#lb-gallery3-r"  data-slide-to="${i}"></li>
						</c:if>
						</c:forEach>

                    </ol>
                    <div class="carousel-inner">
                       <c:forEach var="galleryfile" items="${galleryfiles}" varStatus="status">
                			<c:if test="${status.index==0}">
                        		<div class="carousel-item active"><img alt="" src="../upload/${galleryfile.savedFilename}"></div>
							</c:if>
							<c:if test="${status.index!=0 }">
								<div class="carousel-item"><img alt="" src="../upload/${galleryfile.savedFilename}"></div>
							</c:if>
						</c:forEach>
					</div>
                    <a class="left carousel-control" role="button" data-slide="prev" href="#lb-gallery3-r">
                        <span class="icon-prev" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" role="button" data-slide="next" href="#lb-gallery3-r">
                        <span class="icon-next" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>

                    <a class="close" href="#" role="button" data-dismiss="modal">
                        <span aria-hidden="true">×</span>
                        <span class="sr-only">Close</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="mbr-section mbr-section__container" id="buttons1-s" style="background-color: rgb(46, 46, 46); padding-top: 80px; padding-bottom: 20px;">

    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                <div class="text-xs-center">
               		 <a class="btn btn-primary" href="list.do">게시판으로 돌아가기</a> 
              	     <c:if test="${sessionScope.member.no == gallery.mno}">
            	   		<a class="btn btn-primary" href="update.do?no=${gallery.no}">현재 게시글수정하기</a>
            	    	<a class="btn btn-primary" href="delete.do?no=${gallery.no}">현재 게시글 삭제하기</a>
            		</c:if>
            	</div>
            </div>
        </div>
    </div>

</section>


<jsp:include page="/Tail.jsp"/>
</body>
</html>