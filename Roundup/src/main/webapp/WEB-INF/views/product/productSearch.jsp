<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="검색결과" name="pageTitle"/>
</jsp:include>
${searchKeyword }
<script>
$(function(){
	var bloginfo=${bloginfo};
	console.log(bloginfo);
	var p1=$("#blog1");
	p1.html("<a href="+bloginfo.items[0].link+">"+bloginfo.items[0].title+"</a>");
	var p2=$("#blog2");
	p2.html("<a href="+bloginfo.items[1].link+">"+bloginfo.items[1].title+"</a>");
	var p3=$("#blog3");
	p3.html("<a href="+bloginfo.items[2].link+">"+bloginfo.items[2].title+"</a>");
	var p4=$("#blog4");
	p4.html("<a href="+bloginfo.items[3].link+">"+bloginfo.items[3].title+"</a>");
	var p5=$("#blog5");
	p5.html("<a href="+bloginfo.items[4].link+">"+bloginfo.items[4].title+"</a>");
});
</script>
<div class="blog-container">
                <h4>네이버 블로그</h4>                
                <p id="blog1"></p><a href=""></a>
                <p id="blog2"></p>
                <p id="blog3"></p>
                <p id="blog4"></p>                
                <p id="blog5"></p>                
            </div>
            <br><br>
            <div class="search-div">
                <form action="${pageContext.request.contextPath}/product/reSearch.do">
                    <h4>브랜드</h4> 
                    <input type="hidden" name="searchKeyword" value="${searchKeyword }"/>
                    <input class="form-check-input" type="checkbox" name="brand" value="CU"> CU &nbsp;
                    <input class="form-check-input" type="checkbox" name="brand" value="GS25"> GS25 &nbsp;
                    <input class="form-check-input" type="checkbox" name="brand" value="7ELEVEN"> 7ELEVEN &nbsp;
                    <input class="form-check-input" type="checkbox" name="brand" value="MINISTOP"> MINISTOP &nbsp;
                    <input class="form-check-input" type="checkbox" name="brand" value="EMART24"> EMART24
                    <br />
                    <select name="categoryselect" id="category">
                    	<option id="category" name="category" vlaue="1">간편식사</option>
                    	<option id="category" name="category" vlaue="7">-김밥</option>
                    	<option id="category" name="category" vlaue="27">--삼각김밥</option>
                    	<option id="category" name="category" vlaue="28">--원형김밥</option>
                    	<option id="category" name="category" vlaue="8">-도시락</option>
                    	<option id="category" name="category" vlaue="29">--고기</option>
                    	<option id="category" name="category" vlaue="30">--치킨</option>
                    	<option id="category" name="category" vlaue="9">-샌드위치</option>
                    	<option id="category" name="category" vlaue="10">-햄버거</option>
                    	<option id="category" name="category" vlaue="2">식품</option>
                    	<option id="category" name="category" vlaue="11">-컵밥/국</option>
                    	<option id="category" name="category" vlaue="12">-라면</option>
                    	<option id="category" name="category" vlaue="31">--컵라면</option>
                    	<option id="category" name="category" vlaue="32">--봉지라면</option>
                    	<option id="category" name="category" vlaue="13">-냉동식품</option>
                    	<option id="category" name="category" vlaue="33">--치킨</option>
                    	<option id="category" name="category" vlaue="34">--피자</option>
                    	<option id="category" name="category" vlaue="35">--만두</option>
                    	<option id="category" name="category" vlaue="36">--돼지고기</option>
                    	<option id="category" name="category" vlaue="14">-냉장식품</option>
                    	<option id="category" name="category" vlaue="37">--가공식품</option>
                    	<option id="category" name="category" vlaue="38">--안주</option>
                    	<option id="category" name="category" vlaue="39">--식재료</option>
                    	<option id="category" name="category" vlaue="3">과자류</option>
                    	<option id="category" name="category" vlaue="15">-껌/사탕/초코</option>
                    	<option id="category" name="category" vlaue="16">-박스과자</option>
                    	<option id="category" name="category" vlaue="17">-봉지과자</option>
                    	<option id="category" name="category" vlaue="4">아이스크림</option>
                    	<option id="category" name="category" vlaue="18">-바</option>
                    	<option id="category" name="category" vlaue="19">-콘</option>
                    	<option id="category" name="category" vlaue="20">-컵</option>
                    	<option id="category" name="category" vlaue="5">즉석식품</option>
                    	<option id="category" name="category" vlaue="21">-튀김</option>
                    	<option id="category" name="category" vlaue="22">-빵</option>
                    	<option id="category" name="category" vlaue="6">음료</option>
                    	<option id="category" name="category" vlaue="23">-유제품</option>
                    	<option id="category" name="category" vlaue="24">-캔</option>
                    	<option id="category" name="category" vlaue="25">-페트</option>
                    	<option id="category" name="category" vlaue="26">-유리</option>
                    </select>
                    <h4>가격대</h4>
                    <input type="number" name="price1" min="0" step="500"> ~ <input type="number" name="price2" step="500">
                    <br><br>
                    <input type="submit"class="btn btn-success" value="검색">
                </form>
            </div>
            <br><br>
            
            
            <div class="main-li-container">
            	<c:forEach var="p" items="${searchList }" varStatus="vs">
	                <li class="main-li">
	                    <img src="${pageContext.request.contextPath}/resources/img/test1.png">이미지 아직없으요
	                    <div class="product-text">
	                     <div class="ptext">${p.brandName }</div>
	                     <div class="ptext">${p.productName }</div>
	                     <div class="pprice">${p.price }원</div>
	                    </div> 
	                    <div class="buy-btn">
	                            <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
	                            <button type="button" class="btn btn-success">구매</button>
	                    </div>
	                </li>            	
            	</c:forEach>
                </div>
                <br><br>
<script>
$(".main-li").mouseenter(function(){
	$(".buy-btn").css("display","block");
});
$(".main-li").mouseleave(function(){
	$(".buy-btn").css("display","none");
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>