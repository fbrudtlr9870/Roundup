<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.pageTitle }</title>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>		
<!-- 부트스트랩관련 라이브러리 -->
<!-- navi관련 수정(18.06.15) -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
</head>	
<body>
<div id="main-container">
        <nav class="nav-bar">
            <div class="nav-bar-wrapper">
                <a href="index.html" class="nav-bar-logo">편의점마스터</a>
                <ul class="nav-bar-site">
                    <li class="nav-bar-site-li"><a href="basket.html" style="color:black">장바구니</a></li>
                    <li class="nav-bar-site-li">마이페이지</li>
                    <li class="nav-bar-site-li">고객센터</li>
                </ul>
                <ul class="nav-bar-list">
                        <li class="nav-bar-site-li"><a href="http://www.7-eleven.co.kr" target="blank">세븐일레븐</a></li>
                        <li class="nav-bar-site-li"><a href="http://gs25.gsretail.com/gscvs/ko/main"target="blank">GS25</a></li>
                        <li class="nav-bar-site-li"><a href="http://cu.bgfretail.com/index.do"target="blank">CU</a></li>
                        <li class="nav-bar-site-li"><a href="https://www.ministop.co.kr"target="blank">미니스톱</a></li>
                        <li class="nav-bar-site-li"><a href="https://www.emart24.co.kr/index.asp"target="blank">이마트24</a></li>
                </ul>
                <fieldset class="nav-search">
                        <div class="col-lg-6">
                                <div class="input-group">
                                <form action="${pageContext.request.contextPath }/product/productSearch.do">
                                  <input type="text" class="form-control" placeholder="Search for..." name="searchKeyword">
                                  <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit" value="Go!">Go!!</button>
                                  </span>                                
                                </form>
                                </div>
                              </div>
                </fieldset>
                <div class="nav-bar-btn">
                    <button type="button" class="btn btn-primary"><a href="login.html" style="color:white">로그인</a></button>
                    <button type="button" class="btn btn-default">회원가입</button>
                </div>
            </div>
        </nav>
        <nav class="nav-list">
            <div class="nav-list-wrapper">
                    <ul class="nav nav-tabs nav-justified">
                            <li role="presentation" class="active"><a href="#">카테고리</a></li>
                            <li role="presentation"><a href="#">행사</a></li>
                            <li role="presentation"><a href="notice.html">공지사항</a></li>
                            <li role="presentation"><a href="./freeboard/freeBoardList.do">게시판</a></li>
                            <li role="presentation"><a href="#">1:1문의</a></li>
                    </ul>
            </div>
        </nav>        
	<section>
