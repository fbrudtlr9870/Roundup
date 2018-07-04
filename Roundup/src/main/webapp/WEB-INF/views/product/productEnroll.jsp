<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
   <sec:authentication property="principal.username" var="admin_id"/>
   <sec:authentication property="principal.member_name" var="admin_name"/>
</sec:authorize>
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

<div id="product-container">
   <h3>상품등록</h3><br />
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


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>