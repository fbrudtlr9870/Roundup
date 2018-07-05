<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a701e8b07c907d6b0da0dbd2a200e68&libraries=services"></script>
<script charset="UTF-8" type="text/javascript"
   src="http://t1.daumcdn.net/cssjs/postcode/1522037570977/180326.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/code/highcharts.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/code/modules/exporting.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/code/modules/export-data.js"></script>
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<!-- 관리자롤을 가진 유저 -->
<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
	<sec:authentication property="principal.username" var="admin_id"/>
	<sec:authentication property="principal.member_name" var="admin_name"/>
</sec:authorize>


<!-- 180704 수요일 css 살짝 수정 - dh1ee -->


<style>
div.mypage{
	width:980px;
	margin:0 auto;
	
	min-height:780px;
}
.col-sm-3 {
    max-width: 200px;
}
.list-group-item {
    position: relative;
    display: block;
    padding: .75rem 1.25rem;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid rgba(0,0,0,.125);
    width: 150px;
}
div.form-group{
   width:500px;
}
div#product-container label.custom-file-label{text-align:left;}
div#product-container{
   position:relative;
   width:750px;
   margin:0 auto;
   border: 0.7px solid rgb(206, 212, 218);
   padding: 30px 15px 70px 25px;

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

function validate(){
   
   return true;
}
/* 다중select스크립트 시작*/

$(function(){
   $(".category-level").on("change",function(){
      var val = $(this).find('option:selected').val();
      var nextE = $(this).next();
      var nextEclass = $(this).attr("class");
      console.log(nextE);
      console.log(val);
      console.log(nextEclass);
      
      var nextEclasses = nextEclass.split(" ");
      console.log(nextEclasses[2]);
      
      $.ajax({
         url:"${pageContext.request.contextPath}/product/selectChildCategory.do",
         data:{categoryNo:val},
         success:function(data){
            var html = "";
            console.log(data);
            html += "<option value='' selected disabled>Select</option>";
            for(var i in data){
               console.log(data[i].category_name);
               html += "<option value='"+data[i].category_no+"'>"+data[i].category_name+"</option>";
            }
            
            nextE.html(html);
         },error:function(jqxhr, textStatus, errorThrown) {
                console.log("ajax처리실패!");
                console.log(jqxhr);
                console.log(textStatus);
                console.log(errorThrown);
             }
      }); 
   });
});


/* 다중select스크립트 끝*/

$(function(){
   $("[name=upFile]").on("change",function(){
      //var fileName = $(this).val();
      var fileName = $(this).prop("files")[0].name;
      
      $(this).next(".custom-file-label").html(fileName);
   });
});
</script>

<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>

<div class="mypage container">
	<div class="row">
	  <div class="row">
	  <div class="col-sm-3 sidenav">
	    <div class="list-group" id="list-tab" role="tablist">
	      <a class="list-group-item list-group-item-action active" id="list-home-list"  href="${pageContext.request.contextPath }/manager/managerPage.do" role="tab" aria-controls="home">Home</a>
	      <a class="list-group-item list-group-item-action" id="list-profile-list"  href="${pageContext.request.contextPath }/manager/memberManagement.do" role="tab" aria-controls="profile">회원관리</a>
	      <a class="list-group-item list-group-item-action" id="list-basket-list"  href="${pageContext.request.contextPath }/product/productEnroll.do" role="tab" aria-controls="baskeet">상품등록</a>
	      <a class="list-group-item list-group-item-action" id="list-allProduct-list"  href="${pageContext.request.contextPath }/product/allProductList.do" role="tab" aria-controls="allproduct">전체상품</a>
	      <a class="list-group-item list-group-item-action" id="list-deletedProduct-list"  href="#" role="tab" aria-controls="settings">삭제된상품</a>
	      <a class="list-group-item list-group-item-action" id="list-event-list"  href="#" role="tab" aria-controls="settings">이벤트등록</a>
	      <a class="list-group-item list-group-item-action" id="list-allEvent-list"  href="#" role="tab" aria-controls="settings">전체이벤트</a>
	    </div>
	  </div>
	  <div class="col-8">
	    <div class="tab-content" id="nav-tabContent">
	      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
	      <!-- home -->
	      <h3>상품등록</h3><br />
	         	<div id="product-container">
				   
				   <form action="productEnrollEnd.do" name="productFrm" method="post" enctype="multipart/form-data" onsubmit="return validate();">
				       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
				        <input type="text" class="form-control" name="memberId" aria-label="Default" value="${admin_id }" aria-describedby="inputGroup-sizing-default" readonly>
				   </div>
				   <div class="input-group mb-3">
				     <div class="input-group-prepend">
				       <label class="input-group-text" for="inputGroupSelect01">브랜드</label>
				     </div>
				     <select class="custom-select" name="brandNo" id="inputGroupSelect01">
				          <c:forEach var="b" items="${brandList }" varStatus="vs">
				             <option value="${b.brand_no }">${b.brand_name }</option>
				          </c:forEach>
				     </select>
				   </div>
				   <div class="input-group mb-3">
				     <div class="input-group-prepend">
				       <label class="input-group-text" for="inputGroupSelect01">카테고리</label>
				     </div>
				     <select class="custom-select category-level level-1" name="categoryNo" id="category1" ><!-- onchange="doChange(this,'category2');" -->
				      <option value="" selected disabled>Select</option>   
				        <c:forEach var="c" items="${categoryList }" varStatus="vs">
				           <c:if test="${c.category_level == 1 }">
				              <option value="${c.category_no }">${c.category_name }</option>
				           </c:if>
				        </c:forEach>
				     </select>
				     <select class="custom-select category-level level-2" name="categoryNo" id="category2">
				        
				     </select>
				     <select class="custom-select category-level level-3" name="categoryNo" id="category3">
				        
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
	      
	      </div>
	    </div>
	  </div>
	</div>
	
</div>
<br /><br /><br />



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>