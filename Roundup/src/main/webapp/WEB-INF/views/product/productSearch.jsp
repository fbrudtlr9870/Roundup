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
                <form action="">
                    <h4>브랜드</h4> 
                    <input class="form-check-input" type="checkbox" name="brand" id=""> cu &nbsp;
                    <input class="form-check-input" type="checkbox" name="brand" id=""> gs25 &nbsp;
                    <input class="form-check-input" type="checkbox" name="brand" id=""> 7-11 &nbsp;
                    <input class="form-check-input" type="checkbox" name="brand" id=""> mini &nbsp;
                    <input class="form-check-input" type="checkbox" name="brand" id=""> emart24
                    <h4>가격대</h4>
                    <input type="number" name="" min="0"> ~ <input type="number" name="">
                    <br><br>
                    <input type="submit"class="btn btn-success" value="검색">
                </form>
            </div>
            <br><br>
            
            <div class="main-li-container">
            ${searchList }
                        <li class="main-li">
                            <img src="img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                        <li class="main-li">
                            <img src="img/test1.png">
                            <div class="buy-btn">
                                    <button type="button" class="btn btn-primary">장바구니</button> &nbsp;
                                    <button type="button" class="btn btn-success">구매</button>
                                </div>
                            <div class="ptext">GS25</div>
                            <div class="ptext">핑크죠스바</div>
                            <div class="pprice">1,000원</div>
                        </li>
                </div>
                <br><br>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>