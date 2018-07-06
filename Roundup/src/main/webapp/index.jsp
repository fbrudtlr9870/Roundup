
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="main" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/nav.jsp">
	<jsp:param value="active" name="active1"/>
</jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>	
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>

<script>

/* master push 2018.07.06 15:03  */

//신상품불러오기
$(function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/product/selectNewProduct.do",
		dataType:"json",
		success:function(data){
			console.log(data);
			var html="";
			
			for(var i in data.productNewList){
				if(data.productNewList[i].renamedFileName!=null){	
					if(i==0){
						html+="<div class='carousel-item active new-product'><img class='d-block w-100' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productNewList[0].renamedFileName+"' height='150px' width='auto' alt='First slide'>";
					}else{					
						html += "<div class='carousel-item new-product'><img class='d-block w-100' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productNewList[i].renamedFileName+"' height='150px' width='auto' alt='Second slide'>";
					}
					html += "<div class='buy-btn'>";
					html += "<input type='hidden' value='" + data.productNewList[i].productNo +"' name='product_no'>";
		            html += "<input type='number' class='form-control inline-hyelin' style='width: 70px; margin: 0 auto;' name='product_amount' min='1' value='1'>&nbsp;";
	               /*  html += "<button type='button' class='btn-transparent-hyelin insertBasket_'>";
	                html += "<img id='img-cart-hyelin' src='${pageContext.request.contextPath}/resources/img/cart.png' alt='' class='btnImg-hyelin' title='장바구니' data-toggle='tooltip' data-placement='bottom'/>";
	                html += "</button> &nbsp;";
	                html += "<button type='button' class='btn-transparent-hyelin purchase_'>";
	                html += "<img src='${pageContext.request.contextPath}/resources/img/card.png' alt='' class='btnImg-hyelin' title='구매하기' data-toggle='tooltip' data-placement='bottom'/>";
					html += "</button>"; */
					html += "<button type='button' class='btn btn-primary insertBasket-new'>장바구니</button> &nbsp;";
	                html += "<button type='button' class='btn btn-success purchase-new'>구매</button>";
		            html += "</div>";
		            html += "<div class='ptext'>" + data.productNewList[i].brandName + "</div>"; 
		            html += "<div class='ptext'>" + data.productNewList[i].productName + "</div>";
	                html += "<div class='pprice'>" + data.productNewList[i].price + "</div></div>";
				}
			}
			
			$(".new-option").html(html);

			$(".new-product").hover(function(){
		       
		        $(this).children(".buy-btn").show();
		    },function(){
		       
		        $(this).children(".buy-btn").hide();
		    });
			

			// 장바구니에 담기
			$(".insertBasket-new").on("click",function(){
				var memberId = '${member_id}';
				if(memberId != "") {
					$.ajax({
						url:"${pageContext.request.contextPath }/basket/insertBasket.do",
						data: {
							productAmount: $(this).parent().find("[name=product_amount]").val(),
							productNo: $(this).parent().find("[name=product_no]").val(),
							memberId :memberId
						},
						success:function(data) {
							if(confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?")) {
								location.href = "${pageContext.request.contextPath }/basket/selectBasketList.do?memberId="+memberId;
							} else {
								location.href = "${pageContext.request.contextPath }";
							}
						},
						error:function(jqxhr, textStatus, errorThrown) {
			                 console.log("ajax처리실패!");
			                 console.log(jqxhr);
			                 console.log(textStatus);
			                 console.log(errorThrown);
			        	}
					});	
				} else {
					alert("로그인 후 이용하실 수 있습니다.");
				}
				
			});

			$(".purchase-new").on("click",function(){

				var productNo = $(this).parent().find("[name=product_no]").val();
				var productAmount = $(this).parent().find("[name=product_amount]").val();
				var memberId = '${member_id}';

				if(memberId != "") {
				location.href="${pageContext.request.contextPath}/purchase/buyNow.do?productNo=" + productNo + "&productAmount=" + productAmount+"&memberId="+memberId;
				} else {
					alert("로그인 후 이용하실 수 있습니다.");
				}
			});
			
		},error:function(jqxhr, textStatus, errorThrown) {
            console.log("ajax처리실패!");
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
   		}
	});
}); 

/* ------------------------------------------------- */
//인기상품불러오기
$(function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/product/selectHotProduct.do",
		dataType:"json",
		success:function(data){
			console.log(data);
			var html="";
			
			for(var i in data.productHotList){
				if(data.productHotList[i].renamedFileName!=null){	
					if(i==0){
						html+="<div class='carousel-item active hot-product'><img class='d-block w-100' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productHotList[0].renamedFileName+"' height='150px' alt='First slide'>";
					}else{					
						html += "<div class='carousel-item hot-product'><img class='d-block w-100' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productHotList[i].renamedFileName+"' height='150px' alt='Second slide'>";
					}
					html += "<div class='buy-btn'>";
					html += "<input type='hidden' value='" + data.productHotList[i].productNo +"' name='product_no'>";
		            html += "<input type='number' class='form-control inline-hyelin' style='width: 70px; margin: 0 auto;' name='product_amount' min='1' value='1'>&nbsp;";
	                html += "<button type='button' class='btn btn-primary insertBasket'>장바구니</button> &nbsp;";
	                html += "<button type='button' class='btn btn-success purchase'>구매</button>";
		            html += "</div>";
		            html += "<div class='ptext'>" + data.productHotList[i].brandName + "</div>"; 
		            html += "<div class='ptext'>" + data.productHotList[i].productName + "</div>";
	                html += "<div class='pprice'>" + data.productHotList[i].price + "</div></div>";
				}
			}
			
			$(".hot-option").html(html);

			$(".hot-product").hover(function(){
		       
		        $(this).children(".buy-btn").show();
		    },function(){
		       
		        $(this).children(".buy-btn").hide();
		    });
			
			// 장바구니 담기
			$(".insertBasket").on("click",function(){
				var memberId = '${member_id}';
				if(memberId != "") {
					$.ajax({
						url:"${pageContext.request.contextPath }/basket/insertBasket.do",
						data: {
							productAmount: $(this).parent().find("[name=product_amount]").val(),
							productNo: $(this).parent().find("[name=product_no]").val(),
							memberId :memberId
						},
						success:function(data) {
							if(confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?")) {
								location.href = "${pageContext.request.contextPath }/basket/selectBasketList.do?memberId="+memberId;
							} else {
								location.href = "${pageContext.request.contextPath }";
							}
						},
						error:function(jqxhr, textStatus, errorThrown) {
			                 console.log("ajax처리실패!");
			                 console.log(jqxhr);
			                 console.log(textStatus);
			                 console.log(errorThrown);
			        	}
					});	
				} else {
					alert("로그인 후 이용하실 수 있습니다.");
				}	

			});
			
			// 구매하기
			$(".purchase").on("click",function(){
				var productNo = $(this).parent().find("[name=product_no]").val();
				var productAmount = $(this).parent().find("[name=product_amount]").val();
				var memberId = '${member_id}';

				if(memberId != "") {
				location.href="${pageContext.request.contextPath}/purchase/buyNow.do?productNo=" + productNo + "&productAmount=" + productAmount+"&memberId="+memberId;
				} else {
					alert("로그인 후 이용하실 수 있습니다.");
				}
			});
			
		},error:function(jqxhr, textStatus, errorThrown) {
            console.log("ajax처리실패!");
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
   		}
	});
}); 
</script>

 	
      <%--  <div id="myCarousel" class="carousel slide main-slide carousel-master" data-ride="carousel">
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
      </div> --%>
   <%--  <div class="main-img-wrapper">

            <div class="main-img">
               <div class="main-category">
                    <ul class="list-group">
                        <li class="list-group-item"><a href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=1">간편식사</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=2">식품</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=3">과자류</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=4">아이스크림</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=5">즉석식품</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=6">음료</a></li>
                        <li class="list-group-item"><a href="${pageContext.request.contextPath }/product/productCategorySearch.do?categoryNo=7">생활용품</a></li>
                    </ul>
                    
                </div> 
            
                <div id="carouselExampleControls" class="carousel slide main-category-img" data-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img class="d-block w-100 main-img-one" src="${pageContext.request.contextPath }/resources/img/resource_img1.jpg" alt="First slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100 main-img-one" src="${pageContext.request.contextPath }/resources/img/resource_img2.jpg" alt="Second slide">
				    </div>
				    <div class="carousel-item">
				      <img class="d-block w-100 main-img-one" src="${pageContext.request.contextPath }/resources/img/resource_img3.jpg" alt="Third slide">
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
        </div> --%>
        <br><br>

        <!-- <h2>Hot & New</h2> -->
        <div class="main-li-container">
        
        <!-- card layout 여기에 이것저것 정보입력예정-->
   			 <div class="card-columns">
 
					  <!-- 신상품 -->
					  <div class="card mb-3 new-product-container" style="max-width: 18rem;">
						  <div class="card-body text-primary">
						    <h5 class="card-title">New 신상품</h5>
						  	<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner slide-new-master new-option"> 
							   
							  </div>
							</div>
							<br />
						  </div>
						</div>
					  
					   <!-- ----------------------- -->
					  <!-- 인기상품 -->
					   <div class="card mb-3 hot-product-container" style="max-width: 18rem;">
						  <div class="card-body text-primary">
						    <h5 class="card-title">Hot 인기상품</h5>
						  	<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner slide-new-master hot-option"> 
							   
							  </div>
							</div>
							<br />
						  </div>
						</div>
					   <!-- ----------------------- -->
					 <div class="card">
					    <div class="card-body text-info">
					      <h5 class="card-title">이벤트</h5>
					      <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
						  <div class="carousel-inner slide-hot-master"> 
						    <div class="carousel-item active">
						      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/img/event/event1.jpg" height="300px" alt="First slide">
						    </div>
						    <div class="carousel-item">
						      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/img/event/event2.jpg" height="300px" alt="Second slide">
						    </div>
						    <div class="carousel-item">
						      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/img/event/event3.jpg" height="300px" alt="Third slide">
						    </div>
						    <div class="carousel-item">
						      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/img/event/event4.jpg" height="300px" alt="Third slide">
						    </div>
						    <div class="carousel-item">
						      <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/img/event/event5.jpg" height="300px" alt="Third slide">
						    </div>
						  </div>
						</div>
					    </div>
					  </div>
					 
					 
				</div> 
			  <!-- ----------card layout end------------- -->
			  <div class="row">
			  		 <div class="col-md-4">
			              <div class="card mb-4 box-shadow">
			                <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner slide-new-master hot-option"> 
							   
							  </div>
							</div>
			                <div class="card-body">
			                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			                  <div class="d-flex justify-content-between align-items-center">
			                    <div class="btn-group">
			                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                    </div>
			                    <small class="text-muted">9 mins</small>
			                  </div>
			                </div>
			              </div>
			            </div>
			            <div class="col-md-4">
			              <div class="card mb-4 box-shadow">
			                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
			                <div class="card-body">
			                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			                  <div class="d-flex justify-content-between align-items-center">
			                    <div class="btn-group">
			                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                    </div>
			                    <small class="text-muted">9 mins</small>
			                  </div>
			                </div>
			              </div>
			            </div>
			            <div class="col-md-4">
			              <div class="card mb-4 box-shadow">
			                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&bg=55595c&fg=eceeef&text=Thumbnail" alt="Card image cap">
			                <div class="card-body">
			                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			                  <div class="d-flex justify-content-between align-items-center">
			                    <div class="btn-group">
			                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
			                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
			                    </div>
			                    <small class="text-muted">9 mins</small>
			                  </div>
			                </div>
			              </div>
			            </div>
			         </div>  
			  </div>
			 
		<!-- main-li-container end -->
        <!-- <h2>Hot & New</h2>
        <div class="main-li-container" id="NewProductList">

        </div> -->
        <br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>