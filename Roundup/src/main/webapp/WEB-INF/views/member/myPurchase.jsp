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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
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
	width: 90%;
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
.container-fluid-master{
	position:relative;
	top:38px;
	min-height:1000px;
}
.nav-item-my>a{
	font-size:20px;
	font-family: 'Do Hyeon', sans-serif;
}
/* 지도api관련 */
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:780px;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.map-card{
	width:780px;
}
.delivery-map{
	display:hidden;
}
</style>
<div class="container-fluid-master">
	<div class="row">
		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
			<div class="sidebar-sticky">
				<ul class="nav flex-column">
					<li class="nav-item-my"><a class="nav-link active"
						href="${pageContext.request.contextPath }/member/myPage.do?member_id=${member_id }">
							<span data-feather="home"></span> My Page <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item-my"><a class="nav-link"
						href="${pageContext.request.contextPath }/member/myPageMemberView.do?member_id=${member_id }">
							<span data-feather="file"></span> 내정보
					</a></li>
					<li class="nav-item-my"><a class="nav-link"
						href="${pageContext.request.contextPath }/member/myPageBasket.do?member_id=${member_id }">
							<span data-feather="shopping-cart"></span> 장바구니
					</a></li>
					<li class="nav-item-my"><a class="nav-link"
						href="${pageContext.request.contextPath }/member/myPagePurchaseComplete.do?member_id=${member_id }">
							<span data-feather="users"></span> 구매내역
					</a></li>
					<li class="nav-item-my">
						<!-- wnth지워주세염 --> <a class="nav-link"
						href="${pageContext.request.contextPath}/member/selectMemberAddress.do?member_id=${member_id}">
							<span data-feather="bar-chart-2"></span> 주소록관리
					</a>
					</li>
					<li class="nav-item-my">
						<!-- wnth지워주세염 --> <a class="nav-link"
						href="${pageContext.request.contextPath }/member/myPageQuestion.do?member_id=${member_id }">
							<span data-feather="bar-chart-2"></span> 1:1문의
					</a>
					</li>

				</ul>
			</div>
		</nav>

		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">구매내역</h1>

		</div>


		<div class="tab-pane fade show active" id="list-settings"
			role="tabpanel" aria-labelledby="list-settings-list">
			<!-- 결재내역페이지 시작-->
			<%-- <div class="step-buy">
						<br> <img src="${pageContext.request.contextPath }/resources/img/purchasebar.png" width="100%" height="auto"> <br>
					</div> --%>

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
							<span class="dset"> <input type="date"
								class="form-control datepicker inpType" name="searchStartDate"
								id="searchStartDate">
							</span> <span class="demi">~</span> <span class="dset"> <input
								type="date" class="form-control datepicker inpType"
								name="searchEndDate" id="searchEndDate">
							</span>
						</div>
					</td>
					<td rowspan="2" class="verticalMiddle-hyelin">
						<button type="button"
							class="btn btn btn-outline-primary btnWidth70-hyelin"
							onclick="return searchPurchaseList();">조회</button>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" class="form-control width485-hyelin"
						id="searchKeyword" name="searchKeyword" /></td>
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
								<input type="hidden" name="address" value="${i.address }" />
								<tr>
									<td class="tbl-td">
										<div id="tbl-img-row">
											<img
												src="${pageContext.request.contextPath }/resources/upload/productFile/${i['renamed_filename']}"
												alt="" width="auto" height="70px"> <span>[${i["brand_name"]}]
												&nbsp; ${i["product_name"]}</span>
										</div>
									</td>
									<td class="tbl-td">${i['product_amount']}</td>
									<td class="tbl-td"><fmt:formatNumber
											value="${i.total_price}" type="currency" currencySymbol="" />원
									</td>
									<td class="tbl-td"><span>${i['purchase_date'] }</span></td>
									<td class="tbl-td">
										<button type="button" class="btn btn-outline-primary"
											id="searchMap" onclick="searchMap('${i.address }','${i["brand_name"]}');">조회</button>
									</td>
									<td class="tbl-td"><c:if test="${i.difftime < 3600}">
											<button type="button" class="btn btn-outline-success" id=""
												onclick="purchaseCancel('${i.imp_uid }');">취소</button>
										</c:if> <c:if test="${i.difftime > 3600}">
											<button type="button" class="btn btn-outline-danger" id=""
												onclick="window.alert('취소할 수 없습니다.');">완료</button>
										</c:if> <c:if test="${i.difftime == 3600}">
											<button type="button" class="btn btn-outline-danger" id=""
												onclick="window.alert('취소할 수 없습니다.');">완료</button>
										</c:if></td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${empty list }">
							<tr>
								<td colspan="6"><h5 class="center-hyelin">구매내역이 없습니다.</h5></td>
							</tr>
						</c:if>
					</table>


					<br> <br> <br>

				</div>
			</div>
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
			<!-- 결재내역페이지 끝-->



		</div>
		<div id="map-div-master" style="visibility:hidden;width:800px;">
		
			<h3>배송지</h3> <button type="button" class="close" aria-label="Close" onclick="closeDiv();" style="position: relative;top: -37px;right: 20px;">
  <span aria-hidden="true">&times;</span> 
</button>
			<div class="map_wrap">
			
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<%-- <div>
							<form onsubmit="searchPlaces(); return false;">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> 키워드 : <input type="text"
									value="" id="search_keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div> --%>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
		</div>
			
	
		

		</main>
	</div>
</div>


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
	location.href = "${pageContext.request.contextPath}/member/myPagePurchaseComplete.do?member_id=${member_id}&searchKeyword="
			+ searchKeyword
			+ "&searchStartDate="
			+ searchStartDate
			+ "&searchEndDate=" + searchEndDate;
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
	center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	level : 3
// 지도의 확대 레벨 
};

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
var ps = new daum.maps.services.Places();  
var markers = [];

function searchMap(address,brand) {
	var div = document.getElementById("map-div-master");
	if(div.style.visibility="hidden"){
		div.style.visibility="visible";
	}else{
		div.style.visibility="hidden";
	}
	
	console.log(address);
	var addr = address.indexOf("(");
	if(brand=="7ELEVEN"){
		brand="세븐일레븐";
	}
	console.log(address.substring(0, addr));
	searchPlaces(address.substring(0, addr)+brand);
}

function closeDiv(){
	var div = document.getElementById("map-div-master");
	div.style.visibility="hidden";
}

function searchPlaces(searchkeyword) {

	var keyword = searchkeyword;
	console.log(keyword);

	if (!keyword.replace(/^\s+|\s+$/g, '')) {
		alert('키워드를 입력해주세요!');
		return false;
	}

	// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	ps.keywordSearch(keyword, placesSearchCB);
}

//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
	if (status === daum.maps.services.Status.OK) {

		// 정상적으로 검색이 완료됐으면
		// 검색 목록과 마커를 표출합니다
		displayPlaces(data);

		// 페이지 번호를 표출합니다
		displayPagination(pagination);

	} else if (status === daum.maps.services.Status.ZERO_RESULT) {

		alert('검색 결과가 존재하지 않습니다.');
		return;

	} else if (status === daum.maps.services.Status.ERROR) {

		alert('검색 결과 중 오류가 발생했습니다.');
		return;

	}
}

//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<1; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}
//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
<%-- <%
	int count = Integer.parseInt(String.valueOf(request.getAttribute("count")));
	int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
	int cPage = 1;
	try {
		cPage = Integer.parseInt(request.getParameter("cPage"));
	} catch (NumberFormatException e) {

	}
	String member_id = (String)pageContext.getAttribute("member_id");
%>
<%=com.proj.rup.common.util.Utils.getPageBar(count, cPage, numPerPage, "myPagePurchaseComplete.do?member_id="+member_id)%> --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>