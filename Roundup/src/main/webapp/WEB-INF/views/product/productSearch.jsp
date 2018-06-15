<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="검색결과" name="pageTitle"/>
</jsp:include>
${searchKeyword }
<div class="blog-container">
                <h4>네이버 블로그</h4>
                <p>CU에 대해 알아보...</p>
                <p>CU에 대해 알아보...</p>
                <p>CU에 대해 알아보...</p>
                <p>CU에 대해 알아보...</p>
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