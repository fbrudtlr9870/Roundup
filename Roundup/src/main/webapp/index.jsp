<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="메인" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>	
<script>
/* master병합 2018.06.25. 09:25 */
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
        <!-- <h2>Hot & New</h2> -->
        <div class="main-li-container">
        
        <!-- card layout 여기에 이것저것 정보입력예정-->
    <%--      <div class="card-columns">
					  <div class="card">
					    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/test1.png" alt="Card image cap">
					    <div class="card-body">
					      <h5 class="card-title">Card title that wraps to a new line</h5>
					      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
					    </div>
					  </div>
					  
					  <div class="card p-3">
					    <blockquote class="blockquote mb-0 card-body">
					      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
					      <footer class="blockquote-footer">
					        <small class="text-muted">
					          Someone famous in <cite title="Source Title">Source Title</cite>
					        </small>
					      </footer>
					    </blockquote>
					  </div>
					  <div class="card">
					    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/test1.png" alt="Card image cap">
					    <div class="card-body">
					      <h5 class="card-title">Card title</h5>
					      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
					      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					    </div>
					  </div>
					  <div class="card bg-primary text-white text-center p-3">
					    <blockquote class="blockquote mb-0">
					      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat.</p>
					      <footer class="blockquote-footer">
					        <small>
					          Someone famous in <cite title="Source Title">Source Title</cite>
					        </small>
					      </footer>
					    </blockquote>
					  </div>
					  <div class="card text-center">
					    <div class="card-body">
					      <h5 class="card-title">Card title</h5>
					      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
					      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					    </div>
					  </div>
					  <div class="card">
					    <img class="card-img" src="${pageContext.request.contextPath}/resources/img/test1.png" alt="Card image" style="height:auto; width:300px;">
					  </div>
					  <div class="card p-3 text-right">
					    <blockquote class="blockquote mb-0">
					      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
					      <footer class="blockquote-footer">
					        <small class="text-muted">
					          Someone famous in <cite title="Source Title">Source Title</cite>
					        </small>
					      </footer>
					    </blockquote>
					  </div>
					  <div class="card">
					    <div class="card-body">
					      <h5 class="card-title">Card title</h5>
					      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
					      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
					    </div>
					  </div>
				</div> --%>
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