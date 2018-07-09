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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
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
.table td, .table th {
    padding: .55rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
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
	width:100%;
	margin:0;
	
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
	width:100%;
	font-size:13.5px;
}

.col-sm-3 {
    max-width: 200px;
}
.chart-master{
	width:780px;
}
.nav-item-my>a{
	font-size:20px;
	font-family: 'Do Hyeon', sans-serif;
}
.container-fluid-master{
	position:relative;
	top:38px;
	min-height:1000px;
}
</style>

<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<div class="container-fluid-master">
	<div class="row">
		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
			<div class="sidebar-sticky">
				<ul class="nav flex-column">
					<li class="nav-item-my"><a class="nav-link active"
						href="${pageContext.request.contextPath }/manager/managerPage.do">
							<span data-feather="home"></span> Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item-my"><a class="nav-link"
						href="${pageContext.request.contextPath }/manager/memberManagement.do">
							<span data-feather="file"></span> 회원관리
					</a></li>
					<li class="nav-item-my"><a class="nav-link"
						href="${pageContext.request.contextPath }/manager/deletedMember.do">
							<span data-feather="shopping-cart"></span> 탈퇴회원목록
					</a></li>
					<li class="nav-item-my"><a class="nav-link"
						href="${pageContext.request.contextPath }/product/productEnroll.do">
							<span data-feather="users"></span> 상품등록
					</a></li>
					<li class="nav-item-my">
						<!-- wnth지워주세염 --> <a class="nav-link"
						href="${pageContext.request.contextPath }/product/allProductList.do">
							<span data-feather="bar-chart-2"></span> 전체상품
					</a>
					</li>
					<li class="nav-item-my">
						<!-- wnth지워주세염 --> <a class="nav-link"
						href="${pageContext.request.contextPath }/manager/managerPurchaseComplete.do">
							<span data-feather="bar-chart-2"></span> 전체구매내역
					</a>
					</li>
					<li class="nav-item-my">
						<!-- wnth지워주세염 --> <a class="nav-link"
						href="${pageContext.request.contextPath }/manager/managerPurchaseCancel.do">
							<span data-feather="bar-chart-2"></span> 전체취소내역
					</a>
					</li>
					<li class="nav-item-my">
						<!-- wnth지워주세염 --> <a class="nav-link"
						href="${pageContext.request.contextPath }/manager/managerQuestion.do">
							<span data-feather="bar-chart-2"></span> 1:1문의
					</a>
					</li>

				</ul>
			</div>
		</nav>

		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h3>전체상품</h3>
            
          </div>

		<div class="mypage container">
			
						
						<div class="tab-pane fade show active" id="list-settings"
							role="tabpanel" aria-labelledby="list-settings-list">
							<!-- 결재내역페이지 시작-->
							<div class="step-buy">
								<br>
								<%--  <img src="${pageContext.request.contextPath }/resources/img/purchasebar.png" width="780px" height="auto"> --%>
								<p class="imsosotired2">총 상품 : ${totalContents }개</p>
							</div>
							<div class="purchase-complete-container">
								<div class="basket-container">
									<table class="table">
										<tr>
											<th>상품번호</th>
											<th>상품사진</th>
											<th>상품이름</th>
											<th>상품가격</th>
											<th>상품등록일</th>
											<!-- <th>배송지조회</th> -->
										</tr>
										<c:if test="${not empty list }">
											<c:forEach var="i" items="${list }" varStatus="vs">
												<tr no="${i['productNo'] }">

													<td class="tbl-td"><span>${vs.count}</span></td>
													<td class="tbl-td">
														<div id="tbl-img-row">
															<img
																src="${pageContext.request.contextPath }/resources/upload/productFile/${i['renamedFileName']}"
																alt="" width="auto" height="70px">

														</div>
													</td>

													<td class="tbl-td"><span>${i["productName"]}</span></td>
													<td class="tbl-td"><span>${i['price'] }</span>원</td>
													<td class="tbl-td"><span>${i['regDate'] }</span></td>
													<!-- <td class="tbl-td">
											<button type="button" class="btn btn-outline-primary" id="searchMap" onclick="searchMap();">조회</button>
										</td> -->
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty list }">
											<tr>
												<td colspan="6">상품이 없습니다.</td>
											</tr>
										</c:if>
									</table>
									<hr style="width: 780px">

									<br>

								</div>
							</div>

							<!-- 결재내역페이지 끝-->


							<ul class="pagination justify-content-center pagination-sm"
								style="clear: both;margin: auto;margin-top: 20px;">
								<!-- 페이지바 -->
								<%
	               int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
	               int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
	               int cPage = 1;
	               try {
	                  cPage = Integer.parseInt(request.getParameter("cPage"));
	               } catch (NumberFormatException e) {
	
	               }
	            %>
								<%=com.proj.rup.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "allProductList.do")%>
							</ul>
						</div>
				

		</div>





		</main>
	</div>
</div>

<br /><br /><br />
<script>
   $(function() {
      $("tr[no]").on("click",function() {
         console.log($(this).attr("no"));
         location.href = "${pageContext.request.contextPath}/product/productView.do?product_no="
               + $(this).attr("no");
      });
   });
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>