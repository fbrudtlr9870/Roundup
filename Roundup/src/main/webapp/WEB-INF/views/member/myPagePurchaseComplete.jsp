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
<style>
<style>

div#update-container{
	width: 700px;
    /* margin: 0 auto; */
}
div#basket-container{
	width: 780px;
    /* margin: 0 auto; */
}

div#userId-container span.guide{
	display:none;
	font-size:12px;
	position:relative;
	top:12px;
	right:10px;
	margin-right:1000px;
}

div#userId-container span.ok{color:blue;}
div#userId-container span.error{color:orange;}

table#tbl_enroll {
	width: 980px
	margin: 0 auto;
}
#update-container h2 {
	text-align: left;
	padding-bottom: 30px;
	padding-top: 20px;
}
table#tbl_enroll input, table#tbl_enroll select{
	width: 500px;
}
div#btnDiv {
	text-align: center;
}
div.mypage{
	width:980px;
	margin:0 auto;
	
	min-height:780px;
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
.col-sm-3 {
    max-width: 200px;
}
.mypage-detail{
	width:780px;
}
.sidenav {
    background-color: #fff; 
    height: 100%;
}
.number-hyelin {
	display:inline;
}

.table{
	width:780px;
	font-size:13.5px;
}

.col-sm-3 {
    max-width: 200px;
}
.chart-master{
	width:780px;
}

</style>

<script>
function purchaseCancel(imp_uid) {
	jQuery.ajax({
	     url: "${pageContext.request.contextPath}/purchase/purchaseCancel.do",
	     type: 'POST',
	     data: {
	    	 imp_uid : imp_uid
	     },
	     success:function(data) {
	        console.log(data);
	        if(data==="success") {
	        	alert("주문 취소에 성공하였습니다.");
            } else {
            	alert("주문 취소에 실패하였습니다.");
            }
            location.href="${pageContext.request.contextPath}/member/myPagePurchaseComplete.do?member_id=${member_id}"; 
	        
	     },
	     error:function(jqxhr, textStatus, errorThrown) {
	             console.log("ajax처리실패!");
	             console.log(jqxhr);
	             console.log(textStatus);
	             console.log(errorThrown);
	       } 
	  });
	
}
</script>
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>

<div class="mypage container">
	<div class="row">
	  <div class="col-sm-3 sidenav">
	    <div class="list-group" id="list-tab" role="tablist">
	     <a class="list-group-item list-group-item-action" id="list-home-list"  href="${pageContext.request.contextPath }/member/myPage.do?member_id=${member_id }" role="tab" aria-controls="home">Home</a>
	      <a class="list-group-item list-group-item-action" id="list-profile-list"  href="${pageContext.request.contextPath }/member/myPageMemberView.do?member_id=${member_id }" role="tab" aria-controls="profile">내정보</a>
	      <a class="list-group-item list-group-item-action" id="list-basket-list"  href="${pageContext.request.contextPath }/member/myPageBasket.do?member_id=${member_id }" role="tab" aria-controls="baskeet">장바구니</a>
	      <a class="list-group-item list-group-item-action active" id="list-settings-list"  href="${pageContext.request.contextPath }/member/myPagePurchaseComplete.do?member_id=${member_id }" role="tab" aria-controls="settings">구매내역</a>
	    </div>
	  </div>
	  <div class="col-8">
	    <div class="tab-content" id="nav-tabContent">
	      
	      <div class="tab-pane fade show active" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
	       <!-- 결재내역페이지 시작-->
	       <div class="step-buy">
			<br> <img src="${pageContext.request.contextPath }/resources/img/purchasebar.png" width="780px" height="auto">
			<br>
			</div>
	       <div class="purchase-complete-container">
	       		<div class="basket-container">
						<table class="table">
							<tr>
								<th>상품정보</th>
								<th>수량</th>
								<th>결재금액</th>
								<th>결재일</th>
								<th>배송지조회</th>
								<th>주문취소</th>
							</tr>
							<c:if test="${not empty completeList }">
								<c:forEach var="i" items="${completeList }" varStatus="vs">
									<tr>
										<td class="tbl-td">
											<div id="tbl-img-row">
												<img src="${pageContext.request.contextPath }/resources/upload/productFile/${i['renamed_filename']}" alt="" width="auto" height="70px">
												<span>[${i["brand_name"]}] &nbsp; ${i["product_name"]}</span>
											</div>
										</td>
										<td class="tbl-td">
											<input type="number" class="form-control number-hyelin" style="width: 70px; margin: 0 auto;" name="product_amount" value="${i['product_amount']}" min="1">
										</td>
										<td class="tbl-td">
											<input type="hidden" value="${i['product_amount']*i['price']}" name="price" id="price"/>
											<fmt:formatNumber value="${i['product_amount']*i['price']}" type="currency" currencySymbol=""/>원
										</td>
										<td class="tbl-td">
											<span>${i['purchase_date'] }</span>
										</td>
										<td class="tbl-td">
											<button type="button" class="btn btn-outline-primary" id="searchMap" onclick="searchMap();">조회</button>
										</td>
										<td class="tbl-td">
											<button type="button" class="btn btn-outline-danger" id="" onclick="purchaseCancel('${i.imp_uid }');">취소</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty completeList }">
						          <tr>
						             <td colspan="6">구매내역이 없습니다.</td>
						          </tr>
							</c:if>
						</table>
						<hr style="width:780px">
						
						<br>
						<br>
						<br>
						
					</div> 
	       </div>
					
	       <!-- 결재내역페이지 끝-->
	      </div>
	    </div>
	  </div>
	</div>
	
</div>
<br /><br /><br />


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>