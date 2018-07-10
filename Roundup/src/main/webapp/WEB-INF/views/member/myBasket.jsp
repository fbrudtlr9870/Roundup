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
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
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
.container-fluid-master{
	position:relative;
	top:38px;
	min-height:1000px;
}

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
   width:90%;
   font-size:13.5px;
}

.col-sm-3 {
    max-width: 200px;
}
.chart-master{
   width:780px;
}

.center-hyelin {
   text-align: center;
   margin-top: 15px;
}
.border-bottom-hyelin {
   border-bottom: 1px solid rgba(0,0,0,.1);
}
.padding-hyelin{
   padding-bottom: 20px !important;
   padding-top: 20px !important;
}
.btnBuy {
   width: 100%;
}
.nav-item-my>a{
	font-size:20px;
	font-family: 'Do Hyeon', sans-serif;
}
</style>
 <div class="container-fluid-master">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item-my">
                <a class="nav-link active" href="${pageContext.request.contextPath }/member/myPage.do?member_id=${member_id }">
                  <span data-feather="home"></span>
                  My Page <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item-my">
                <a class="nav-link" href="${pageContext.request.contextPath }/member/myPageMemberView.do?member_id=${member_id }">
                  <span data-feather="file"></span>
                  내정보
                </a>
              </li>
              <li class="nav-item-my">
                <a class="nav-link" href="${pageContext.request.contextPath }/member/myPageBasket.do?member_id=${member_id }">
                  <span data-feather="shopping-cart"></span>
                  장바구니
                </a>
              </li>
              <li class="nav-item-my">
                <a class="nav-link" href="${pageContext.request.contextPath }/member/myPagePurchaseComplete.do?member_id=${member_id }">
                  <span data-feather="users"></span>
                  구매내역
                </a>
              </li>
              <li class="nav-item-my">
              <!-- wnth지워주세염 -->
                <a class="nav-link" href="${pageContext.request.contextPath}/member/selectMemberAddress.do?member_id=${member_id}">
                  <span data-feather="bar-chart-2"></span>
                  주소록관리
                </a>
              </li>
              <li class="nav-item-my">
              <!-- wnth지워주세염 -->
                <a class="nav-link" href="${pageContext.request.contextPath }/member/myPageQuestion.do?member_id=${member_id }">
                  <span data-feather="bar-chart-2"></span>
                 1:1문의
                </a>
              </li>
              
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">장바구니</h1>
            
          </div>

         <%--  <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas> --%>
		  
       <%--  <div class="step-buy">
               <br> <img src="${pageContext.request.contextPath }/resources/img/step-img.png" width="107%" height="auto">
               <br>
               </div> --%>
               <div class="basket-container">
                  <table class="table border-bottom-hyelin">
                     <tr>
                        <th><input type="checkbox" id="allCheck" name="allCheck" onchange="fn_checkAll(this.checked);"></th>
                        <th>상품정보</th>
                        <th>판매가</th>
                        <th>수량</th>
                        <th>판매가X수량</th>
                        <th>선택</th>
                     </tr>
                     <c:if test="${not empty basketList }">
                        <c:forEach var="i" items="${basketList }" varStatus="vs">
                           <tr>
                              <td class="tbl-td">
                                 <input type="checkbox" class="basketList" name="basketList" id="basketItem${vs.count }" onclick="fn_toggle(basketItem${vs.count }, this.checked)">
                              </td>
                              <td class="tbl-td">
                                 <div id="tbl-img-row">
                                    <img src="${pageContext.request.contextPath }/resources/upload/productFile/${i['renamed_filename']}" alt="" width="auto" height="70px">
                                    <span>[${i["brand_name"]}] &nbsp; ${i["product_name"]}</span>
                                 </div>
                              </td>
                              <td class="tbl-td">
                                 <fmt:formatNumber value="${i['price']}" type="currency" currencySymbol=""/>원
                              </td>
                              <td class="tbl-td">
                                 <input type="number" class="form-control number-hyelin" style="width: 50px; margin: 0 auto;" name="product_amount" value="${i['product_amount']}" min="1">
                                 <button type="button" class="btn btn-light updateBasket" style="width:30opx; font-size:13px;">수정</button>
                              </td>
                              <td class="tbl-td">
                                 <input type="hidden" value="${i['product_amount']*i['price']}" name="price" id="price"/>
                                 <fmt:formatNumber value="${i['product_amount']*i['price']}" type="currency" currencySymbol=""/>원
                              </td>
                              <td class="tbl-td">
                                 <input type="hidden" value="${i['basket_no'] }" name="basket_no"/>
                                 <button type="button" style="font-size:13px;" class="btn btn-outline-success" onclick="window.location.href='${pageContext.request.contextPath }/purchase/purchase.do?basketNo=${i['basket_no'] }&memberId=${member_id }'">구매</button> &nbsp;
                                 <button type="button" style="font-size:13px;" class="btn btn-outline-danger deleteBasket">삭제</button>
                              </td>
                           </tr>
                        </c:forEach>
                     </c:if>
                     <c:if test="${empty basketList }">
                            <tr>
                               <td colspan="6"><h5 class="center-hyelin">장바구니에 담긴 상품이 없습니다.</h5></td>
                            </tr>
                     </c:if>
                  </table>
                  <button type="button" style="font-size:14px;" class="btn btn-danger" id="deleteChkItem" style="float: left;">선택상품 삭제</button>
                  <br>
                  <br>
                  <br>
                  <table class="table">
                     <tr>
                        <th>배송비</th>
                        <th>총 결제금액</th>
                     </tr>
                     <tr>
                        <c:if test="${not empty basketList }">
                        <td class="tbl-td padding-hyelin"><fmt:formatNumber value="2000" type="currency" currencySymbol="" />원</td>
                        <td class="tbl-td padding-hyelin"><span id="totalPrice">2,000</span>원</td>
                        </c:if>
                        <c:if test="${empty basketList }">
                        <td class="tbl-td padding-hyelin"><fmt:formatNumber value="0" type="currency" currencySymbol="" />원</td>
                        <td class="tbl-td padding-hyelin"><fmt:formatNumber value="0" type="currency" currencySymbol="" />원 </td>
                        </c:if>
                     </tr>
                     <tr>
	                     <td colspan="2">
		                  <div class="btnBuy">
		                     <button type="button" class="btn btn-primary" id="purchaseAll" style="float: right; margin: 10px;" onclick="return purchaseAll();">전체상품 주문</button>
		                     <button type="button" class="btn btn-success" id="purchaseChk" style="float: right; margin: 10px;" onclick="return purchaseChk();">선택상품 주문</button>
		                  </div>                     
	                     </td>
                     </tr>
                  </table>
               </div> 
         
        </main>
      </div>
    </div>

<script>
function fn_checkAll(bool) {
    var chkboxes = document.getElementsByName("basketList");

    for(var i=0; i<chkboxes.length; i++) {
        chkboxes[i].checked = bool;
    }
}

function fn_toggle(bool) {
    var chkboxes = document.getElementsByName("basketList");
    var chkall = document.getElementById("allCheck");
     
    // 클래스명 부여
    if(bool == true) {
        // parent_td.className = 'on';
    } else{
        // parent_td.className = 'off';
        chkall.checked = false;
    }

    var count = 0;
    for(var i=0; i<chkboxes.length; i++) {
        if(chkboxes[i].checked == true)
            count++;
    }
    
    if(count==chkboxes.length) chkall.checked = true;
    // else chkall.checked = false;
}

function purchaseAll() {
   var chkboxes = document.getElementsByName("basketList");
   var basketNo = "";
   var memberId = '${member_id}';
   
   for(var i=0; i<chkboxes.length; i++) {
      basketNo += $(chkboxes[i]).parent().parent().find("[name=basket_no]").val();     
      basketNo += "/";
    }
   
   location.href="${pageContext.request.contextPath}/purchase/purchase.do?basketNo="+basketNo+"&memberId="+memberId;
}

function purchaseChk() {
   var basketNo = "";
   var memberId = '${member_id}';
   
   $("[name=basketList]:checked").filter(function() {
      basketNo += $(this).parent().parent().find("[name=basket_no]").val();
      basketNo += "/";
    });
   
   if(basketNo !== "") {
      location.href="${pageContext.request.contextPath}/purchase/purchase.do?basketNo="+basketNo+"&memberId="+memberId;
   }
   else {
      alert("선택된 상품이 없습니다.");
   } 
}

$(function() {
   // 삭제 버튼
   $(".deleteBasket").click(function() {
      var basketNo = $(this).parent().find("[name=basket_no]").val();
      console.log("basketNo="+basketNo);
      
      if(confirm("장바구니에서 삭제하시겠습니까?")) {
         $.ajax({
            url:"${pageContext.request.contextPath}/basket/deleteBasket.do",
            data: {
               basketNo : basketNo
             },
            success:function(data) {
               console.log(data);
               location.href="${pageContext.request.contextPath}/member/myPageBasket.do?member_id=${member_id }";
            },
            error:function(jqxhr, textStatus, errorThrown) {
                     console.log("ajax처리실패!");
                     console.log(jqxhr);
                     console.log(textStatus);
                     console.log(errorThrown);
               }
         });
      }
   });
   
   // 수량 수정 버튼
   $(".updateBasket").click(function() {
      var basketNo = $(this).parent().parent().find("[name=basket_no]").val();
      var product_amount = $(this).parent().find("[name=product_amount]").val();
      console.log("basketNo="+basketNo+"product_amount="+product_amount);
      
      $.ajax({
         url:"${pageContext.request.contextPath}/basket/updateBasket.do",
         data: {
            basketNo : basketNo,
            productAmount : product_amount
          },
         success:function(data) {
            console.log(data);
            location.href="${pageContext.request.contextPath}/basket/selectBasketList.do?memberId=${member_id }";
         },
         error:function(jqxhr, textStatus, errorThrown) {
                  console.log("ajax처리실패!");
                  console.log(jqxhr);
                  console.log(textStatus);
                  console.log(errorThrown);
            }
      });
   });
   
   // 선택상품 삭제 버튼
   $("#deleteChkItem").click(function() {
      var basketNo = "";
      $("[name=basketList]:checked").filter(function() {
         basketNo += $(this).parent().parent().find("[name=basket_no]").val();
         basketNo += "/";
        });
      
      if(basketNo === "") {
         alert("선택된 상품이 없습니다.");
      } else {      
         if(confirm("장바구니에서 삭제하시겠습니까?")) {
            $.ajax({
               url:"${pageContext.request.contextPath}/basket/deleteBasket.do",
               data: {
                  basketNo : basketNo
                },
               success:function(data) {
                  console.log(data);
                  location.href="${pageContext.request.contextPath}/basket/selectBasketList.do?memberId=${member_id}";
               },
               error:function(jqxhr, textStatus, errorThrown) {
                        console.log("ajax처리실패!");
                        console.log(jqxhr);
                        console.log(textStatus);
                        console.log(errorThrown);
                  }
            });
         }
      }
   }); 

   // 선택 상품의 금액 합 구하기
   var total = 2000;
   $("[name=basketList]").click(function() {
      if($(this).is(":checked")) {
         total += parseInt($(this).parent().parent().find("#price").val());
      } else {
         total -= parseInt($(this).parent().parent().find("#price").val());
      }
      $("#totalPrice").text(addCommaSearch(total));
   }); 
   
   // 전체 상품의 금액 합 구하기
   $("[name=allCheck]").click(function() {
      if($(this).is(":checked")) {
         total = 2000;
         var chkboxes = document.getElementsByName("basketList");

         for(var i=0; i<chkboxes.length; i++) {
            total += parseInt($(chkboxes[i]).parent().parent().find("#price").val());
         }
      } else {
         total = 2000;
      }
      $("#totalPrice").text(addCommaSearch(total));
   });
});

function addCommaSearch(value) {
   str = String(value);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

</script> 
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>