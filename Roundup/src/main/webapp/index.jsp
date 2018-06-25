<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="메인" name="pageTitle"/>
</jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>	
<script>
/* master병합 2018.06.22. 12:00 */
$(function(){
    $(".main-li").hover(function(){
        $(this).css("border","1px solid black");
        $(this).children(".buy-btn").show();
    },function(){
        $(this).css("border","1px solid lightgray");
        $(this).children(".buy-btn").hide();
    });
})
</script>

<!-- <nav class="nav-list">
     <div class="nav-list-wrapper">
           <ul class="nav nav-tabs nav-justified">
               <li role="presentation" class="active"><a href="#">카테고리</a></li>
               <li role="presentation"><a href="#">행사</a></li>
               <li role="presentation"><a href="notice.html">공지사항</a></li>
               <li role="presentation"><a href="./freeboard/freeBoardList.do">게시판</a></li>
               <li role="presentation"><a href="#">1:1문의</a></li>
           </ul> 
           <ul class="nav nav-tabs justify-content-center">
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
			    <a class="nav-link" href="./freeboard/freeBoardList.do">게시판</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">1:1문의</a>
			  </li>
			</ul>
			
     </div>
     
 </nav> -->
 
    <div class="main-img-wrapper">
            <div class="main-img">
               <div class="main-category">
                    <ul class="list-group">
                        <li class="list-group-item"><a href="select1.html">간편식사</a></li>
                        <li class="list-group-item">즉석조리</li>
                        <li class="list-group-item">과자류</li>
                        <li class="list-group-item">아이스크림</li>
                        <li class="list-group-item">식품</li>
                        <li class="list-group-item">음료</li>
                        <li class="list-group-item">생활용품</li>
                    </ul>
                    
                </div> 
            
                <div id="carouselExampleControls" class="carousel slide main-category-img" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img class="d-block w-100 main-img-one" src="${pageContext.request.contextPath }/resources/img/main-display.png" alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100 main-img-one" src="${pageContext.request.contextPath }/resources/img/suzyy.jpg" alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100 main-img-one" src="${pageContext.request.contextPath }/resources/img/게스 컴퓨터바탕화면 2.jpg" alt="Third slide">
				    </div>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
            </div>
        </div>
        <br><br>
        <h2>Hot & New</h2>
        <div class="main-li-container">
                    <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                <button type="button" class="btn btn-success">구매</button>
                            </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                           <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                           <div class="buy-btn">
                                   <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                   <button type="button" class="btn btn-success">구매</button>
                               </div>
                           <div class="ptext">GS25</div>
                           <div class="ptext">핑크죠스바</div>
                           <div class="pprice">1,000원</div>
                       </li>
                       <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
            </ul>
        </div>
        <br><br>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>