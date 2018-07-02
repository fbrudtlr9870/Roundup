<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="상품등록페이지" name="pageTitle"/>
</jsp:include>

<style>
div.form-group{
	width:500px;
}
div#product-container label.custom-file-label{text-align:left;}
div#product-container{
	position:relative;
	width:980px;
	margin:0 auto;

}
div#board-container input{margin-bottom:15px;}
div.mb-3{
	width:700px;
}
.btn-outline-primary{
	float:right;
	margin:10px;
}
.input-group-text{
	background-color: #ffffff;
}
.input-group-prepend>span{
	width:110px;
	
}
control[readonly] {
    background-color: #efefef;
    opacity: 1;
}

</style>

<script>
function doChange(srcE,targetId){
	var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    console.log(val);
    console.log(targetE);
    
    removeAll(targetE);
    
    if(val == '간편식사'){
        addOption('김밥', targetE);
        addOption('도시락', targetE);
        addOption('샌드위치', targetE);
        addOption('햄버거', targetE);
    }
    else if(val == '식품'){
        addOption('컵밥/국', targetE);
        addOption('라면', targetE);
        addOption('냉동식품', targetE);
        addOption('냉장식품', targetE);
    }
    else if(val == '과자류'){
        addOption('껌/사탕/초코', targetE);
        addOption('박스과자', targetE);
        addOption('봉지과자', targetE);
    }
    else if(val == '아이스크림'){
        addOption('바', targetE);
        addOption('콘', targetE);
        addOption('컵', targetE);
    }
    else if(val == '즉석식품'){
        addOption('튀김', targetE);
        addOption('빵', targetE);
    }
    else if(val == '음료'){
        addOption('유제품', targetE);
        addOption('캔', targetE);
        addOption('패트', targetE);
        addOption('유리', targetE);
    }
    else if(val == '김밥'){
        addOption('삼각김밥', targetE);
        addOption('원형김밥', targetE);
    }
    else if(val == '도시락'){
        addOption('고기', targetE);
        addOption('치킨', targetE);
    }
    else if(val == '라면'){
        addOption('컵라면', targetE);
        addOption('봉지라면', targetE);
    }
    else if(val == '냉동식품'){
        addOption('치킨', targetE);
        addOption('피자', targetE);
        addOption('만두', targetE);
        addOption('돼지고기', targetE);
    }
    else if(val == '냉장식품'){
        addOption('가공식품', targetE);
        addOption('안주', targetE);
        addOption('식재료', targetE);
    }
}

function addOption(value, e){
    var o = new Option(value);
    try{
        e.add(o);
    }catch(ee){
        e.add(o, null);
    }
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}
function validate(){
	
	return true;
}

$(function(){
	$("[name=upFile]").on("change",function(){
		//var fileName = $(this).val();
		var fileName = $(this).prop("files")[0].name;
		
		$(this).next(".custom-file-label").html(fileName);
	});
});
</script>

<div id="product-container">
	<h3>상품등록</h3><br />
	<form action="productEnrollEnd.do" name="productFrm" method="post" enctype="multipart/form-data" onsubmit="return validate();">
	 <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">상품이름</span>
		  </div>
		  <input type="text" class="form-control" name="productName" aria-label="Default" aria-describedby="inputGroup-sizing-default">
		</div>
	  <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="inputGroup-sizing-default">등록자</span>
		  </div>
		  <input type="text" class="form-control" name="memberId" aria-label="Default" value="${memberLoggedIn.member_id }" aria-describedby="inputGroup-sizing-default" readonly>
	</div>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <label class="input-group-text" for="inputGroupSelect01">브랜드</label>
	  </div>
	  <select class="custom-select" name="brandNo" id="inputGroupSelect01">
	      <option value="1">CU</option>
	      <option value="2">GS25</option>
	      <option value="3">7ELEVEN</option>
	      <option value="4">MINISTOP</option>
	      <option value="5">EMART24</option>
	  </select>
	</div>
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <label class="input-group-text" for="inputGroupSelect01">카테고리</label>
	  </div>
	  <select class="custom-select" name="categoryNo" id="category">
	    	<option id="category" value="0" selected disabled>카테고리</option>
          	<option id="category" value="1">간편식사</option>
          	<option id="category" value="7">-  김밥</option>
          	<option id="category" value="27">-- 삼각김밥</option>
          	<option id="category" value="28">-- 원형김밥</option>
          	<option id="category" value="8">- 도시락</option>
          	<option id="category" value="29">-- 고기</option>
          	<option id="category" value="30">-- 치킨</option>
          	<option id="category" value="9">- 샌드위치</option>
          	<option id="category" value="10">- 햄버거</option>
          	<option id="category" value="2">식품</option>
          	<option id="category" value="11">- 컵밥/국</option>
          	<option id="category" value="12">- 라면</option>
          	<option id="category" value="31">-- 컵라면</option>
          	<option id="category" value="32">-- 봉지라면</option>
          	<option id="category" value="13">- 냉동식품</option>
          	<option id="category" value="33">-- 치킨</option>
          	<option id="category" value="34">-- 피자</option>
          	<option id="category" value="35">-- 만두</option>
          	<option id="category" value="36">-- 돼지고기</option>
          	<option id="category" value="14">- 냉장식품</option>
          	<option id="category" value="37">-- 가공식품</option>
          	<option id="category" value="38">-- 안주</option>
          	<option id="category" value="39">-- 식재료</option>
          	<option id="category" value="3">과자류</option>
          	<option id="category" value="15">- 껌/사탕/초코</option>
          	<option id="category" value="16">- 박스과자</option>
          	<option id="category" value="17">- 봉지과자</option>
          	<option id="category" value="4">아이스크림</option>
          	<option id="category" value="18">- 바</option>
          	<option id="category" value="19">- 콘</option>
          	<option id="category" value="20">- 컵</option>
          	<option id="category" value="5">즉석식품</option>
          	<option id="category" value="21">- 튀김</option>
          	<option id="category" value="22">- 빵</option>
          	<option id="category" value="6">음료</option>
          	<option id="category" value="23">- 유제품</option>
          	<option id="category" value="24">- 캔</option>
          	<option id="category" value="25">- 페트</option>
          	<option id="category" value="26">- 유리</option>
	  </select>
	</div>
	  <div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <span class="input-group-text" id="inputGroup-sizing-default">상품가격</span>
	  </div>
	  <input type="number" class="form-control" name="price" step="100" aria-label="Default" aria-describedby="inputGroup-sizing-default">
	</div>
	  <div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text">상품이미지</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="inputGroupFile01">
		    <label class="custom-file-label" id="chooseFile" for="inputGroupFile01">Choose file</label>
		  </div>
	 </div>
	 <button type="reset" class="btn btn-outline-primary">초기화</button>
	 <button type="submit" class="btn btn-outline-primary">상품등록</button>
	</form>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>