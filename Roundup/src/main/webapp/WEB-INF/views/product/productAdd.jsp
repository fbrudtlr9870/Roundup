<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품등록 페이지</title>
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
    border:none;
    size:50px;
    padding:15px;
}
#productAdd{
    color: rgb(68, 68, 68);
    padding-left:6px;
    padding-bottom:10px;
}
tr,td{
    font-size:14px;
    color: rgb(68, 68, 68);

}
input{
    border-radius:8px;
}
textarea{
    border-style:inset;
    border-radius:8px;
}
#addBtn,#listBtn,#resetBtn{
    font-family: 'Nanum Gothic', sans-serif;
    background-color:rgb(67, 106, 212);
    font-size:15px;
    font-weight:bold;
    color:white;
    border:none;
    padding-top:7px;
    padding-right:15px;
    padding-bottom:7px;
    padding-left:15px;
    
}
.resetBtn{
    background:rgb(67, 106, 212);
    border:none;
}
#link1, #link2{
    padding-right:30px;
    padding-left:30px;
}
#link1{
    padding-left:40px;
}
</style>
</head>
<body style="height:1500px">
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
            <a class="navbar-brand" href="#">편의점 마스터</a>
                <ul class="navbar-nav">
                <li class="nav-item">
            <a class="nav-link" href="#" id="link1">상품 목록</a>
                </li>
                <li class="nav-item">
            <a class="nav-link" href="#" id="link2">상품 수정/삭제</a>
                </li>
                </ul>
        </nav>
<br>
<br>
<br>
<h2 id="productAdd">상품 등록</h2>
<form id="form1" name="form1" enctype="multipart/form-data" method="post">
    <table border="0" class="table">
        <tr>
            <td>상품명</td>
            <td><input type="text" name="productName" id="productName" size="35"></td>
        </tr>
        
        <tr>
            <td>가격</td>
            <td><input type="text" name="productPrice" id="productPrice" size="35"></td>
        </tr>
        <tr>
            <td>상품설명</td>
            <td><textarea rows="5" cols="60" name="productDesc" id="productDesc" cols="50" rows="20"></textarea></td>
        </tr>
        <tr>
            <td>상품이미지</td>
            <td><input type="file" name="productPhoto" id="productPhoto"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="등록" id="addBtn">
                <input type="button" value="목록" id="listBtn">
                <input type="reset" value="재설정" id="resetBtn">
            </td>
        </tr>
    </table>
</form>

<script>
$(document).ready(function(){
    // 상품 등록 유효성검사
    $("#addBtn").click(function(){
        var productName = $("#productName").val();
        var productPrice = $("#productPrice").val();
        var productDesc = $("#productDesc").val();
        var productPhoto = $("#productPhoto").val();

        if(productName == "") {
            alert("상품명을 입력해주세요");
            productName.focus();
        } else if (productPrice == "") {
            alert("상품 가격을 입력해주세요");
            productPrice.focus();
        } else if (productDesc == "") {
            alert("상품 설명을 입력해주세요");
            productDesc.focus();
        } else if (productPhoto == "") {
            alert("상품 사진을 입력해주세요");
            productPhoto.focus();
        }
        // 상품 정보 전송
        document.form1.action = "${path}/shop/product/insert.do";
        document.form1.submit();
    });
    // 상품 목록이동
    $("#listBtn").click(function(){
        location.href='${path}/shop/product/list.do';
    });
});

</script>


</body>
</html>




