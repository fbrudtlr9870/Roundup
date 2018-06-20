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
                <a href="${pageContext.request.contextPath }" class="nav-bar-logo">편의점마스터</a>
                <ul class="nav-bar-site">
                    <li class="nav-bar-site-li">
	                    <c:if test="${memberLoggedIn!=null}">
	                    	<a href="${pageContext.request.contextPath }/basket/selectBasketList.do?memberId=${memberLoggedIn.member_id}" style="color:black">장바구니</a>
	                    </c:if>
	                    <c:if test="${memberLoggedIn==null}">
	                    	<a href='javascript:window.alert("로그인 후 이용하실 수 있습니다.");' style="color:black">장바구니</a>
	                    </c:if>
                    </li>
                    <li class="nav-bar-site-li"><a href="${pageContext.request.contextPath }/member/myPage.do?memberId=${memberLoggedIn.member_id }" style="color:black">마이페이지</a></li>
                    <li class="nav-bar-site-li">고객센터</li>
                    <li class="nav-bar-site-li"><a href="${pageContext.request.contextPath }/manager/managerPage.do">관리자페이지</a></li>
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
                       <form action="${pageContext.request.contextPath }/product/productSearch.do">
                       <div class="input-group">
                         <input type="text" class="form-control" placeholder="Search for..." name="searchKeyword">
                         <span class="input-group-btn">
                           <button class="btn btn-default" type="submit" value="Go!">Go!!</button>
                         </span>                                
                       </div>
                       </form>
                     </div>
                </fieldset>
                
				<!-- 로그인 회원가입 -->
               <div class="nav-bar-btn">
	               <c:if test="${memberLoggedIn==null}">
	                  <button type="button" class="btn btn-outline-success" data-toggle="modal" 
			    		data-target="#exampleModal">로그인</button>
			    		&nbsp;
	                  <button type="button" class="btn btn-outline-success"
	               		 onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">회원가입</button>
	               </c:if>
	                <c:if test="${memberLoggedIn!=null }">
				    <a href="#">${memberLoggedIn.member_name }</a>님, 안녕하세요
				     <button class="btn btn-outline-success" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">
			    		로그아웃
			    	</button>
				    </c:if>
                </div>
            </div>
        </nav>
        <!-- 여기있었으 -->
        <!-- 로그인 Modal 시작 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action="${pageContext.request.contextPath }/member/memberLogin.do" method="post">
		      <div class="modal-body">
		      	<input type="text" class="form-control" name="member_id" id="member_id" placeholder="아이디" required/>
		      	<br />
		      	<input type="password" class="form-control" name="member_password" id="member_password" placeholder="비밀번호" required/>
		      </div>
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-outline-primary">로그인</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		      </form>
		    </div>
		  </div>
		</div>
		<!-- 로그인 Modal 끝 -->

	<section>
