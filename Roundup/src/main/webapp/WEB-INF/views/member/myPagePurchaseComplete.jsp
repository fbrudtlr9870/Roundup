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
.btn_datePicker {display:inline-block;margin:1px 0 0 0;width:22px;height:26px;background:url(../../images/icon/ico_calendar.png) no-repeat 0 0;text-indent:-5000px;vertical-align:top;}
.ui-widget {font-family:'맑은 고딕', 'Malgun Gothic', NanumGothic, '나눔고딕','돋움',dotum,Helvetica,sans-serif;font-size: 1.1em;}
.ui-widget-header {border:none;background-color:#fff;background-image:none;color: #333;font-weight: bold;}
.ui-corner-all, .ui-corner-top, .ui-corner-left, .ui-corner-tl {border-top-left-radius: 0;}
.ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr {border-top-right-radius: 0;}
.ui-corner-all, .ui-corner-bottom, .ui-corner-left, .ui-corner-bl {border-bottom-left-radius: 0;}
.ui-corner-all, .ui-corner-bottom, .ui-corner-right, .ui-corner-br {border-bottom-right-radius: 0;}
.ui-datepicker td span, .ui-datepicker td a {display:block;padding:0;text-align:center;}
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {border:none;background-color:#f8f8f8;background-image:none;font-weight:normal;color: #333;}
.ui-state-default a, .ui-state-default a:link, .ui-state-default a:visited {color: #333;text-decoration: none;}
.ui-state-hover, .ui-widget-content .ui-state-hover, .ui-widget-header .ui-state-hover, .ui-state-focus, .ui-widget-content .ui-state-focus, .ui-widget-header .ui-state-focus {border:none;background-color:#f8f8f8;background-image:none;font-weight:normal;color: #333;}
.ui-state-hover a, .ui-state-hover a:hover, .ui-state-hover a:link, .ui-state-hover a:visited, .ui-state-focus a, .ui-state-focus a:hover, .ui-state-focus a:link, .ui-state-focus a:visited {color: #c77405;text-decoration: none;}
.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active {border:none;background-color:#f8f8f8;background-image:none;font-weight: bold;color:#009de6;}
.ui-state-active a, .ui-state-active a:link, .ui-state-active a:visited {color: #eb8f00;text-decoration: none;}
.datePicker {display:none;position:absolute;margin:0;padding:0;z-index:100;}
.datePicker .ui-datepicker {position:relative;margin:0;padding:15px;width:auto;background-color:#fff;border:1px solid #009de6;}
.datePicker .ui-datepicker .ui-datepicker-prev {position:absolute;top:5px;left:0;display:inline-block;width:28px;height:22px;background:url(../../images/icon/bl.gif) no-repeat 0 -190px;text-indent:-5000px;}
.datePicker .ui-datepicker .ui-datepicker-next {position:absolute;top:5px;right:0;display:inline-block;width:28px;height:22px;background:url(../../images/icon/bl.gif) no-repeat -28px -190px;text-indent:-5000px;}
.datePicker .ui-datepicker .ui-datepicker-title {display:block;margin:0 0 5px;text-align:center;font-size:14px;font-weight:bold;line-height:20px;}
.datePicker .ui-datepicker .ui-datepicker-calendar {width:200px;border:1px solid #ddd;}
.datePicker .ui-datepicker .ui-datepicker-calendar th {padding:3px 0 5px 0;text-align:center;background-color:#f8f8f8;font-weight:normal;font-size:12px;line-height:14px;border-bottom:1px solid #ddd;}
.datePicker .ui-datepicker .ui-datepicker-calendar th.ui-datepicker-week-end {color:#FF0000;}
.datePicker .ui-datepicker .ui-datepicker-calendar td {padding:3px 0 5px;text-align:center;font-size:11px;background-color:#f8f8f8;line-height:16px;}
.datePicker .ui-datepicker .ui-datepicker-calendar td .ui-state-default {display:block;width:100%;height:100%;}
.datePicker .ui-datepicker .ui-datepicker-calendar td.ui-datepicker-week-end {background-color:#e8e8e8;}
.datePicker .ui-datepicker .ui-datepicker-calendar td.ui-datepicker-week-end .ui-state-default {background-color:#e8e8e8;}
.datePicker .ui-datepicker .ui-datepicker-calendar td.ui-state-disabled {background-color:#fff;}
.datePicker .ui-datepicker .ui-datepicker-calendar td.ui-datepicker-unselectable .ui-state-default {background-color:#fff;}
.datePicker .ui-datepicker .ui-datepicker-calendar td.ui-datepicker-today {background-color:#fff;}
.datePicker .ui-datepicker .ui-datepicker-calendar td.ui-datepicker-today a {color:#009de6;font-weight:bold;background-color:#fff;}
.datePicker .ui-datepicker .ui-datepicker-btn {position:absolute;bottom:-1px;right:-1px;}
.datePicker .ui-datepicker .ui-datepicker-btn a {display:block;width:15px;height:15px;background:url(../../images/btn/btn_layer_close.gif) no-repeat 0 0;text-indent:-5000px;}

/* 조회기간 */
.search_period{ margin:20px 0 8px 0;}
.search_period dl{ position:relative;}
.search_period dl dt{ position:absolute; left:0; top:0; font-size:14px; font-weight:bold; color:#000000; line-height:26px;}
.search_period dl dd{ position:relative; height:29px;}
.search_period .select{ float:left;margin:0 3px 0 0;}
.search_period .select ul{ overflow:hidden; height:29px;}
.search_period .select li{ float:left; margin-right:2px;}
.search_period .select a{ display:block; width:41px; height:27px;border:1px solid #c3c7c8; border-radius:4px; background:#ffffff; box-shadow:0 1px 0 #ecedef; font-size:12px; text-align:center; line-height:26px; behavior:url(/html/htc/PIE.htc);}
.search_period .select a:hover,
.search_period .select a:focus,
.search_period .select a:active,
.search_period .select a.cnt{ border:1px solid #555555; background:#666666; color:#ffffff;}
.search_period .input_style {text-align:center;}
.search_period .input .btn_submit{ padding-bottom:1px; width:42px; height:27px; margin-left:5px; border:1px solid #bbbbbb; border-bottom:1px solid #939393; border-radius:4px; background:#f0f0f0; font-size:12px; color:#666666; cursor:pointer; behavior:url(/html/htc/PIE.htc);}
.search_period .input .datePicker1 {left:183px;}
.search_period .input .datePicker2 {left:335px;}
.search_period p.msg{ margin-top:15px; font-size:14px; font-weight:bold;}
.search_period p.msg strong{ color:#009de6;}

.select ul {
	list-style: none;
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
<%-- 	
	// 현재 날짜 구하기
	var today = <%= cal.get(Calendar.YEAR) %> + "-";
	if(<%= cal.get(Calendar.MONTH)+1 %><10)
		today += "0" + <%= cal.get(Calendar.MONTH)+1 %> + "-";
	else 
		today += <%= cal.get(Calendar.MONTH)+1 %> + "-";
	if(<%= cal.get(Calendar.DATE) %><10)
		today += "0" + <%= cal.get(Calendar.DATE) %>;
	else
		today += <%= cal.get(Calendar.DATE) %>;

	$(function () {
		$("#searchEndDate").val(today);
	});
	
	function getDate(index) {
		// 종료 날짜			
		$("#searchEndDate").val(today);
		alert(today);
	}
	
	 --%>
	 $(document).ready(function(){

	     if($('#searchStartDate').val() == ""){
	         fnDateSet('searchEndDate','searchStartDate',0,0,0,0,0,-7,'-');
	     }

	     if($('#searchTerm').val() == "7" || $('#searchTerm').val() == ""){
	         $('#term_seven').addClass('cnt');
	     }
	     else if($('#searchTerm').val() == "15"){
	         $('#term_fifteen').addClass('cnt');
	     }
	     else if($('#searchTerm').val() == "30"){
	         $('#term_thirty').addClass('cnt');
	     }
	     else if($('#searchTerm').val() == "90"){
	         $('#term_ninety').addClass('cnt');
	     }

	     var minDate = new Date($("#limitYear").val(),$("#limitMonth").val(),$("#limitDay").val());

	     $(".datePicker").datepicker("option", "minDate", minDate);
	 });

	 function searchTermValue(val, obj){
	     $('[name="searchTerm"]').val(val);
	     $('[id^=term_]').removeClass();
	     $(obj).addClass('cnt');
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
								<div class="search_period">
		                            <input id="limitYear" type="hidden" value="2013"/>
		                            <input id="limitMonth" type="hidden" value="6"/>
		                            <input id="limitDay" type="hidden" value="07"/>
                                <fieldset>
                                    <dl>
                                        <dd>
                                            <div class="select">
                                                <ul>
                                                    <li><a href="javascript:fnDateSet('searchEndDate','searchStartDate',0,0,0,0,0,-7,'-');" onclick="javascript:searchTermValue('7', this)" id="term_seven">7일</a></li>
                                                    <li><a href="javascript:fnDateSet('searchEndDate','searchStartDate',0,0,0,0,0,-15,'-');" onclick="javascript:searchTermValue('15', this)" id="term_fifteen">15일</a></li>
                                                    <li><a href="javascript:fnDateSet('searchEndDate','searchStartDate',0,0,0,0,-1,0,'-');" onclick="javascript:searchTermValue('30', this)" id="term_thirty">30일</a></li>
                                                    <li><a href="javascript:fnDateSet('searchEndDate','searchStartDate',0,0,0,0,-3,0,'-');" onclick="javascript:searchTermValue('90', this)" id="term_ninety">90일</a></li>

                                                </ul>
                                            </div>
                                            <div class="input">
                                                <input type="text" class="input_style w_99" id="searchStartDate" name="searchStartDate" title="조회기간 시작일 입력" readonly="readonly" value=""/>
                                                <a href="#this" class="btn_datePicker" title="조회기간 시작일 달력 선택 화면 보기">조회기간 시작일 달력</a>
                                                <div class="datePicker datePicker1"></div>
                                                <span>~</span>
                                                <input type="text" class="input_style w_99" id="searchEndDate" name="searchEndDate" title="조회기간 종료일 입력" readonly="readonly" value=""/>
                                                <a href="#this" class="btn_datePicker" title="조회기간 종료일 달력 선택 화면 보기">조회기간 종료일 달력</a>
                                                <div class="datePicker datePicker2"></div>
                                                <input type="submit" class="btn_submit" value="조회" />
                                            </div>
                                        </dd>
                                    </dl>
                                </fieldset>
                        </div>
							
								<!-- 								
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(0)">당일</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(1)">1주</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(2)">2주</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(3)">1개월</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(4)">3개월</button>
								<button type="button" class="btn btnWidth70-hyelin" onclick="getDate(5)">6개월</button> <br />
								<div class="dateSearch">
									<span class="dset"> 
										<input type="text" class="form-control datepicker inpType" name="searchStartDate" id="searchStartDate"> 
										<a id="startDate" href="#none" class="btncalendar dateclick"></a>
									</span> 
									<span class="demi">~</span>
									<span class="dset"> 
										<input type="text" class="form-control datepicker inpType" name="searchEndDate" id="searchEndDate"> 
										<a id="endDate" href="#none" class="btncalendar dateclick"></a>
									</span>
								</div> -->
							</td>
							<!-- <td rowspan="2" class="verticalMiddle-hyelin">
								<button type="button" class="btn btnWidth70-hyelin">조회</button>
							</td> -->
						</tr>
						<tr>
							<th>상품명</th>
							<td>
								<input type="text" class="form-control width485-hyelin"/>
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