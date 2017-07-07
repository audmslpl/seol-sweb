<%-- 메뉴 추가 --%>
<%@page import="spms.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       

<section id="menu-y">

    <nav class="navbar navbar-dropdown bg-color transparent navbar-fixed-top">
        <div class="container">

            <div class="mbr-table">
                <div class="mbr-table-cell">

                    <div class="navbar-brand">
                            <a class="navbar-caption" href="../index.jsp">SEOL'S Web</a>
                    </div>

                </div>
                <div class="mbr-table-cell">

                    <button class="navbar-toggler pull-xs-right hidden-md-up" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="hamburger-icon"></div>
                    </button>

                    <ul class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm" id="exCollapsingNavbar">
                    <li class="nav-item"><a class="nav-link link" href="notice.html">NOTICE</a> </li>
                    <li class="nav-item"><a class="nav-link link" href="<%=request.getContextPath()%>/board/list.do">BOARD</a></li>
                    <li class="nav-item"><a class="nav-link link" href="gallery.html">Gallery</a></li>
                    <li class="nav-item"><a class="nav-link link" href="help.html">HELP</a></li>
                    <li class="nav-item"><a class="nav-link link" href="<%=request.getContextPath()%>/member/list.do">FRIEDNS</a></li>
					<c:if test="${empty sessionScope.member or empty sessionScope.member.email}">                    
                    <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="<%=request.getContextPath()%>/auth/login.do">login</a>
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="close-icon"></div>
                    </button>
                     <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="<%=request.getContextPath()%>/member/add.do">register</a>
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="close-icon"></div>
                    </button>                 
					</c:if>  
            
					<c:if test="${!empty sessionScope.member and !empty sessionScope.member.email}">
                     <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="<%=request.getContextPath()%>/member/update.do?no=${sessionScope.member.no}">${sessionScope.member.name}</a>
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="close-icon"></div>
                    </button>
                    
                     <li class="nav-item nav-btn"><a class="nav-link btn btn-white btn-white-outline" href="<%=request.getContextPath()%>/auth/logout.do">logout</a>
                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="close-icon"></div>
                    </button>   

					</c:if>     
                    </ul>

                </div>
            </div>

        </div>
    </nav>

</section>




