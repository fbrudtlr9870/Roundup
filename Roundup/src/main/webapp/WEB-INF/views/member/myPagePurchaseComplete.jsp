<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle" />
</jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a701e8b07c907d6b0da0dbd2a200e68&libraries=services"></script>
<script charset="UTF-8" type="text/javascript"
	src="http://t1.daumcdn.net/cssjs/postcode/1522037570977/180326.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/code/highcharts.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/code/modules/exporting.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/code/modules/export-data.js"></script>
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id" />
	<sec:authentication property="principal.member_name" var="member_name" />
</sec:authorize>
<style>
div#update-container {
	width: 700px;
	/* margin: 0 auto; */
}

div#basket-container {
	width: 780px;
	/* margin: 0 auto; */
}

div#userId-container span.guide {
	display: none;
	font-size: 12px;
	position: relative;
	top: 12px;
	right: 10px;
	margin-right: 1000px;
}

div#userId-container span.ok {
	color: blue;
}

div#userId-container span.error {
	color: orange;
}

table#tbl_enroll {
	width: 980px margin: 0 auto;
}

#update-container h2 {
	text-align: left;
	padding-bottom: 30px;
	padding-top: 20px;
}

table#tbl_enroll input, table#tbl_enroll select {
	width: 500px;
}

div#btnDiv {
	text-align: center;
}

div.mypage {
	width: 980px;
	margin: 0 auto;
	min-height: 780px;
}

.list-group-item {
	position: relative;
	display: block;
	padding: .75rem 1.25rem;
	margin-bottom: -1px;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, .125);
	width: 150px;
}

.col-sm-3 {
	max-width: 200px;
}

.mypage-detail {
	width: 780px;
}

.sidenav {
	background-color: #fff;
	height: 100%;
}

.number-hyelin {
	display: inline;
}

.table {
	width: 780px;
	font-size: 13.5px;
}

.col-sm-3 {
	max-width: 200px;
}

.chart-master {
	width: 780px;
}

.center-hyelin {
	text-align: center;
	margin-top: 15px;
}

#tbl-img-row img {
	width: 70px;
}

.btnWidth70-hyelin {
	width: 70px;
	margin-right: 10px;
}

.verticalMiddle-hyelin {
	vertical-align: middle !important;
}

.searchBox-hyelin td, .searchBox-hyelin th{
	border-top: 0;
}

.searchBox-hyelin {
	border-top: 1px solid #dee2e6;
	border-bottom: 1px solid #dee2e6;
}
.datepicker {
	width: 225px;
	display: inline;
}
.dateSearch {
	margin-top: 10px;
	margin-bottom: 10px;
}
.demi {
	margin-left: 10px;
	margin-right: 10px;
}
.width485-hyelin {
	width: 485px;
}
</style>

<script>
	function purchaseCancel(imp_uid) {
		if (confirm("주문을 취소하시겠습니까?")) {
			jQuery.ajax({
				url : "${pageContext.request.contextPath}/purchase/purchaseCancel.do",
				type : 'POST',
				data : {
					imp_uid : imp_uid
				},
				success : function(data) {
					console.log(data);
					if (data === "success") {
						alert("주문 취소에 성공하였습니다.");
					} else {
						alert("주문 취소에 실패하였습니다.");
					}
					location.href = "${pageContext.request.contextPath}/member/myPagePurchaseComplete.do?member_id=${member_id}";

				},
				error : function(jqxhr, textStatus, errorThrown) {
					console.log("ajax처리실패!");
					console.log(jqxhr);
					console.log(textStatus);
					console.log(errorThrown);
				}
			});
		}
	}

	function searchPurchaseList() {
		var searchStartDate = $("#searchStartDate").val();
		var searchEndDate = $("#searchEndDate").val();
		var searchKeyword = $("#searchKeyword").val();
		location.href="${pageContext.request.contextPath}/member/myPagePurchaseComplete.do?member_id=${member_id}&searchKeyword="+searchKeyword + "&searchStartDate="+searchStartDate + "&searchEndDate=" + searchEndDate; 
	}
</script>
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id" />
	<sec:authentication property="principal.member_name" var="member_name" />
</sec:authorize>

<div class="mypage container">
	<div class="row">
		<div class="col-sm-3 sidenav">
			<div class="list-group" id="list-tab" role="tablist">
				<a class="list-group-item list-group-item-action" id="list-home-list" href="${pageContext.request.contextPath }/member/myPage.do?member_id=${member_id }" role="tab" aria-controls="home">Home</a> 
				<a class="list-group-item list-group-item-action" id="list-profile-list" href="${pageContext.request.contextPath }/member/myPageMemberView.do?member_id=${member_id }" role="tab" aria-controls="profile">내정보</a> 
				<a class="list-group-item list-group-item-action" id="list-basket-list" href="${pageContext.request.contextPath }/member/myPageBasket.do?member_id=${member_id }" role="tab" aria-controls="baskeet">장바구니</a> 
				<a class="list-group-item list-group-item-action active" id="list-settings-list" href="${pageContext.request.contextPath }/member/myPagePurchaseComplete.do?member_id=${member_id }" role="tab" aria-controls="settings">구매내역</a>
			</div>
		</div>
		<div class="col-8">
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
					<!-- 결재내역페이지 시작-->
					<div class="step-buy">
						<br> <img src="${pageContext.request.contextPath }/resources/img/purchasebar.png" width="780px" height="auto"> <br>
					</div>

					<table class="table searchBox-hyelin">
						<tr>
							<th>조회 기간</th>
							<td>							
<!-- 								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(0)">당일</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(1)">1주</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(2)">2주</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(3)">1개월</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(4)">3개월</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(5)">6개월</button> <br /> -->
								<div class="dateSearch">
									<span class="dset"> 
										<input type="date" class="form-control datepicker inpType" name="searchStartDate" id="searchStartDate"> 
									</span> 
									<span class="demi">~</span>
									<span class="dset"> 
										<input type="date" class="form-control datepicker inpType" name="searchEndDate" id="searchEndDate"> 
									</span>
								</div>
							</td>
							<td rowspan="2" class="verticalMiddle-hyelin">
								<button type="button" class="btn btnWidth70-hyelin" onclick="return searchPurchaseList();">조회</button>
							</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td>
								<input type="text" class="form-control width485-hyelin" id="searchKeyword" name="searchKeyword"/>
							</td>
						</tr>
					</table>
				<div class="purchase-complete-container">
								<div class="basket-container">
							<table class="table">
								<tr>
									<th>상품정보</th>
									<th>수량</th>
									<th>결제금액</th>
									<th>결제일</th>
									<th>배송지조회</th>
									<th>주문상태</th>
								</tr>
								<c:if test="${not empty list }">
									<c:forEach var="i" items="${list }" varStatus="vs">
										<tr>
											<td class="tbl-td">
												<div id="tbl-img-row">
													<img src="${pageContext.request.contextPath }/resources/upload/productFile/${i['renamed_filename']}" alt="" width="auto" height="70px"> 
													<span>[${i["brand_name"]}] &nbsp; ${i["product_name"]}</span>
												</div>
											</td>
											<td class="tbl-td">${i['product_amount']}</td>
											<td class="tbl-td">
												<fmt:formatNumber value="${i.total_price}" type="currency" currencySymbol="" />원 
											</td> 
											<td class="tbl-td"><span>${i['purchase_date'] }</span></td>
											<td class="tbl-td">
												<button type="button" class="btn btn-outline-primary" id="searchMap" onclick="searchMap();">조회</button>
											</td>
											<td class="tbl-td">
												<c:if test="${i.difftime < 3600}">
													<button type="button" class="btn btn-outline-success" id="" onclick="purchaseCancel('${i.imp_uid }');">취소</button>
												</c:if> 
												<c:if test="${i.difftime > 3600}"> 
													<button type="button" class="btn btn-outline-danger" id="" onclick="window.alert('취소할 수 없습니다.');">완료</button>
												</c:if> 
												<c:if test="${i.difftime == 3600}">
													<button type="button" class="btn btn-outline-danger" id="" onclick="window.alert('취소할 수 없습니다.');">완료</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty list }">
									<tr>
										<td colspan="6"><h5 class="center-hyelin">구매내역이 없습니다.</h5></td>
									</tr>
								</c:if>
							</table>
							<hr style="width: 780px">

							<br> <br> <br>

						</div>
					</div>

					<!-- 결재내역페이지 끝-->
				
				</div>
			</div>
		</div>
	</div>

</div>
<br />
<br />
<br />
<%
	int count = Integer.parseInt(String.valueOf(request.getAttribute("count")));
	int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
	int cPage = 1;
	try {
		cPage = Integer.parseInt(request.getParameter("cPage"));
	} catch (NumberFormatException e) {

	}
	String member_id = (String)pageContext.getAttribute("member_id");
%>
<%=com.proj.rup.common.util.Utils.getPageBar(count, cPage, numPerPage, "myPagePurchaseComplete.do?member_id="+member_id)%>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>