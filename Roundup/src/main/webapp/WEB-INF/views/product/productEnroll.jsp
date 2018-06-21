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
	width:100%;
}
div#product-container label.custom-file-label{text-align:left;}
div#product-container{
	width:600px;
	margin:0 auto;

}
div#board-container input{margin-bottom:15px;}
div.category_div{
	width:200px;
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
</script>

<div id="product-container">

	<form action="productEnrollEnd.do" name="productFrm" method="post" enctype="multipart/form-data" onsubmit="return validate();">
	  <div class="form-group">
	    <label for="formGroupExampleInput">상품이름</label>
	    <input type="text" class="form-control" name="productName" id="formGroupExampleInput" placeholder="Example input">
	  </div>
	  <div class="form-group">
	    <label for="formGroupExampleInput2">등록자</label>
	    <input type="text" class="form-control" name="memberId" id="formGroupExampleInput2" placeholder="Another input" readonly>
	  </div>
	 <div class="form-group">
	    <label for="inputState">브랜드</label>
	     <select id="inputState" name="brandName" class="form-control">
	      <option>CU</option>
	      <option>GS25</option>
	      <option>7ELEVEN</option>
	      <option>MINISTOP</option>
	      <option>EMART24</option>
	    </select>
	  </div>
	  <div class="form-group category_div">
	     <label for="inputState">카테고리1</label>
	     <select class="form-control category" name="category1" id="category1" onchange="doChange(this,'category2')" required>	  
	     	<option selected disabled>카테고리1</option> 
	     	<option>간편식사</option>    
	     	<option>식품</option>    
	     	<option>과자류</option>    
	     	<option>아이스크림</option>    
	     	<option>즉석식품</option>    
	     	<option>음료</option>    
	      </select>
	  
	     <label for="inputState">카테고리2</label>
	     <select class="form-control category" name="category2" id="category2" onchange="doChange(this,'category3')" required>	   
	  	  <option selected disabled>카테고리2</option> 
	      </select>
	  
	     <label for="inputState">카테고리3</label>
	     <select class="form-control category" name="category3" id="category3" required>
	     <option selected disabled>카테고리3</option> 	     
	      </select>
	   </div>
	   <div class="form-group">
	    <label for="formGroupExampleInput2">가격</label>
	    <input type="text" class="form-control" name="price" id="formGroupExampleInput3" placeholder="Another input" >
	  </div>
	 <div class="input-group mb-3" style="padding:0px">
		  <div class="input-group-prepend" style="padding:0px">
		    <span class="input-group-text">첨부파일1</span>
		  </div>
		  <div class="custom-file">
		    <input type="file" class="custom-file-input" name="upFile" id="upFile1">
		    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
		  </div>
		</div>
	</form>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>