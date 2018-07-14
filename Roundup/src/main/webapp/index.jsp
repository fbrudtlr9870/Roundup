
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="main" name="pageTitle"/>
</jsp:include>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>   
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Jua" rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a701e8b07c907d6b0da0dbd2a200e68&libraries=services"></script>
<script charset="UTF-8" type="text/javascript"
   src="http://t1.daumcdn.net/cssjs/postcode/1522037570977/180326.js"></script>
<sec:authorize access="hasAnyRole('ROLE_USER')">
   <sec:authentication property="principal.username" var="member_id"/>
   <sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<style>
.container-fluid-master{
	position:relative;
	top:38px;
	min-height:1000px;
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
<script>

/* master push 2018.07.15 01:15   */

//신상품불러오기
$(function(){
   $.ajax({
      url:"${pageContext.request.contextPath}/product/selectNewProduct.do",
      dataType:"json",
      success:function(data){
         console.log(data);
         var html="";
         
         for(var i in data.productNewList){
            if(data.productNewList[i].renamedFileName!=null){   
               if(i==0){
                  html+="<div class='carousel-item active new-product'><img class='d-block' style='margin:0 auto;' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productNewList[0].renamedFileName+"' height='150px' width='150px' alt='First slide'>";
               }else{               
                  html += "<div class='carousel-item new-product'><img class='d-block' style='margin:0 auto;' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productNewList[i].renamedFileName+"' height='150px' width='150px' alt='Second slide'>";
               }
               html += "<div class='buy-btn'>";
               html += "<input type='hidden' value='" + data.productNewList[i].productNo +"' name='product_no'>";
                  html += "</div>";
                  html += "<div class='ptext' style='font-size:19px;'>" + data.productNewList[i].brandName + "</div>"; 
                  html += "<div class='ptext' style='font-size:23px;'>" + data.productNewList[i].productName + "</div>";
                   html += "<div class='pprice' style='font-size:20px;float:right;'>" + data.productNewList[i].price + "원</div>";
                   html+="</br>";
               html+="<input type='number' class='form-control inline-hyelin' style='width:70px; margin:0 auto;position:relative;top:-2.5px;' name='product_amount' min='1' value='1'>";
                 html+="<div class='btn-group' role='group' aria-label='Basic example' style='text-align:center'>";
               html+="<button type='button' class='btn btn-primary insertBasket-new'>장바구니</button>";
               html+="<button type='button' class='btn btn-success purchase-new'>구매</button>";
               html+="</div></div>";
            }
         }
         
         $(".new-option").html(html);

         $(".insertBasket-new").on("click",function(){
            var memberId = '${member_id}';
            if(memberId != "") {
               $.ajax({
                  url:"${pageContext.request.contextPath }/basket/insertBasket.do",
                  data: {
                     productAmount: $(this).parent().parent().find("[name=product_amount]").val(),
                     productNo: $(this).parent().parent().find("[name=product_no]").val(),
                     memberId :memberId
                  },
                  success:function(data) {
                     if(confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?")) {
                        location.href = "${pageContext.request.contextPath }/basket/selectBasketList.do?memberId="+memberId;
                     } else {
                        location.href = "${pageContext.request.contextPath }";
                     }
                  },
                  error:function(jqxhr, textStatus, errorThrown) {
                          console.log("ajax처리실패!");
                          console.log(jqxhr);
                          console.log(textStatus);
                          console.log(errorThrown);
                    }
               });   
            } else {
               alert("로그인 후 이용하실 수 있습니다.");
            }
            
         });

         $(".purchase-new").on("click",function(){

            var productNo = $(this).parent().parent().find("[name=product_no]").val();
            var productAmount = $(this).parent().parent().find("[name=product_amount]").val();
            var memberId = '${member_id}';

            if(memberId != "") {
            location.href="${pageContext.request.contextPath}/purchase/buyNow.do?productNo=" + productNo + "&productAmount=" + productAmount+"&memberId="+memberId;
            } else {
               alert("로그인 후 이용하실 수 있습니다.");
            }
         });
         
      },error:function(jqxhr, textStatus, errorThrown) {
            console.log("ajax처리실패!");
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
         }
   });
}); 


/* ------------------------------------------------- */
//인기상품불러오기
$(function(){
   $.ajax({
      url:"${pageContext.request.contextPath}/product/selectHotProduct.do",
      dataType:"json",
      success:function(data){
         console.log(data);
         var html="";
         
         for(var i in data.productHotList){
            if(data.productHotList[i].renamedFileName!=null){   
               if(i==0){
                  html+="<div class='carousel-item active new-product'><img class='d-block' style='margin:0 auto;' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productHotList[0].renamedFileName+"' height='150px' width='150px' alt='First slide'>";
               }else{               
                  html += "<div class='carousel-item new-product'><img class='d-block' style='margin:0 auto;' src='${pageContext.request.contextPath}/resources/upload/productFile/"+data.productHotList[i].renamedFileName+"' height='150px' width='150px' alt='Second slide'>";
               }
               html += "<div class='buy-btn'>";
               html += "<input type='hidden' value='" + data.productHotList[i].productNo +"' name='product_no'>";
                  html += "</div>";
                  html += "<div class='ptext' style='font-size:19px;'>" + data.productHotList[i].brandName + "</div>"; 
                  html += "<div class='ptext' style='font-size:23px;'>" + data.productHotList[i].productName + "</div>";
                   html += "<div class='pprice' style='font-size:20px;float:right;'>" + data.productHotList[i].price + "원</div>";
                   html+="</br>";
               html+="<input type='number' class='form-control inline-hyelin' style='width:70px; margin:0 auto;position:relative;top:-2.5px;' name='product_amount' min='1' value='1'>";
                 html+="<div class='btn-group' role='group' aria-label='Basic example' style='text-align:center'>";
               html+="<button type='button' class='btn btn-primary insertBasket'>장바구니</button>";
               html+="<button type='button' class='btn btn-success purchase'>구매</button>";
               html+="</div></div>";
            }
         }
         
         $(".hot-option").html(html);

         $(".insertBasket").on("click",function(){
            var memberId = '${member_id}';
            if(memberId != "") {
               $.ajax({
                  url:"${pageContext.request.contextPath }/basket/insertBasket.do",
                  data: {
                     productAmount: $(this).parent().parent().find("[name=product_amount]").val(),
                     productNo: $(this).parent().parent().find("[name=product_no]").val(),
                     memberId :memberId
                  },
                  success:function(data) {
                     if(confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?")) {
                        location.href = "${pageContext.request.contextPath }/basket/selectBasketList.do?memberId="+memberId;
                     } else {
                        location.href = "${pageContext.request.contextPath }";
                     }
                  },
                  error:function(jqxhr, textStatus, errorThrown) {
                          console.log("ajax처리실패!");
                          console.log(jqxhr);
                          console.log(textStatus);
                          console.log(errorThrown);
                    }
               });   
            } else {
               alert("로그인 후 이용하실 수 있습니다.");
            }   

         });
         
         // 구매하기
         $(".purchase").on("click",function(){
            var productNo = $(this).parent().parent().find("[name=product_no]").val();
            var productAmount = $(this).parent().parent().find("[name=product_amount]").val();
            var memberId = '${member_id}';

            if(memberId != "") {
            location.href="${pageContext.request.contextPath}/purchase/buyNow.do?productNo=" + productNo + "&productAmount=" + productAmount+"&memberId="+memberId;
            } else {
               alert("로그인 후 이용하실 수 있습니다.");
            }
         });
         
      },error:function(jqxhr, textStatus, errorThrown) {
            console.log("ajax처리실패!");
            console.log(jqxhr);
            console.log(textStatus);
            console.log(errorThrown);
         }
   });
}); 


</script>

<br><br>
<div id="myCarousel" class="carousel slide main-slide carousel-master"
   data-ride="carousel">
   <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
   </ol>
   <div class="carousel-inner carousel-inner-master">
      <div class="carousel-item active carousel-item-master">
         <img class="first-slide main-event-img-master" src="${pageContext.request.contextPath }/resources/img/resource_img1.jpg" alt="First slide">
      </div>
      <div class="carousel-item carousel-item-master">
         <img class="second-slide main-event-img-master" src="${pageContext.request.contextPath }/resources/img/resource_img2.jpg" alt="First slide">
      </div>
      <div class="carousel-item carousel-item-master">
         <img class="third-slide main-event-img-master" src="${pageContext.request.contextPath }/resources/img/resource_img3.jpg" alt="First slide">
      </div>
      <div class="carousel-item carousel-item-master">
         <img class="third-slide main-event-img-master" src="${pageContext.request.contextPath }/resources/img/main-display.png" alt="First slide">
      </div>
      
   </div>
   <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
   </a> <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
   </a>
</div>
<!-- <h2>Hot & New</h2> -->
<div class="main-li-container">
   <!-- 신상품 시작 -->
   <div class="row featurette"
      style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;">
      <div class="col-md-7">
         <p class="featurette-heading" style="font-family: 'Do Hyeon', sans-serif; font-size: 40px;">
            <img src="${pageContext.request.contextPath }/resources/img/new (1).png" alt="" />신상품을 만나보세요 
         </p>
         <p class="lead" style="font-size: 30px;">각 편의점에 등록되는 신상품을 한번에
            모아보세요</p>
      </div>
      <!-- 신상품  Ajax start-->
      <div class="new-product-card-master product-container w3-card-4">
         <div class="w3-container w3-center w3-lobster">
            <h3>
               <img src="${pageContext.request.contextPath }/resources/img/new (1).png" alt="" />
            </h3>
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner slide-new-master new-option"></div>
            </div>
         </div>
         <br />
      </div>
      <!-- 신상품  ajax end-->
   </div>

   <hr class="featurette-divider">
   <!-- 인기상품  -->
   <div class="row featurette" style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;">
      <div class="col-md-7 order-md-2">
         <p class="featurette-heading"
            style="font-family: 'Do Hyeon', sans-serif; font-size: 40px;">
            인기상품을 만나보세요 <img src="${pageContext.request.contextPath }/resources/img/best-seller.png" alt="" />
         </p>
         <p class="lead" style="font-size: 30px;">
            가장 인기있는 상품을 만나보세요. <br />가장많이 구매한 상품들 입니다.
         </p>
      </div>
      <!-- 인기상품  ajax start-->
      <div class="hot-product-card-master product-container w3-card-4">
         <div class="w3-container w3-center w3-lobster">
            <h3>
               <img src="${pageContext.request.contextPath }/resources/img/best-seller.png" alt="" />
            </h3>
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
               <div class="carousel-inner slide-new-master hot-option"></div>
            </div>
         </div>
         <br />
      </div>
      <!-- 인기상품  ajax end-->
   </div>
   <!-- 가까운편의점 찾기 -->
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom" style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;">
            <h1 class="h2">가까운 편의점을 찾아보세요 <img src="${pageContext.request.contextPath }/resources/img/planet-earth (1).png" alt="" /></h1>
            
          </div>

         <%--  <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas> --%>
		  
         <div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> 키워드 : <input type="text"
									value="편의점" id="search_keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
</div>

<br><br>
<script>


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 
    }; 

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var geocoder = new daum.maps.services.Geocoder(); 
var infowindow = new daum.maps.InfoWindow({zIndex:1});
/* ---------------------------------- */
// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        console.log(position.coords);
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
            
        console.log(lat+","+lon);
          
   
        searchAddrFromCoords(position.coords,displaySearchInfo);
        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;z-index: 20;">현재위치입니다.</div>'; // 인포윈도우에 표시될 내용입니다
        map.setLevel(3);
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.longitude, coords.latitude, callback);         
}

function displaySearchInfo(result,status){
 if (status === daum.maps.services.Status.OK) {
        var infoDiv = document.getElementById('search_keyword');
		
        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            console.log(result);
            if (result[i].region_type === 'H') {
                infoDiv.value = result[i].address_name+" 편의점";
                searchPlaces();
                break;
            }
        }
    }    
}

/* var infowindow = new daum.maps.InfoWindow({zIndex:1}); */

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new daum.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    infowindow = new daum.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    }); 
    
    
    // 인포윈도우를 마커위에 표시합니다 
   infowindow.open(map, marker); 
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
// 마커를 담을 배열입니다
var markers = [];

//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  
/* 
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1}); */

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('search_keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
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

// 검색 결과 목록과 마커를 표출하는 함수입니다
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
    
    for ( var i=0; i<places.length; i++ ) {

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

// 검색결과 항목을 Element로 반환하는 함수입니다
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

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
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
    var content = '<div style="padding:5px;z-index:10;">' + title + '</div>';

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
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>