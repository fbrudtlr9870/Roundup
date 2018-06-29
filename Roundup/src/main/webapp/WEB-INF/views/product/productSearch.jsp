<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="검색결과" name="pageTitle"/>
</jsp:include>
<script>
$(function(){
   var bloginfo=${bloginfo};
   console.log(bloginfo);
   var p1=$("#blog1");
   p1.html("<a href="+bloginfo.items[0].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[0].title+"</a>");
   var p2=$("#blog2");
   p2.html("<a href="+bloginfo.items[1].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[1].title+"</a>");
   var p3=$("#blog3");
   p3.html("<a href="+bloginfo.items[2].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[2].title+"</a>");
   var p4=$("#blog4");
   p4.html("<a href="+bloginfo.items[3].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[3].title+"</a>");
   var p5=$("#blog5");
   p5.html("<a href="+bloginfo.items[4].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[4].title+"</a>");
});
function search(){
   $(".search-div").show();
}
function searchClose(){
   $(".search-div").hide();
}
$(".main-li").mouseenter(function(){
	$(this).children(".buy-btn").css("display","block");
	$(this).css("opacity","1.0");
});
$(".main-li").mouseleave(function(){
	$(this).children(".buy-btn").css("display","none");
	$(this).css("opacity","0.85");
});

$(function () {
	  $('[data-toggle="tooltip"]').tooltip();
});
</script>
<style>
/* div.main-li-container li.CU {
	background: rgb(195, 148, 212);
	opacity: 0.85;
}

div.main-li-container li.7ELEVEN {
	background: rgb(27, 147, 42);
	opacity: 0.85;
}

div.main-li-container li.GS25 {
	background: rgb(203, 238, 243);
	opacity: 0.85;
}

div.main-li-container li.MINISTOP {
	background: rgb(255, 190, 204);
	opacity: 0.85;
}

div.main-li-container li.EMART24 {
	background: rgb(255, 223, 104);
	opacity: 0.85;
}
 */
div#searchContainer-hyelin {
	width: 980px;
	margin: 0 auto;
}

img.prod-img-hyelin {
	width: 280px;
	height: 280px;
}

div.card-hyelin {
	width: 320px;
	display: inline-block;
	position: relative;
}

p.card-text-hyelin {
	font-size: 20px;	
}

div.btnDiv-hyelin {
	opacity: 0;
	position: absolute;
	top: 120px;
	margin: 0 auto;
	left: 80px;
}

div.card-hyelin:hover div.btnDiv-hyelin {
	opacity: 1;
	z-index: 20;
}

div.card-body:hover img.prod-img-hyelin{
	opacity: 0.5;
}

div.btnDiv-hyelin img {
	width: 70px;
	border-radius: 50px;
}

img#img-cart-hyelin{
	margin-right: 20px;
}

label.label-bgWhite-hyelin {
	background: #fff !important;
	width: 100px;
}

select.select-hyelin {
	width: 120px;
}

div#detailContainer-hyelin {
	width: 980px;
	margin: 0 auto;
}

img.btnImg-hyelin {
	cursor: pointer;
}
</style>
   <div id="searchContainer-hyelin">
	<c:forEach var="p" items="${searchList }" varStatus="vs">
		<div class="card card-hyelin">
			<div class="card-body">
				<img src="${pageContext.request.contextPath}/resources/upload/productFile/${p.renamedFileName}" class="prod-img-hyelin">
				<h5 class="card-title">${p.brandName } ${p.productName }</h5>
				<p class="card-text card-text-hyelin"><fmt:formatNumber value="${p.price }" type="currency" currencySymbol=""/>원</p>
				<div class="btnDiv-hyelin">
					<img id="img-cart-hyelin" src="${pageContext.request.contextPath}/resources/img/cart.png" alt="" class="btnImg-hyelin" title="장바구니" data-toggle="tooltip" data-placement="bottom"/>
					<img src="${pageContext.request.contextPath}/resources/img/card.png" alt="" class="btnImg-hyelin" title="구매하기" data-toggle="tooltip" data-placement="bottom"/>						
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<a href="${pageContext.request.contextPath}/product/mailTest.do">이메일테스트페이지</a>
<h2>키워드 - ${searchKeyword }</h2>
<div class="searchbtn">
	<button class="btn btn-success" onclick="search();">상세검색</button>
</div>
<br />
<div class="search-div">
	<form action="${pageContext.request.contextPath}/product/reSearch.do">
		<br />
		<h4>브랜드</h4>
		<input type="hidden" name="searchKeyword" value="${searchKeyword }" />
		<input class="form-check-input" type="hidden" name="brand" value="all">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="form-check-input" type="checkbox" name="brand"
			value="CU" id="CU"><label for="CU">CU</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="form-check-input"
			type="checkbox" name="brand" value="GS25" id="GS25"><label
			for="GS25">GS25</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
			class="form-check-input" type="checkbox" name="brand" value="7ELEVEN"
			id="7ELEVEN"><label for="7ELEVEN">7ELEVEN</label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input class="form-check-input"
			type="checkbox" name="brand" value="MINISTOP" id="MINISTOP"><label
			for="MINISTOP">MINISTOP</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
			class="form-check-input" type="checkbox" name="brand" value="EMART24"
			id="EMART24"><label for="EMART24">EMART24</label> <br />
		<h4>카테고리</h4>
		<select name="categoryselect" id="category" class="form-control"
			style="width: 50%;">
			<option id="category" name="category" value="0" selected>카테고리</option>
			<option id="category" name="category" value="1">간편식사</option>
			<option id="category" name="category" value="7">-김밥</option>
			<option id="category" name="category" value="27">--삼각김밥</option>
			<option id="category" name="category" value="28">--원형김밥</option>
			<option id="category" name="category" value="8">-도시락</option>
			<option id="category" name="category" value="29">--고기</option>
			<option id="category" name="category" value="30">--치킨</option>
			<option id="category" name="category" value="9">-샌드위치</option>
			<option id="category" name="category" value="10">-햄버거</option>
			<option id="category" name="category" value="2">식품</option>
			<option id="category" name="category" value="11">-컵밥/국</option>
			<option id="category" name="category" value="12">-라면</option>
			<option id="category" name="category" value="31">--컵라면</option>
			<option id="category" name="category" value="32">--봉지라면</option>
			<option id="category" name="category" value="13">-냉동식품</option>
			<option id="category" name="category" value="33">--치킨</option>
			<option id="category" name="category" value="34">--피자</option>
			<option id="category" name="category" value="35">--만두</option>
			<option id="category" name="category" value="36">--돼지고기</option>
			<option id="category" name="category" value="14">-냉장식품</option>
			<option id="category" name="category" value="37">--가공식품</option>
			<option id="category" name="category" value="38">--안주</option>
			<option id="category" name="category" value="39">--식재료</option>
			<option id="category" name="category" value="3">과자류</option>
			<option id="category" name="category" value="15">-껌/사탕/초코</option>
			<option id="category" name="category" value="16">-박스과자</option>
			<option id="category" name="category" value="17">-봉지과자</option>
			<option id="category" name="category" value="4">아이스크림</option>
			<option id="category" name="category" value="18">-바</option>
			<option id="category" name="category" value="19">-콘</option>
			<option id="category" name="category" value="20">-컵</option>
			<option id="category" name="category" value="5">즉석식품</option>
			<option id="category" name="category" value="21">-튀김</option>
			<option id="category" name="category" value="22">-빵</option>
			<option id="category" name="category" value="6">음료</option>
			<option id="category" name="category" value="23">-유제품</option>
			<option id="category" name="category" value="24">-캔</option>
			<option id="category" name="category" value="25">-페트</option>
			<option id="category" name="category" value="26">-유리</option>
		</select>
		<h4>가격대</h4>
		<input type="number" name="price1" min="0" step="500" value="0"
			class="form-control" style="width: 200px; display: inline-block;">
		~ <input type="number" name="price2" min="0" step="500" value="0"
			class="form-control" style="width: 200px; display: inline-block;">
		<br>
		<br> <input type="submit" class="btn btn-success" value="검색">
		<input type="button" class="btn btn-success" value="닫기"
			onclick="searchClose();" /> <br />
		<br />
	</form>
</div>
<br>
<br>


<%-- <div class="main-li-container">
	<c:forEach var="p" items="${searchList }" varStatus="vs">
		<li class="main-li ${p.brandName }"><img
			src="${pageContext.request.contextPath}/resources/upload/productFile/${p.renamedFileName}"><br />
			<div class="product-text">
				<div class="ptext brandName" id="brandName">${p.brandName }</div>
				<div class="ptext productName">${p.productName }</div>
				<div class="pprice">${p.price }원</div>
			</div>
			<div class="buy-btn">
				<button type="button" class="btn btn-primary">장바구니</button>
				&nbsp;
				<button type="button" class="btn btn-success">구매</button>
			</div></li>
	</c:forEach>
</div> --%>
<br>
<br>
<div class="blog-container">
	<div class="blogtext-container">
		<img
			src="${pageContext.request.contextPath}/resources/img/blogimg.GIF"
			alt="" class="blogimg" /> <input type="text" readonly="readonly"
			value="  ${searchKeyword } 후기" class="blogtext" />
	</div>
	<br />
	<!--  <h4>네이버 블로그</h4>    -->
	<p id="blog1"></p>
	<hr />
	<p id="blog2"></p>
	<hr />
	<p id="blog3"></p>
	<hr />
	<p id="blog4"></p>
	<hr />
	<p id="blog5"></p>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>