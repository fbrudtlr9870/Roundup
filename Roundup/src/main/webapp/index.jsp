<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="main" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>	

<script>

/* 2018.06.27 11:40 master 병합완료  */

$(function(){
	// 상품 리스트 불러오기
	$.ajax({
		url:"${pageContext.request.contextPath}/product/selectNewProduct.do",
		dataType:"json",
		success:function(data) {
			var html = "<ul class='list-group inline-hyelin'>";
			
			for(var i in data.productList) {
				html += "<li class='main-li'>";
				html += "<img src='${pageContext.request.contextPath}/resources/upload/productFile/" + data.productList[i].renamedFileName + "'>";
				html += "<div class='buy-btn'>";
				html += "<input type='hidden' value='" + data.productList[i].productNo +"' name='product_no'>";
				html += "<input type='number' class='form-control inline-hyelin' style='width: 70px; margin: 0 auto;' name='product_amount' min='1' value='1'>&nbsp;";
                html += "<button type='button' class='btn btn-primary insertBasket'>장바구니</button> &nbsp;";
                html += "<button type='button' class='btn btn-success purchase'>구매</button>";
				html += "</div>";
				html += "<div class='ptext'>" + data.productList[i].brandName + "</div>"; 
				html += "<div class='ptext'>" + data.productList[i].productName + "</div>";
                html += "<div class='pprice'>" + data.productList[i].price + "</div>";
                html += "</li>";
			}
			html += "</ul>";
			
			$("#NewProductList").html(html);
			
			$(".main-li").hover(function(){
		        $(this).css("border","1px solid black");
		        $(this).children(".buy-btn").show();
		    },function(){
		        $(this).css("border","1px solid lightgray");
		        $(this).children(".buy-btn").hide();
		    });
			
			// 장바구니에 담기
			$(".insertBasket").on("click",function(){
				$.ajax({
					url:"${pageContext.request.contextPath }/basket/insertBasket.do",
					data: {
						productAmount: $(this).parent().find("[name=product_amount]").val(),
						productNo: $(this).parent().find("[name=product_no]").val(),
						memberId :"${memberLoggedIn.member_id}"
					},
					success:function(data) {
						if(confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?")) {
							location.href = "${pageContext.request.contextPath }/basket/selectBasketList.do?memberId=${memberLoggedIn.member_id}";
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
			});

			$(".purchase").on("click",function(){
				var productNo = $(this).parent().find("[name=product_no]").val();
				var productAmount = $(this).parent().find("[name=product_amount]").val();

				location.href="${pageContext.request.contextPath}/purchase/buyNow.do?productNo=" + productNo + "&productAmount=" + productAmount;
			});  
		},
		error:function(jqxhr, textStatus, errorThrown) {
                 console.log("ajax처리실패!");
                 console.log(jqxhr);
                 console.log(textStatus);
                 console.log(errorThrown);
        }
	});
	
});

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
				      <img class="d-block w-100 main-img-one" src="${pageContext.request.contextPath }/resources/img/hotdog.jpg" alt="Second slide">
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
        </div>1
        <br><br>

        <!-- <h2>Hot & New</h2> -->
        <div class="main-li-container">
        
        <!-- card layout 여기에 이것저것 정보입력예정-->
   
                 

        <h2>Hot & New</h2>
        <div class="main-li-container" id="NewProductList">

        </div>
        <br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>