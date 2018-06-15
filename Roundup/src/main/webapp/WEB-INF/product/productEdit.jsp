<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 수정/삭제 페이지</title>
</head>
<body>
<h2>상품 정보/삭제</h2>
<form id="form1" name="form1" enctype="multipart/form-data" method="post">
    <table border="">
        <tr>
            <td>상품 이미지</td>
            <td>
                <img src="${path}/images/${vo.productUrl}" height="300px" width="310px">
                <br>
                <input type="file" id="productPhoto" name="productPhoto">
            </td>
        </tr>
        <tr>
            <td>상품명</td>
            <td><input type="text" id="productName" name="productName" value="${vo.productName}"></td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="number" id="productPrice" name="productPrice" value="${vo.productPrice}"></td>
        </tr>
        <tr>
            <td>상품소개</td>
            <td><textarea id="productDesc" name="productDesc" rows="5" cols="60">${vo.productDesc}</textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="productId" value="${vo.productId}">
                <input type="button" id="editBtn" value="수정">
                <input type="button" id="deleteBtn"value="삭제">
                <input type="button" id="listBtn" value="상품목록">    
            </td>
        </tr>
    </table>
</form>


<!-- 상품 수정버튼 클릭이벤트가 발생하면 유효성 검사후 업데이트 처리
상품 삭제버튼 클릭이벤트가 발생하면 confirm()함수를 이용하여 삭제확인을 한 뒤 삭제처리
상품 목록버튼 클릭이벤트가 발생하면 상품 목록 페이지로 이동 -->
<script>
$(document).ready(function(){
    // 상품 수정 버튼 클릭이벤트
    $("#editBtn").click(function(){
        var productName = $("#productName").val();
        var productPrice = $("#productPrice").val();
        var productDesc = $("#productDesc").val();
        // 상품 수정 폼 유효성 검사
        if(productName == "") {
            alert("상품명을 입력해주세요");
            productName.foucs();
        } else if (productPrice == "") {
            alert("상품 가격을 입력해주세요");
            productPrice.focus();
        } else if (productDesc == "") {
            alert("상품 설명을 입력해주세요");
            productDesc.focus();
        }
        document.form1.action = "${path}/shop/product/update.do";
        document.form1.submit();
    });
    // 상품 삭제 버튼 클릭이벤트
    $("#deleteBtn").click(function(){
        // 상품 삭제 확인
        if(confirm("상품을 삭제하시겠습니까?")){
            document.form1.action = "${path}/shop/product/delete.do";
            document.form1.submit();
        }
    });
    // 상품 목록 버튼 클리이벤트
    $("#listBtn").click(function(){
        location.href = "${path}/shop/product/list.do";
    });
});
</script>

</body>
</html>