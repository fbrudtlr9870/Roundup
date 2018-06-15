<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Main" name="pageTitle"/>
</jsp:include>
<script>
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
                <div class="main-category-img" >
                    <img src="${pageContext.request.contextPath }/resources/img/main-display.png" alt="" class="main-img-one">
                </div>
            </div>
        </div>
        <br><br>
        <h2>Hot & New</h2>
        <div class="main-li-container">
                    <li class="main-li">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.png">
                            <div class="buy-btn">
                                <button type="button" class="btn btn-primary"><a href="basket.html" style="color:white">장바구니</a></button> &nbsp;
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
        </div>
        <br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>