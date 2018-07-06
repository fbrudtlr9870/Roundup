<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.pageTitle }</title>
<style>
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #fff;
    background: #5c83ad;
    width:80px;
}
.nav-fill .nav-item {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    text-align: center;
    margin: 0;
}
div#chatting-room{
	display:none;
}
img#chat-icon{
	width:100px;
	height:100px;
	position:fixed; 
	bottom:0; 
	right:0;
	z-index:10;
	cursor:pointer;
}
.nav-master{
    background-color: #01365a!important;
}
.login-dropdown-master{
	list-style:none;
}
.nav-master>a {
    font-size: 18px;
    color: #f5f2f2!important;
}
</style>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>		
<!-- 부트스트랩관련 라이브러리 -->
<!-- navi관련 수정(18.06.15) -->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
  <!--  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script> -->
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />

<!-- 메타값 -->
<meta name="_csrf" content="${_csrf.token}"/> 
<meta name="_csrf_header" content="${_csrf.headerName}"/> 

<!-- 소켓통신 라이브러리 --> 
<script src="${pageContext.request.contextPath }/resources/js/sockjs.min.js"></script> 


</head>	

<!-- 유저롤을 가진 유저  -->
<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>


<body>
<div id="main-container">
<!-- navigation bar start-->
<nav class="navbar navbar-expand-md navbar-dark fixed-top nav-master">
        <a class="navbar-brand" href="#">
		    <img src="/assets/brand/bootstrap-solid.svg" width="30" height="30" class="d-inline-block align-top" alt="">
		    RoundUP
		  </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="${pageContext.request.contextPath }">Home <span class="sr-only">(current)</span></a>
            </li>
           <!--  <div class="btn-group dropright">
			  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    MENU
			  </button>
			  <div class="dropdown-menu">
				    <a class="dropdown-item" href="#">C A T E G O R Y</a>
				    <a class="dropdown-item" href="#">E V E N T</a>
				    <a class="dropdown-item" href="#">N O T I C E</a>
				    <a class="dropdown-item" href="#">F R E E B O A R D</a>
			  </div>
			</div> -->
            <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Category
		        </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=1">간편식사</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=2">식품</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=3">과자류</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=4">아이스크림</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=5">즉석식품</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=6">음료</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=7">생활용품</a>
		        </div>
		    </li>
		     <li class="nav-item">
              <a class="nav-item nav-link" href="${pageContext.request.contextPath }/noticeboard/noticeBoardList.do">Event</a>
            </li>
            <li class="nav-item">
              <a class="nav-item nav-link" href="${pageContext.request.contextPath }/noticeboard/noticeBoardList.do">Notice</a>
            </li>
            <li class="nav-item">
              <a class="nav-item nav-link" href="${pageContext.request.contextPath }/freeboard/freeBoardList.do">FreeBoard</a>
            </li>
          </ul>
          <form class="form-inline mt-2 mt-md-0" action="${pageContext.request.contextPath }/product/productSearch.do">
            <input type="text" class="form-control focus-hyelin border0-hyelin" id="productKey" placeholder="${param.pageSearch }" name="searchKeyword" autocomplete="off">
            <button type="submit" class="btn btn-transparent-hyelin border0-hyelin focus-hyelin"> <img src="${pageContext.request.contextPath }/resources/img/search2.png" alt="" /></button>
            <!-- <ul id="autoComplete"></ul>  -->
          </form>
          
 
		<c:choose>
			<c:when test="${empty member_id and empty admin_id}">
					<button type="button" class="btn btn-outline-light"
						onclick="location.href='${pageContext.request.contextPath}/member/loginPage.do'">Sign UP</button>
			</c:when>
			<c:otherwise>
					<li class="nav-item dropdown login-dropdown-master">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          ${member_name }님
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
				          <a class="dropdown-item" href="${pageContext.request.contextPath }/member/myPage.do?member_id=${member_id }" style="color:black">
                   			<img src="${pageContext.request.contextPath }/resources/img/mypage.png" alt="" />  My Page
                   		  </a>
				          <a class="dropdown-item" href="${pageContext.request.contextPath }/member/myPageBasket.do?member_id=${member_id}" style="color:black">
                    		<img src="${pageContext.request.contextPath }/resources/img/basket.png" alt="" />  Basket
                    	  </a>
                    	  <hr />
                    	  <button type="button" class="btn btn-link" onclick="document.getElementById('logout-form').submit();">Log Out</button>
				      </li>			    
				      <!-- 관리자 로그인 했을때만 관리자 페이지 들어가도록! --> 
                    <!-- 권한에 따른 접근 방법 기술 -->
               		<sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-bar-site-li"><a href="${pageContext.request.contextPath }/manager/managerPage.do">관리자페이지</a></li>  
              		</sec:authorize>
              
					<!-- <button class="btn btn-outline-light" type="button"
						onclick="document.getElementById('logout-form').submit();">
						로그아웃</button> -->
					<form id="logout-form" action="<c:url value="/logout"/>"
						method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
			</c:otherwise>
		</c:choose>
	</div>
      </nav>
<!-- navigation bar end-->
      
       <div id="myCarousel" class="carousel slide main-slide carousel-master" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner carousel-inner-master">
          <div class="carousel-item active carousel-item-master">
            <img class="first-slide main-event-img-master" src="${pageContext.request.contextPath }/resources/img/resource_img1.jpg" alt="First slide">
          </div>
          <div class="carousel-item carousel-item-master">
            <img class="second-slide main-event-img-master" src="${pageContext.request.contextPath }/resources/img/resource_img2.jpg" alt="First slide">
          </div>
          <div class="carousel-item carousel-item-master">
            <img class="third-slide main-event-img-master" src="${pageContext.request.contextPath }/resources/img/resource_img3.jpg" alt="First slide">
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
        <%-- <nav class="nav-bar">
            <div class="nav-bar-wrapper">
                <a href="${pageContext.request.contextPath }" class="nav-bar-logo">편의점마스터</a>
                <ul class="nav-bar-site">
                    <c:if test="${member_id!=null}">
                    	<li class="nav-bar-site-li">
                    		<a href="${pageContext.request.contextPath }/member/myPage.do?member_id=${member_id }" style="color:black">
                    			<img src="${pageContext.request.contextPath }/resources/img/mypage.png" alt="" />마이페이지
                    		</a>
                    	</li>
                    </c:if>
					<c:if test="${member_id==null}">
						<a href='javascript:window.alert("로그인 후 이용하실 수 있습니다.");'
							style="color: black">마이페이지</a>
					</c:if>

                    <li class="nav-bar-site-li">
	                    <c:if test="${member_id!=null}">
	                    	<a href="${pageContext.request.contextPath }/member/myPageBasket.do?member_id=${member_id}" style="color:black">
	                    		<img src="${pageContext.request.contextPath }/resources/img/basket.png" alt="" />장바구니
	                    	</a>

	                    </c:if>
	                    <c:if test="${member_id==null}">
	                    	<a href='javascript:window.alert("로그인 후 이용하실 수 있습니다.");' style="color:black">장바구니</a>
	                    </c:if>     	
                    </li>

					<!-- 관리자 로그인 했을때만 관리자 페이지 들어가도록! --> 
                    <!-- 권한에 따른 접근 방법 기술 -->
               		<sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li class="nav-bar-site-li"><a href="${pageContext.request.contextPath }/manager/managerPage.do">관리자페이지</a></li>  
              		</sec:authorize>
     

                </ul>
<!--                 <ul class="nav-bar-list">
                        <li class="nav-bar-site-li"><a href="http://www.7-eleven.co.kr" target="blank">세븐일레븐</a></li>
                        <li class="nav-bar-site-li"><a href="http://gs25.gsretail.com/gscvs/ko/main"target="blank">GS25</a></li>
                        <li class="nav-bar-site-li"><a href="http://cu.bgfretail.com/index.do"target="blank">CU</a></li>
                        <li class="nav-bar-site-li"><a href="https://www.ministop.co.kr"target="blank">미니스톱</a></li>
                        <li class="nav-bar-site-li"><a href="https://www.emart24.co.kr/index.asp"target="blank">이마트24</a></li>
                </ul>  -->      

                <fieldset class="nav-search">
                    <div class="col-lg-6">
                       <form action="${pageContext.request.contextPath }/product/productSearch.do">
                       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                       <div class="input-group border-hyelin width450-hyelin">
                         <input type="text" class="form-control focus-hyelin border0-hyelin" id="productKey" placeholder="${param.pageSearch }" name="searchKeyword" autocomplete="off">
                         <span class="input-group-btn">
                           <button type="submit" class="btn btn-transparent-hyelin border0-hyelin focus-hyelin"> <img src="${pageContext.request.contextPath }/resources/img/search2.png" alt="" /></button>
                         </span><br />       
                          	<ul id="autoComplete"></ul>                     
                       </div>
                       </form>
                     </div>
                </fieldset>
               
              	<!-- 로그인 회원가입 -->
              	<div class="nav-bar-btn">
              		<c:choose>
              		<c:when test="${empty member_id and empty admin_id}">
	               <c:if test="${memberLoggedIn==null}">
	               <!--  
	                  <button type="button" class="btn btn-outline-success" data-toggle="modal" 
			    		data-target="#exampleModal">로그인</button>
			    	!-->
			    		<button type="button" class="btn btn-outline-success"
	               		 onclick="location.href='${pageContext.request.contextPath}/member/loginPage.do'">로그인</button>
			    		&nbsp;
	                  <button type="button" class="btn btn-outline-success"
	               		 onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">회원가입</button>

	               </c:if>
	             	</c:when>
	             	<c:otherwise>
	                <c:if test="${memberLoggedIn!=null }">
	                <c:if test="${not empty member_id }">
				   	 <a>${member_name }</a>님, 안녕하세요			    
	                </c:if>
				     <button class="btn btn-outline-success" type="button" onclick="document.getElementById('logout-form').submit();">
 						로그아웃
			    	</button>
			    	<form id="logout-form" action="<c:url value="/logout"/>" method="post">
				        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				    </form>
				    </c:if>
				    </c:otherwise>
				    </c:choose>

                </div>
            </div>
            
             <!-- 채팅아이콘 -->
            <img src="${pageContext.request.contextPath }/resources/img/chat-icon.png" id="chat-icon"/>
 
            <!-- 채팅 관련 html 시작 -->            
             <div id="chatting-room">
               <input type="hidden" name="member_id" value="${member_id}" />
                <div style="text-align:center;">현재 접속중인 사용자<span id="connected-member"style="font-weight:bold;"> ? </span> 명 
                   <button type="button" class="close" aria-label="Close" id="hide_chatting">
                    <span aria-hidden="true">&times;</span>
               </button>
                </div> 
               <c:if test="${member_id!=null }">
               <div style="text-align:center;margin-top:10px;">채팅방에 접속되었습니다.</div>  
               </c:if>
               <c:if test="${member_id==null }">
               <div style="text-align:center;margin-top:10px;">로그인 후 사용가능합니다.</div>  
               </c:if>        
               <div id="chatting-content"></div>
               <sec:authorize access="hasRole('ROLE_USER')">
               <div id="member-chat">
                  <input id="insertText" style="float:left; width:230px;"class="form-control form-control-sm" type="text">
                  <button style="float:left; width:50px;" type="button" class="btn btn-primary" id="insertChat">전송</button>
               </div>
               </sec:authorize>
                  <sec:authorize access="hasRole('ROLE_ADMIN')">
               <input type="text" name="" id="admin-notice" /><button id="insertNotice">전송!!</button>
               </sec:authorize>
            </div> 
            <!-- 채팅관련 끝 -->

        </nav> --%>
         <!-- 채팅아이콘 -->
            <img src="${pageContext.request.contextPath }/resources/img/chat-icon.png" id="chat-icon"/>
 
            <!-- 채팅 관련 html 시작 -->            
             <div id="chatting-room">
               <input type="hidden" name="member_id" value="${member_id}" />
                <div style="text-align:center;">현재 접속중인 사용자<span id="connected-member"style="font-weight:bold;"> ? </span> 명 
                   <button type="button" class="close" aria-label="Close" id="hide_chatting">
                    <span aria-hidden="true">&times;</span>
               </button>
                </div> 
               <c:if test="${member_id!=null }">
               <div style="text-align:center;margin-top:10px;">채팅방에 접속되었습니다.</div>  
               </c:if>
               <c:if test="${member_id==null }">
               <div style="text-align:center;margin-top:10px;">로그인 후 사용가능합니다.</div>  
               </c:if>        
               <div id="chatting-content"></div>

               <div id="member-chat">
               <sec:authorize access="hasRole('ROLE_USER')">
                    <form name="successUpload" style="width:120px; float:right;"> 
			        <input type="text" name="" id="chatUpload" readOnly hidden="true"/> 			        
			        <button style="width:100px;" type="button" class="btn btn-danger" id="sendPhoto">이미지전송</button> 
			        </form> 
			   </sec:authorize>
                  <input id="insertText" style="float:left; width:230px;"class="form-control form-control-sm" type="text">
                  <button style="float:left; width:50px;" type="button" class="btn btn-primary" id="insertChat">전송</button>
                  <sec:authorize access="hasRole('ROLE_USER')">
                  <button style="float:left; width:50px;" type="button" class="btn btn-success" id="insertPhoto">첨부</button>
                  </sec:authorize> 
               </div>

               <sec:authorize access="hasRole('ROLE_ADMIN')">
               <input id="admin-notice" style="float:left; width:230px;"class="form-control form-control-sm" type="text"> 
               <button style="float:left; width:50px;" type="button" class="btn btn-success" id="insertNotice">전송</button>
               </sec:authorize>
            </div> 
            <!-- 채팅관련 끝 -->
        
        <!-- 여기있었으 -->
        
        <nav class="nav-list">
     <div class="nav-list-wrapper">
     <!--       <ul class="nav nav-tabs nav-justified">
               <li role="presentation" class="active"><a href="#">카테고리</a></li>
               <li role="presentation"><a href="#">행사</a></li>
               <li role="presentation"><a href="notice.html">공지사항</a></li>
               <li role="presentation"><a href="./freeboard/freeBoardList.do">게시판</a></li>
               <li role="presentation"><a href="#">1:1문의</a></li>
           </ul>  -->
           <!-- <ul class="nav nav-tabs justify-content-center">
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">카테고리</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">간편식사</a>
			      <a class="dropdown-item" href="#">즉석조리</a>
			      <a class="dropdown-item" href="#">과자류</a>
			      <a class="dropdown-item" href="#">아이스크림</a>
			      <a class="dropdown-item" href="#">식품</a>
			      <a class="dropdown-item" href="#">음료</a>
			      <a class="dropdown-item" href="#">생활용품</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">Separated link</a>
			    </div>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">행사</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">공지사항</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="${pageContext.request.contextPath}/freeboard/freeBoardList.do">게시판</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">1:1문의</a>
			  </li>
			</ul> -->
			<!-- ----------------- -->
			
			
			<!-- ----------------- -->
			
     </div>
     
 </nav>
        

	<section>
<script>
$(document).ready(function(){
	//입력할 때 엔터값 막기 
	$("#productKey").keydown(function(event) {	
	    if (event.keyCode === 13) {
	    	if(!($("#productKey").val().trim().length>=1))//글자수 0일때 엔터불가
	    		event.preventDefault();
	    	if($("#autoComplete").children().hasClass("sel")) //엔터누르면 해당값 받아오게하기위해 엔터불가
	    		event.preventDefault();
	    	/* if(!($("#autoComplete").children().length==0 && (!($("#productKey").val().trim().length>=1)))) //리스트에 없으면 막으려했는데 불린값이 멋대로 바뀜
	    		event.preventDefault(); */
			
	    }
	});
	$("#autoComplete").hide();
	$("#productKey").on("keyup",function(e){
		var sel=$(".sel");
		var li=$("#autoComplete li");
		if(e.key=='ArrowDown'){
			//아무거도 선택되지 않는 경우
			if(sel.length==0){
				$("#autoComplete li:first").addClass("sel");
			}else if(sel.is(li.last())){
				//선텍된 셀이 마지막 li 인경우
			}else{
				sel.removeClass("sel").next().addClass("sel");
			}
		}else if(e.key=='ArrowUp'){
			//아무거도 선택되지 않는 경우
			if(sel.length==0){
				$("#autoComplete li:last").addClass("sel");
			}else if(sel.is(li.first())){
				sel.removeClass("sel");
			}else{
				sel.removeClass("sel").prev().addClass("sel");
			}
		}else if(e.key=='Enter'){
			if($(this).val().trim().length>0){
				$(this).val(sel.children("label").text());
				console.log(sel.children("label").text());
				//검색어 목록은 갑추고 li태그는 삭제
				$("#autoComplete").hide().children().remove();
			}
		}else{
			var autoKeyword=$(this).val();
			console.log(autoKeyword);	
			if(autoKeyword.length>0){
				
				$.ajax({
					url:"${pageContext.request.contextPath}/product/autoComplete.do",
					data:"autoKeyword="+autoKeyword,
					dataType:"json",
					success:function(data){
						console.log(data);// 키워드에 따른 리스트 가져옴 
						if(data.length==0){
							$("#autoComplete").hide();
						}else{	
							var html="";
							if(data.length>5){
								for(var i=0;i<5;i++){
									html+="<li>"+"<label>"+data[i].productName+"</label>"+data[i].brandName+"</li>";
								}
							}else{
								for(var i=0;i<data.length;i++){
									html+="<li>"+"<label>"+data[i].productName+"</label>"+data[i].brandName+"</li>";
								}
							}
							
							$("#autoComplete").html(html).show();
						}
					},error:function(jqxhr,textStatus,errorThrown){
						console.log("ajax실패",jqxhr,textStatus,errorThrown);
					}
				});
			}			
		}
	});
	//부모요소에 이벤트핸들러를 설정하고, 자식요소를 이벤트 소스로 사용
	$("#autoComplete").on("mouseover","li",function(){
		$(this).siblings().removeClass("sel");
		 $(this).addClass("sel");
	}); 
	$("#autoComplete").on("mouseout","li",function(){
		$(".sel").removeClass("sel");
	});
	$("#autoComplete").on("click","li",function(){
		$("#productKey").val($(this).children("label").text());
		$("#autoComplete").hide().children().remove();
	});
	
});
</script>


<script>
$(function(){
   $("#chat-icon").click(function(){
      $("#chatting-room").show();
       //스크롤바 설정 
       var offset = $(".chatting-comment:last").offset(); 
       $("#chatting-content").animate({scrollTop : offset.top}, 10); 
   });
   $("#hide_chatting").click(function(){
      $("#chatting-room").hide();
      $("#chat-icon").show();
   });
   
});
</script>

<!-- 채팅 관련 스크립트(소켓) --> 
<script> 
 
var sock=new SockJS("<c:url value="/echo"/>"); 
	<sec:authorize access="hasRole('ROLE_USER')"> 
	sock.onmessage= onMessage;
	</sec:authorize>
sock.onclose = onClose; 
sock.onopen=function(){ 
     sendMessage();
     $.ajax({ 
           url:"${pageContext.request.contextPath}/chatting/showChat.do", 
           type:"post", 
           dataType:"json", 
           success:function(data){ 
             for(var index in data){ 
               var c = data[index]; 
               if(index=="connectCount"){ 
                 //$("#connected-member").text(c); 
               } 
               if(index=="list"){ 
                 var html='<div>'; 
                 for(var li in c){ 
                   html+='<div class="chatting-comment" style="text-align:left;">'; 
                   html+='<strong>['+c[li].member_id+'] :</strong> '+c[li].chat_content+'</div>'; 
                 } 
                 html+='</div>'; 
                  $("#chatting-content").html(html); 
               } 
             } 
              
           }, 
           error:function(jqxhr, testStatus, errorThrown){ 
            console.log("ajax처리실패"); 
            console.log(jqxhr); 
            console.log(testStatus); 
            console.log(errorThrown); 
           } 
         }); 
}  
$(function(){ 
  $("#insertChat").click(function(){ 
     var chatText=$("#insertText").val().trim(); 
     var member_id =$("[name=member_id]").val().trim(); 
     if(chatText==""){ 
         alert("내용을 입력하셔야 합니다."); 
         return false; 
       } 
        
       if(member_id ==""){ 
         alert("로그인 후 이용가능합니다."); 
         return false; 
       }else{ 
         sendMessage(); 
         $("#insertText").val(''); 
       } 
  }); 
  $("#insertText").keypress(function (e) {
      var chatText=$("#insertText").val().trim();
      var member_id =$("[name=member_id]").val().trim();
      
      if(e.which == 13){
          if(chatText==""){
             alert("내용을 입력하셔야 합니다.");
             return false;
          }
          
          if(member_id ==""){
             alert("로그인 후 이용가능합니다.");
             return false;
          }else{
        	 sendMessage();
             $("#insertText").val('');
             $("#insertText").blur();
          }
      }
  });
  $("#insertNotice").click(function(){
     var adminNotice=$("#admin-notice").val().trim(); 
     var member_id =$("[name=member_id]").val().trim();
     if(adminNotice==""){ 
         alert("내용을 입력하셔야 합니다."); 
         return false; 
     }
     sendNotice(); 
      $("#admin-notice").val(''); 
  });
  $("#insertPhoto").click(function(){ 
	    var popUrl = "${pageContext.request.contextPath}/resources/smarteditor/sample/photo_uploader/chat_uploader.html";   
	    var popOption = "width=460, height=360,top=700, left=800, resizable=no, scrollbars=no, status=no;"; 
	      window.open(popUrl,"",popOption);   
	  }); 
	  $("#sendPhoto").click(function(){ 
	     if($("#chatUpload").val()!=""){ 
	       sendPhoto(); 
	     }else{ 
	       alert("먼저 이미지를 등록하세요!"); 
	     } 
	       
	 }); 
}); 
function sendPhoto(){ 
	sock.send($("#chatUpload").val()+"~!@#"); 
} 
function sendMessage(){
  sock.send($("#insertText").val());
} 

function sendNotice(){
   sock.send("[공지사항] : "+$("#admin-notice").val());
}
 
function onClose(){ 
  $("#chatting-content").append("연결이 끊켰습니당."); 
} 
 
function onMessage(evt){ 
  var data=evt.data; 
  var sessionid=null; 
  var message=null; 
  var strArr=data.split('|'); 
  var authorize = '${member_id}';
  
  sessionid=strArr[0]; 
  message=strArr[1]; 
   
  if(sessionid==""){ 
       $("#connected-member").html(" "+message+" "); 
  }else if(sessionid=="로그인감지로 인해 접속이 끊어집니다."){ 
        alert("로그인 감지로 로그인을 해제합니다."); 
        location.href="${pageContext.request.contextPath}"; 
  }else if(sessionid=="관리자공지"){
        alert(message); 
  }else if(sessionid=="img"+authorize){ 
	    var id = sessionid.substring(3,sessionid.length); 
	    var html='<div class="chatting-comment" style="text-align:left;">';   
	    html+='<strong>['+id+'] :</strong>'; 
	    html+='<img src="http://localhost:9090/rup/resources/upload/chatting/'+message+'"width="100px" height="120px">'; 
	    html+='</div>';   
	      $("#chatting-content").append(html);        
	      var offset = $(".chatting-comment:last").offset();  
	      $("#chatting-content").animate({scrollTop : offset.top}, 10); 
  }else{  
       var html='<div class="chatting-comment" style="text-align:left;">';  
       html+='<strong>['+sessionid+'] :</strong>'+message;  
       html+='</div>';  
       $("#chatting-content").append(html);       
       var offset = $(".chatting-comment:last").offset(); 
       $("#chatting-content").animate({scrollTop : offset.top}, 10); 
     }   
} 
 
</script> 





<!-- 채팅 관련 스크립트 -->

<script>

/* $(function(){
 	 setInterval(function(){ 
	 	$.ajax({
	 		url:"${pageContext.request.contextPath}/chatting/showChat.do",
	 		type:"post",
	 		dataType:"json",
	 		success:function(data){
	 			for(var index in data){
	 				var c = data[index];
	 				if(index=="connectCount"){
	 					$("#connected-member").text(c);
	 				}
	 				if(index=="list"){
				 		var html='<div>';
	 					for(var li in c){
	 						html+='<div class="chatting-comment" style="text-align:left;">';
	 						html+=''+c[li].member_id+' : '+c[li].chat_content+'</div>';
	 					}
	 					html+='</div>';
	 					$(".chatting-comment").empty();
	 		 			$("#chatting-content").html(html);
	 				}
	 			}
	 			$("#chatting-content").html(html);
	 		},
	 		error:function(jqxhr, testStatus, errorThrown){
				console.log("ajax처리실패");
				console.log(jqxhr);
				console.log(testStatus);
				console.log(errorThrown);
			 }
	 	});


 	 },500) 

 	
	
 	$(document).on("click","#insertChat",function(){
 		var chatText=$("#insertText").val().trim();
 		var member_id =$("[name=member_id]").val().trim();
 		
 		if(chatText==""){
 			alert("내용을 입력하셔야 합니다.");
 			return false;
 		}
 		
 		if(member_id ==""){
 			alert("로그인 후 이용가능합니다.");
 			return false;
 		}else{
 			console.log(chatText,member_id);
 			$("#insertText").val('');
 		 	$.ajax({
 		 		url:"${pageContext.request.contextPath}/chatting/insertChat.do",
 		 		type:"get",
 		 		data:{
 		 			member_id:member_id,
 		 			chat_content:chatText
 		 		},
 		 		dataType:"json",
 		 		success:function(data){
					console.log("보내기 성공 ");
 		 			var offset = $(".chatting-comment:last").offset();
 		 	        $("#chatting-content").animate({scrollTop : offset.top}, 400);
 		 		},
 		 		error:function(jqxhr, testStatus, errorThrown){
 					console.log("ajax처리실패");
 					console.log(jqxhr);
 					console.log(testStatus);
 					console.log(errorThrown);
 				 }
 		 	});
 		}
 	});
 	
 	$("#insertText").keypress(function (e) {
 		var chatText=$("#insertText").val().trim();
 		var member_id =$("[name=member_id]").val().trim();
 		
 		if(e.which == 13){
	 		if(chatText==""){
	 			alert("내용을 입력하셔야 합니다.");
	 			return false;
	 		}
	 		
	 		if(member_id ==""){
	 			alert("로그인 후 이용가능합니다.");
	 			return false;
	 		}else{
	 			$("#insertText").val('');
	 		 	$.ajax({
	 		 		url:"${pageContext.request.contextPath}/chatting/insertChat.do",
	 		 		type:"get",
	 		 		data:{
	 		 			member_id:member_id,
	 		 			chat_content:chatText
	 		 		},
	 		 		dataType:"json",
	 		 		success:function(data){
						console.log("보내기 성공 ");
	 		 			var offset = $(".chatting-comment:last").offset();
	 		 	        $("#chatting-content").animate({scrollTop : offset.top}, 400);
	 		 		},
	 		 		error:function(jqxhr, testStatus, errorThrown){
	 					console.log("ajax처리실패");
	 					console.log(jqxhr);
	 					console.log(testStatus);
	 					console.log(errorThrown);
	 				 }
	 		 	});	 			
	 		}
 		}
    });	

}) */

</script>