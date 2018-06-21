<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록 페이지</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
body{
    font-family: 'Nanum Gothic', sans-serif;
    background-color:rgb(228, 228, 228);
    font-weight:bold;
}
.table{
    font-family: 'Nanum Gothic', sans-serif;
    border: 1px solid gray;
    border-radius: 8px;
    border-spacing: 2px;
    color:rgb(126, 126, 126);
    margin:5px;
    background-color: rgb(228, 228, 228);
    size:50px;
    padding:15px;
}
#productAdd{
    display:inline;
    color: rgb(68, 68, 68);
    border-radius: 10px;
}
tr,td{
    font-size:14px;
    color: rgb(68, 68, 68);

}
#link1, #link2{
    color:lightgray;
}
#link3{
   position:fixed;
   overflow:hidden;
   right:50px;
   color:lightgray;
}
h2{
    font-weight:bold;
}
</style>
</head>
<body style="height:1500px">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <a class="navbar-brand" href="#">편의점 마스터</a>
            <ul class="navbar-nav">
            <li class="nav-item">
        <a class="nav-link" href="#" id="link1">상품 등록</a>
            </li>
            <li class="nav-item">
        <a class="nav-link" href="#" id="link2">상품 목록</a>
            </li>
            </ul>
        <a class="nav-link" id="link3">안녕하세요 관리자님!</a>
    </nav>
<br><br><br>
<h2>상품목록</h2>
<br>
<!-- 관리자에게만 상품등록 버튼 표시 -->
<!-- update: 아예 그냥 버튼을 삭제했어요. nav에 있는데 왜 굳이 버튼을 만들었는지.. -->
<table border="0" class="table" align="center">
    <tr>
        <th>상품ID</th>
        <th>상품이미지</th>
        <th>상품명</th>
        <th>가격</th>
    </tr>
    <c:forEach var="row" items="${list}">
    <tr>
        <td>
            ${row.productId}
        </td>
        <td>
            <a href="${path}/shop/product/detail/${row.productId}">
                <img src="${path}/images/${row.productUrl}" width="120ox" height="110px">
            </a>
        </td>
        <td align="center">
            <a href="${path}/shop/product/detail/${row.productId}">${row.productName}</a><br>
            <c:if test="${sessionScope.adminId != null}">
                <a href="${path}/shop/product/edit/${row.productId}">[상품편집]</a>
            </c:if>
        </td>
        <td>
            <fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>
        </td>
    </tr>
    </c:forEach>
</table>

<script>
$(document).ready(function(){
    $("#btnAdd").click(function(){
        location.href="${path}/shop/product/write.do";
    });
});
</script>

</body>
</html>