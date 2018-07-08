
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="main" name="pageTitle"/>
</jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>	
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>

<script>

/* master push 2018.07.08 20:47   */

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
						html+="<div class='carousel-item active new-product'><img class='d-block' style='margin:0 auto;' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productNewList[0].renamedFileName+"' height='150px' width='150px' alt='First slide'>";
					}else{					
						html += "<div class='carousel-item new-product'><img class='d-block' style='margin:0 auto;' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productNewList[i].renamedFileName+"' height='150px' width='150px' alt='Second slide'>";
					}
					html += "<div class='buy-btn'>";
					html += "<input type='hidden' value='" + data.productNewList[i].productNo +"' name='product_no'>";
		            html += "</div>";
		            html += "<div class='ptext' style='font-size:19px;'>" + data.productNewList[i].brandName + "</div>"; 
		            html += "<div class='ptext' style='font-size:23px;'>" + data.productNewList[i].productName + "</div>";
	                html += "<div class='pprice' style='font-size:20px;float:right;'>" + data.productNewList[i].price + "원</div>";
	                html+="</br>";
					html+="<input type='number' class='form-control inline-hyelin' style='width:70px; margin:0 auto;position:relative;top:-2.5px;' name='product_amount' min='1' value='1'>";
				  	html+="<div class='btn-group' role='group' aria-label='Basic example' style='text-align:center'>";
					html+="<button type='button' class='btn btn-primary insertBasket-new'>장바구니</button>";
					html+="<button type='button' class='btn btn-success purchase-new'>구매</button>";
					html+="</div></div>";
				}
			}
			
			$(".new-option").html(html);

			$(".insertBasket-new").on("click",function(){
				var memberId = '${member_id}';
				if(memberId != "") {
					$.ajax({
						url:"${pageContext.request.contextPath }/basket/insertBasket.do",
						data: {
							productAmount: $(this).parent().parent().find("[name=product_amount]").val(),
							productNo: $(this).parent().parent().find("[name=product_no]").val(),
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

				var productNo = $(this).parent().parent().find("[name=product_no]").val();
				var productAmount = $(this).parent().parent().find("[name=product_amount]").val();
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
						html+="<div class='carousel-item active new-product'><img class='d-block' style='margin:0 auto;' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productHotList[0].renamedFileName+"' height='150px' width='150px' alt='First slide'>";
					}else{					
						html += "<div class='carousel-item new-product'><img class='d-block' style='margin:0 auto;' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productHotList[i].renamedFileName+"' height='150px' width='150px' alt='Second slide'>";
					}
					html += "<div class='buy-btn'>";
					html += "<input type='hidden' value='" + data.productHotList[i].productNo +"' name='product_no'>";
		            html += "</div>";
		            html += "<div class='ptext' style='font-size:19px;'>" + data.productHotList[i].brandName + "</div>"; 
		            html += "<div class='ptext' style='font-size:23px;'>" + data.productHotList[i].productName + "</div>";
	                html += "<div class='pprice' style='font-size:20px;float:right;'>" + data.productHotList[i].price + "원</div>";
	                html+="</br>";
					html+="<input type='number' class='form-control inline-hyelin' style='width:70px; margin:0 auto;position:relative;top:-2.5px;' name='product_amount' min='1' value='1'>";
				  	html+="<div class='btn-group' role='group' aria-label='Basic example' style='text-align:center'>";
					html+="<button type='button' class='btn btn-primary insertBasket'>장바구니</button>";
					html+="<button type='button' class='btn btn-success purchase'>구매</button>";
					html+="</div></div>";
				}
			}
			
			$(".hot-option").html(html);

			$(".insertBasket").on("click",function(){
				var memberId = '${member_id}';
				if(memberId != "") {
					$.ajax({
						url:"${pageContext.request.contextPath }/basket/insertBasket.do",
						data: {
							productAmount: $(this).parent().parent().find("[name=product_amount]").val(),
							productNo: $(this).parent().parent().find("[name=product_no]").val(),
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
				var productNo = $(this).parent().parent().find("[name=product_no]").val();
				var productAmount = $(this).parent().parent().find("[name=product_amount]").val();
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

<br><br>
<div id="myCarousel" class="carousel slide main-slide carousel-master"
	data-ride="carousel">
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
	<a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
	</a>
</div>
<!-- <h2>Hot & New</h2> -->
<div class="main-li-container">
	<!-- 신상품 시작 -->
	<div class="row featurette"
		style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;">
		<div class="col-md-7">
			<p class="featurette-heading" style="font-family: 'Do Hyeon', sans-serif; font-size: 40px;">
				<img src="${pageContext.request.contextPath }/resources/img/new (1).png" alt="" />신상품을 만나보세요 
			</p>
			<p class="lead" style="font-size: 30px;">각 편의점에 등록되는 신상품을 한번에
				모아보세요</p>
		</div>
		<!-- 신상품  Ajax start-->
		<div class="new-product-card-master product-container w3-card-4">
			<div class="w3-container w3-center w3-lobster">
				<h3>
					<img src="${pageContext.request.contextPath }/resources/img/new (1).png" alt="" />
				</h3>
				<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner slide-new-master new-option"></div>
				</div>
			</div>
			<br />
		</div>
		<!-- 신상품  ajax end-->
	</div>

	<hr class="featurette-divider">
	<!-- 인기상품  -->
	<div class="row featurette" style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;">
		<div class="col-md-7 order-md-2">
			<p class="featurette-heading"
				style="font-family: 'Do Hyeon', sans-serif; font-size: 40px;">
				인기상품을 만나보세요 <img src="${pageContext.request.contextPath }/resources/img/best-seller.png" alt="" />
			</p>
			<p class="lead" style="font-size: 30px;">
				가장 인기있는 상품을 만나보세요. <br />가장많이 구매한 상품들 입니다.
			</p>
		</div>
		<!-- 인기상품  ajax start-->
		<div class="hot-product-card-master product-container w3-card-4">
			<div class="w3-container w3-center w3-lobster">
				<h3>
					<img src="${pageContext.request.contextPath }/resources/img/best-seller.png" alt="" />
				</h3>
				<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner slide-new-master hot-option"></div>
				</div>
			</div>
			<br />
		</div>
		<!-- 인기상품  ajax end-->
	</div>
</div>

<br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>