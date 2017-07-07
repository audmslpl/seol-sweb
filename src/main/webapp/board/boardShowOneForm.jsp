<%@ page 
	language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="generator" content="Mobirise v3.12.1, mobirise.com">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="../assets/images/logo.png" type="image/x-icon">
  <meta name="description" content="Website Maker Description">
  <title>게시판 목록</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
  <link rel="stylesheet" href="../assets/web/assets/mobirise-icons/mobirise-icons.css">  
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
  <link rel="stylesheet" href="../assets/bootstrap-material-design-font/css/material.css">
  <link rel="stylesheet" href="../assets/tether/tether.min.css">
  <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/dropdown/css/style.css">
  <link rel="stylesheet" href="../assets/animate.css/animate.min.css">
  <link rel="stylesheet" href="../assets/theme/css/style.css">
  <link rel="stylesheet" href="../assets/mobirise/css/mbr-additional.css" type="text/css">

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



<section class="mbr-section mbr-section-hero mbr-section-full extHeader10" id="extHeader10-0" style="background-image: url(../assets/images/code-man.jpg);">

    <div class="mbr-overlay" style="opacity: 0; background-color: rgb(0, 0, 0);">
    </div>

    <div class="mbr-table mbr-table-full">
        <div class="mbr-table-cell">

            <div class="container">
                <div class="mbr-section row">
                    <div class="mbr-table-md-up">
   
                        <div class="form-table mbr-valign-top col-md-9  formblock" data-form-type="formoid">

                            <form action='ShowOne.do' method='post' data-form-title="INTRO WITH FORM">
                                <input type="hidden" value="20qJwpvjuFolFZK3bb3KTtwgbCAiX9ycGmEa4UNyahPL/9ucgbomVAoQZfbSTtt/ZMtGZL0gJD52lbLXzDgkTRkZX4HgCcpZ56bNKtIRcEFbmPhQ55brtgPBR39wjPLB" data-form-email="true">

                                    <div class="col-xs-12">
                                         <input id="no"   type='text' name='no' size="5" value="${board.no}" readonly class="form-control" data-form-field="No" placeholder="${board.no}">
                                    </div>

                                    <div class="col-xs-12"> 
                                         <input id="mname"   type='text' name='mname' size="5" value="${board.mname}" readonly class="form-control" data-form-field="MName" placeholder="${board.mname}">
                                    </div>

                                    <div class="col-xs-12">
                                        <input id="title"   type='text' name='title' size="50" value="${board.title}" readonly class="form-control" data-form-field="title" placeholder="${board.title}">
                                   </div>

                                    <div class="col-xs-12">
                                       <textarea id="content"   name='content' rows="7" cols="40" readonly class="form-control"  data-form-field="Message" style="resize:none" >${board.content}</textarea>
                                    </div>
                                      <div class="mbr-section-btn">
                                      	<a class="btn btn-lg btn-info" href="list.do">게시판으로 돌아가기</a>
                                      	<c:if test="${sessionScope.member.no == board.mno}">
                                      	<a class="btn btn-lg btn-info" href="update.do?no=${board.no}">현재 게시글 수정하기</a>
                                        <a class="btn btn-lg btn-info" href="delete.do?no=${board.no}">현재 게시글 삭제하기</a>
                                      	</c:if>
                                        
                                      </div>
>
                          </form>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="mbr-arrow mbr-arrow-floating hidden-sm-down" aria-hidden="true"><a href="#extForm2-0"><i class="mbr-arrow-icon"></i></a></div>

</section>



<jsp:include page="/Tail.jsp"/>
</body>
</html>