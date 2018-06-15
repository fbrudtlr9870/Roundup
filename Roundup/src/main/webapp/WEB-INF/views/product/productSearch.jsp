<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
html,body{
    min-height:100%;
}
div#main-container{
    min-width:100%;
    position: relative;
}
nav.nav-bar{
    width:980px;
    height:150px;
    margin: 0 auto;
    display: block;
}
div.nav-bar-wrapper{
    position: relative;
    width:980px;
    height:110px;
    margin:0 auto;
}
a.nav-bar-logo{
    position: absolute;
    top: 60px;
    display: inline-block;
    font-size: 30px;
    color:pink;
    font-weight: bold;
}
ul.nav-bar-site{
    right:0;
    top:20px;
    position: absolute;
    list-style-type: none;
}
li.nav-bar-site-li{
   list-style-type: none;
   display: inline-block;
   padding: 0 14px;
}

fieldset.nav-search{
    position: absolute;
    top: 65px;
    left:230px;
    width:900px;
}

ul.nav-bar-list{
    position: absolute;
    top:100px;
    left:200px;
    height:30px;
}
div.nav-bar-btn{
    position: absolute;
    top: 65px;
    right:0;
}
div.main-img-wrapper{
    background: lightblue;
    width:100%;
    height:500px;
}
div.main-img{
    width:980px;
    height:500px;
    margin:0 auto;
}
img.main-img-one{
    width:784px;
    height:500px;
}

nav.nav-list{
    width:980px;
    margin:0 auto;
}
div.nav-list-wrapper{
    position: relative;
    width:980px;
    margin:0 auto;
}

div.main-img-wrapper{
    background: lightblue;
    width:100%;
    height:500px;
}
div.main-img{
    width:980px;
    height:500px;
    position: relative;
    margin:0 auto;
}
div.main-category{
    width:100%;
    height:500px;
    border: 1px lightgray solid;
    background: white;
    position: relative;
    float: left;
    display: none;
}
div.rank-img-one{
    width:50%;
    height:500px;
    background: lightgreen;
    float: left;
}
div.rank-img-two{
    width:50%;
    height:500px;
    background:lightcoral;
    float: left;
}
div.rank-img{
    width:100%;
    height:100px;
    background: lemonchiffon;
}
div.search-div{
    width:980px;
    margin:0 auto;
    border: 1px solid lightgray;
    text-align: center;
}

div.main-li-container{
    width:980px;
    margin:0 auto;
    position: relative;
    overflow: hidden;
    border:1px solid lightgray;
}

ul.main-ul{
    list-style-type: none;
}

li.main-li:first-child{
    margin:0;
}
li.main-li:last-child{
    border-bottom: 0px;
}
li.main-li:nth-child(3n){
    border-bottom: 1px solid lightgray;
}
li.main-li:nth-child(3n+1){
    border-right: 1px solid lightgray;
    border-bottom: 1px solid lightgray;
}
li.main-li:nth-child(3n+2){
    border-right: 1px solid lightgray;
    border-bottom: 1px solid lightgray;
}

li.main-li{
    width:326px;
    height:400px;
    float: left;
    list-style: none;
    
}

li.main-li img{
    width:320px;
    height:250px;
}
li.main-li div.ptext{
   font-size: 20px;
   width:100px;
   padding:5px;
}
li.main-li div.pprice{
   font-size: 20px;
   width:100px;
   padding:5px;
}

div.blog-container{
    width:980px;
    margin:0 auto;
    border: 1px solid lightgray;
}
div.buy-btn{
    text-align: center;
    display: none;
}
footer{
    clear: both;
    position: relative;
    width:100%;
    background: lightgray;
}
footer p {
    margin:0 auto;
    width:980px;
    text-align: left;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="??" name="pageTitle"/>
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