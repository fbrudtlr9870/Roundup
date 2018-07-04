<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="검색결과" name="pageTitle"/>
   <jsp:param value="${searchKeyword }" name="pageSearch"/>
</jsp:include>

<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<script>
$(function(){
    var bloginfo=${bloginfo};
	if(${bloginfo!='not'}){		
	   console.log(bloginfo);
	   var p1=$("#blog1");
	   p1.html("<a href="+bloginfo.items[0].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[0].title+"</a>");
	   var p2=$("#blog2");
	   p2.html("<a href="+bloginfo.items[1].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[1].title+"</a>");
	   var p3=$("#blog3");
	   p3.html("<a href="+bloginfo.items[2].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[2].title+"</a>");
	   var p4=$("#blog4");
	   p4.html("<a href="+bloginfo.items[3].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[3].title+"</a>");
	   var p5=$("#blog5");
	   p5.html("<a href="+bloginfo.items[4].link+" target='_blank'>&nbsp;&nbsp;"+bloginfo.items[4].title+"</a>");
	}
});
function search(){
   $(".search-div").show();
}
function searchClose(){
   $(".search-div").hide();
}
$(".main-li").mouseenter(function(){
	$(this).children(".buy-btn").css("display","block");
	$(this).css("opacity","1.0");
});
$(".main-li").mouseleave(function(){
	$(this).children(".buy-btn").css("display","none");
	$(this).css("opacity","0.85");
});

$(function () {
	  $('[data-toggle="tooltip"]').tooltip();
});

$(function () {
	$(".insertBasket").on("click",function(){
		var memberId = '${member_id}';

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
	});
	
	// 구매하기
	$(".purchase").on("click",function(){
		var productNo = $(this).parent().parent().find("[name=product_no]").val();
		var productAmount = $(this).parent().parent().find("[name=product_amount]").val();
		var memberId = '${member_id}';

		location.href="${pageContext.request.contextPath}/purchase/buyNow.do?productNo=" + productNo + "&productAmount=" + productAmount+"&memberId="+memberId;
	});
});

// 검색 바에 검색 키워드 보여주기
$(function () {
	$("#productKey").val("${searchKeyword }");
});


function fn_checkAll(bool) {
    var chkboxes = document.getElementsByName("brand");

    for(var i=0; i<chkboxes.length; i++) {
        chkboxes[i].checked = bool;
    }
}

function fn_toggle(bool) {
    var chkboxes = document.getElementsByName("brand");
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

// 카테고리 다중 셀렉트
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

// 검색결과에 따른 카테고리 표시
/* $(function(){
	var searchKeyword = "${searchKeyword}";
	var level1 = "";
	var level2 = "";
	var level3 = "";
	
	$.ajax({
		url:"${pageContext.request.contextPath}/product/selectCategory.do",
		data:{searchKeyword: searchKeyword},
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
	
	/* $(".category-level").on("change",function(){
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
}); */


$(function() {
	// 최상위 카테고리 클릭 시
 	$(".inner").click(function() {
 		var inner = document.getElementsByClassName("inner");

 		for(var i=0; i<inner.length; i++) {
 			if(inner[i].parentNode.parentNode.parentNode.className.indexOf('on') != -1) {
 				var classname = 'cate0'+(i+1);
 				console.log(classname);
 				inner[i].parentNode.parentNode.parentNode.className = classname;
 			}
 		}
 		
 		// 해당 요소가 선택되었음을 의미하는 on class 추가해줌
 		$(this).parents("li").addClass('on');
	});
});


$(function() {
	// 최상위 카테고리 클릭 시
 	$(".inner").click(function() {
 		var inner = document.getElementsByClassName("inner");

 		// 이미 선택된 카테고리 해제
 		for(var i=0; i<inner.length; i++) {
 			if(inner[i].parentNode.parentNode.parentNode.className.indexOf('on') != -1) {
 				inner[i].parentNode.parentNode.parentNode.className = 'cate0'+(i+1);
 			}
 		}
 		
 		// 해당 요소가 선택되었음을 의미하는 on class 추가해줌
 		$(this).parents("li").addClass('on');
	});
});

//리서치.do
$(function(){
	$("#research").on("click",function(){
		var searchKeyword=$("#productKey").val();
		var ck=document.getElementsByName("brand");
		var brand=new Array();
		for(var i in ck){
			if(ck[i].checked==true){
				brand.push(ck[i].value);
			}
		}
		if(brand.length>1){
			brand.shift();
		}else if(brand.length==0){
			brand.push("all");
		}
		console.log(brand);
		
		var price1=document.getElementById("price1").value;
		var price2=document.getElementById("price2").value;
		
		location.href="${pageContext.request.contextPath}/product/reSearch.do?searchKeyword="+searchKeyword+"&brand="+brand+"&categoryselect="+"1"+"&price1="+price1+"&price2="+price2;
	});
});

</script>
<style>
/* div.main-li-container li.CU {
	background: rgb(195, 148, 212);
	opacity: 0.85;
}

div.main-li-container li.7ELEVEN {
	background: rgb(27, 147, 42);
	opacity: 0.85;
}

div.main-li-container li.GS25 {
	background: rgb(203, 238, 243);
	opacity: 0.85;
}

div.main-li-container li.MINISTOP {
	background: rgb(255, 190, 204);
	opacity: 0.85;
}

div.main-li-container li.EMART24 {
	background: rgb(255, 223, 104);
	opacity: 0.85;
}
 */


/* 상세 검색 */
.listStyleNone-hyelin {
	list-style: none;
}

ul.category-hyelin li {
	display: inline;
} 
.listTitle-hyelin {
	font-size: 18px;
	font-weight: bold;
	padding-right: 50px;
	width: 250px;
}

ul.category-hyelin li label {
	width: 120px;
} 
.searchMore-hyelin {
	width: 980px;
	margin: 0 auto;
}
.paddingLeft10-hyelin {
	padding-left: 10px;
}
.title-hyelin{
	display: inline;
}
[name=price1], [name=price2] {
	text-align: right;
}
/* 검색페이지 - 카테고리 및 가격대 검색 */
.search_result_cate {margin-bottom:13px; width: 620px;}

/* 검색페이지 - 카테고리 */
.search__list_category:after {display:block;clear:both;content:'';}
.search__list_category .list_cate {float:left;min-height:49px;padding-left: 0;}
.search__list_category .list_cate > li {float:left;width:100%;}
.search__list_category .list_cate .wrap_link_cate {height:0;}
.search__list_category .list_cate .link_cate {position:absolute;top:0;font-weight:bold;font-size:12px;color:#333;text-align:center;background-color:#f9f9f9;}
.search__list_category .list_cate .cate01 .link_cate {left:0px;border-left:1px solid #ddd;}
.search__list_category .list_cate .cate02 .link_cate {left:96px;}
.search__list_category .list_cate .cate03 .link_cate {left:201px;}
.search__list_category .list_cate .cate04 .link_cate {left:306px;}
.search__list_category .list_cate .cate05 .link_cate {left:411px;}
.search__list_category .list_cate .cate06 .link_cate {left:516px;}
.search__list_category .list_cate .cate07 .link_cate {left:621px;}
.search__list_category .list_cate .cate08 .link_cate {left:725px;}
.search__list_category .list_cate .cate09 .link_cate {right:1px;}
.search__list_category .list_cate > .on .link_cate {top:-1px;z-index:1;border-top:2px solid #ce1710;}
.search__list_category .list_cate > .empty .link_cate,
.search__list_category .list_cate > .empty .link_cate:hover,
.search__list_category .list_cate > .empty .link_cate:focus {color:#bebebe;}
.search__list_category .list_cate .link_cate .inner {display:block;height:47px;padding-top:1px;border-width:0 1px 0 1px;border-style:solid;border-color:#eee;line-height:36px;letter-spacing:-0.5px;}
.search__list_category .list_cate .cate01 .link_cate .inner {width:95px;border-left:0px;}
.search__list_category .list_cate .cate02 .link_cate .inner,
.search__list_category .list_cate .cate03 .link_cate .inner,
.search__list_category .list_cate .cate04 .link_cate .inner,
.search__list_category .list_cate .cate05 .link_cate .inner,
.search__list_category .list_cate .cate06 .link_cate .inner,
.search__list_category .list_cate .cate07 .link_cate .inner,
.search__list_category .list_cate .cate08 .link_cate .inner {width:104px;}
.search__list_category .list_cate .cate09 .link_cate .inner {width:105px;border-right:0px;}
.search__list_category .list_cate > .on .link_cate .inner {border-bottom-color:#fff;border-width:0 1px 0px 1px;border-color:#ddd;border-style:solid}
.search__list_category .list_cate > .on.cate01 .link_cate .inner {border-bottom-color:#fff;border-width:0 1px 0px 0;border-color:#ddd;border-style:solid}
.search__list_category .list_cate .link_cate .num {display:block;font-weight:normal;font-family:tahoma;font-size:11px;color:#999;line-height:0;margin-top:-5px;}
.search__list_category .list_cate .link_cate:hover{color:#ce1710;background-color:#f9f9f9;}
.search__list_category .list_cate .link_cate:focus,
.search__list_category .list_cate > .on .link_cate,
.search__list_category .list_cate > .on .link_cate .num {color:#ce1710;background-color:#fff;}
.search__list_category .list_cate .list_depth_02 {display:none;margin-top:49px;padding:8px 0 17px 24px;border-color:transparent transparent #ddd #ddd;*zoom:1;}
.search__list_category .list_cate > .on .list_depth_02 {display:block;}
.search__list_category .list_cate .list_depth_02:after {display:block;clear:both;content:'';}
.search__list_category .list_cate .list_depth_02 > li {float:left;width:100px;height:18px;margin-top:10px;margin-right: 20px;}
.search__list_category .list_cate .list_depth_02 > li > a {float:left;margin-right:5px;}
.search__list_category .list_cate .list_depth_02 a {color:#666;}
.search__list_category .list_cate .list_depth_02 a:hover,
.search__list_category .list_cate .list_depth_02 a:focus,
.search__list_category .list_cate .list_depth_02 a:hover > .num,
.search__list_category .list_cate .list_depth_02 a:focus > .num {color:#ce1710;}
.search__list_category .list_cate .list_depth_02 .num {position:relative;top:-1px;font-family:tahoma;font-size:10px;color:#999;}
.search__list_category .list_cate .list_depth_02 > .on > a,
.search__list_category .list_cate .list_depth_02 > .on .num {color:#ce1710;}
/* .search__list_category .list_cate .list_depth_02 > li > .btn_more {overflow:hidden;float:left;width:14px;height:14px;margin-top:2px;background:url(//image.wemakeprice.com/images/2013/view/ico_search_result_more.png) no-repeat;text-indent:-9999px;} */
.btn_more {padding: 0; margin-bottom: 6px; margin-left: 3px;}
.search__list_category .list_cate .layer_more_cate {overflow:hidden;position:relative;z-index:1;min-width:165px;max-width:210px;max-height:115px;height:0;border:1px solid #ddd;box-shadow:1px 1px 2px rgba(0, 0, 0, .1);background-color:#fff;opacity:0;filter:alpha(opacity=0);}
.search__list_category .list_cate .layer_more_open {overflow-y:auto;height:auto;opacity:1;filter:alpha(opacity=100);}
.search__list_category .list_cate .layer_more_cate .list_more_cate {padding:11px 15px 11px;}
.search__list_category .list_cate .layer_more_cate .list_more_cate li {margin-top:2px;padding-left:8px;background:url(//image.wemakeprice.com/images/2014/search/ico_dot.png) no-repeat 0 7px;}
.search__list_category .list_cate .layer_more_cate .list_more_cate a {display:block;}
.search__list_category {position:relative;min-height:49px;border:1px solid #ddd;background:url(//image.wemakeprice.com/images/2014/search/bg_sarch_tab.png) repeat-x;*zoom:1;}
.search__list_category ul, .search__list_category li { list-style: none; }

.marginLeft30-hyelin {
	margin-left: 30px;
}

.marginRight0-hyelin {
	margin-right: 0 !important;
}

</style>



<c:if test="${not empty searchKeyword }">
	<p class="alignCenter-hyelin"><span class="bold-hyelin fontSize30-hyelin">'${searchKeyword }'</span>&nbsp; <span class="fontSize30-hyelin colorGray-hyelin">검색결과</span></p>
</c:if>
<c:if test="${empty searchKeyword }">
	<p class="alignCenter-hyelin"><span class="bold-hyelin fontSize30-hyelin">전체</span>&nbsp; <span class="fontSize30-hyelin colorGray-hyelin">검색결과</span></p>
</c:if>

<table class="table searchMore-hyelin">
	<tr>
		<th scope="row">
			브랜드 &nbsp;
			<input type="checkbox" id="allCheck" name="allCheck" onchange="fn_checkAll(this.checked);" >
			<input class="form-check-input" type="hidden" name="brand" class="brand" value="all">
		</th>
		<td>
			<input type="checkbox" name="brand" id="CU" onclick="fn_toggle(this.checked)" class="brand" value="CU"/>
			<label for="CU">CU</label>
		</td>
		<td>
			<input type="checkbox" name="brand" id="GS25" onclick="fn_toggle(this.checked)" class="brand" value="GS25"/>
			<label for="GS25">GS25</label>
		</td>
		<td>
			<input type="checkbox" name="brand" id="7ELEVEN" onclick="fn_toggle(this.checked)" class="brand" value="7ELEVEN"/>
			<label for="7ELEVEN">7ELEVEN</label>
		</td>
		<td>
			<input type="checkbox" name="brand" id="MINISTOP" onclick="fn_toggle(this.checked)" class="brand" value="MINISTOP"/>
			<label for="MINISTOP">MINISTOP</label>
		</td>
		<td>
			<input type="checkbox" name="brand" id="EMART24" onclick="fn_toggle(this.checked)" class="brand" value="EMART24"/>
			<label for="EMART24">EMART24</label>
		</td>
		<td></td>
	</tr>
	<tr>
		<th scope="row">카테고리</th>
		<td colspan="6">
		<div class="search_result_cate">
				<div class="search__list_category">
					<c:forEach var="c" items="${categoryList }" varStatus="vs">
						<c:if test="${c.category_level==1 }">
							<ul class="list_cate">
								<c:if test="${c.category_no eq 1 }">
									<li class="cate0${c.category_no } on">						
								</c:if>
								<c:if test="${vs.index ne 1 }">
									<li class="cate0${c.category_no }">												
								</c:if>
								<div class="wrap_link_cate">
									<p class="link_cate"><span class="inner">${c.category_name }</span></p>
								</div>
								
								<ul class="list_depth_02">
									<c:forEach var="cc" items="${categoryList }" varStatus="vs2">
										<c:if test="${cc.parent_category eq c.category_no }">
											<li>
												<span>${cc.category_name }</span>
												<c:set var="count" value="0" />
												<c:forEach var="ccc" items="${categoryList }" varStatus="vs3">
													<c:if test="${ccc.parent_category eq cc.category_no }">	
														<c:set var="count" value="${count + 1}" />
														<c:if test="${count eq 1 }">
															<button type="button" class="btn btn-transparent-hyelin btn_more">
															<img src="${pageContext.request.contextPath}/resources/img/add.png" alt="" class="btnImg-hyelin" title="하위 카테고리 보기" data-toggle="tooltip" data-placement="bottom" />
															</button>												
														</c:if>
														<div class="layer_more_cate">
															<ul class="list_more_cate">
																<li class="">${ccc.category_name }</li>
															</ul>
														</div>
													</c:if>
												</c:forEach>
											</li>
										</c:if>
									</c:forEach>
								</ul> 	
								</li>
							</ul>
						</c:if>
				</c:forEach>
			</div>
		</div> 
	</tr>
	<tr>
		<th scope="row">가격대</th>
		<td colspan="5">
			<input type="number" id="price1" name="price1" min="0" step="500" value="0" class="form-control price1" style="width: 150px; display: inline-block;">원 &nbsp; ~ &nbsp;
			<input type="number" id="price2" name="price2" min="0" step="500" value="0" class="form-control price2" style="width: 150px; display: inline-block;">원
		</td>
		<td>
			<button type="button" class="btn btn-info" id="research"> <img src="${pageContext.request.contextPath }/resources/img/search.png" alt="" /> 검색 </button>
		</td>
	</tr>
</table>
<hr class="searchMore-hyelin"/>
<br /><br />


<!-- 검색 결과 리스트 보여주기 -->
<div id="searchContainer-hyelin">
	<c:forEach var="p" items="${searchList }" varStatus="vs">
		<div class="card card-hyelin">
			<div class="card-body">
				<%-- <p>판매량 ${p.purchaseAmount }</p> --%>
				<img src="${pageContext.request.contextPath}/resources/upload/productFile/${p.renamedFileName}" class="prod-img-hyelin">
				<h5 class="card-title">${p.brandName } ${p.productName }</h5>
				<p class="card-text card-text-hyelin inline-hyelin"><fmt:formatNumber value="${p.price }" type="currency" currencySymbol=""/>원
					<c:if test="${searchList.size()>1 }">
						<c:if test="${p.price>avgprice }">
								<img src="${pageContext.request.contextPath}/resources/img/up.png" style="width: 20px; height: 30px;">				
						</c:if>
						<c:if test="${p.price<avgprice }">
								<img src="${pageContext.request.contextPath}/resources/img/down.png" style="width: 20px; height: 30px;">			
						</c:if>
						<c:if test="${p.price==avgprice }">
								<img src="${pageContext.request.contextPath}/resources/img/avg.png" style="width: 20px; height: 30px;">					
						</c:if>
						<c:if test="${p.price==rowprice }">
								<img src="${pageContext.request.contextPath}/resources/img/row.GIF" style="width: 30px; height: 30px;">			
						</c:if>					
						<c:if test="${p.productName==popmenu.productName }">
								<img src="${pageContext.request.contextPath}/resources/img/pop.png" style="width: 40px; height: 40px;">			
						</c:if>					
					</c:if>
				</p>					
				<input type="number" class="form-control inline-hyelin right-hyelin right10-hyelin" style="width: 70px; margin: 0 auto;" name="product_amount" value="1" min="1">
				<input type="hidden" name="product_no" value="${p.productNo }"/>
				<div class="btnDiv-hyelin">
					<button class="btn-transparent-hyelin insertBasket">
						<img id="img-cart-hyelin" src="${pageContext.request.contextPath}/resources/img/cart.png" alt="" class="btnImg-hyelin" title="장바구니" data-toggle="tooltip" data-placement="bottom"/>
					</button>
					<button class="btn-transparent-hyelin purchase">
						<img src="${pageContext.request.contextPath}/resources/img/card.png" alt="" class="btnImg-hyelin" title="구매하기" data-toggle="tooltip" data-placement="bottom"/>
					</button>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<a href="${pageContext.request.contextPath}/product/mailTest.do">이메일테스트페이지 실험중이라 누르지말아주세요 ㅠ</a>
<%-- <div class="searchbtn">
	<button class="btn btn-success" onclick="search();">상세검색</button>
</div>
<br />



<div class="main-li-container">
	<c:forEach var="p" items="${searchList }" varStatus="vs">
		<li class="main-li ${p.brandName }"><img
			src="${pageContext.request.contextPath}/resources/upload/productFile/${p.renamedFileName}"><br />
			<div class="product-text">
				<div class="ptext brandName" id="brandName">${p.brandName }</div>
				<div class="ptext productName">${p.productName }</div>
				<div class="pprice">${p.price }원</div>
			</div>
			<div class="buy-btn">
				<button type="button" class="btn btn-primary">장바구니</button>
				&nbsp;
				<button type="button" class="btn btn-success">구매</button>
			</div></li>
	</c:forEach>
</div> --%>
<br>
<br>
<div class="blog-container">
	<div class="blogtext-container">
		<img src="${pageContext.request.contextPath}/resources/img/blogimg.GIF" alt="" class="blogimg" /> 
			<c:if test="${searchList.size() > 0}"> 
				<input type="text" readonly="readonly" value="  ${searchList[0].productName } 후기" class="blogtext" />			
			</c:if>
			<c:if test="${searchList.size() == 0 }"> 
				<input type="text" readonly="readonly" value="  ${searchKeyword } 후기" class="blogtext" />			
			</c:if>			
	</div>
	<br />
	<!--  <h4>네이버 블로그</h4>    -->
	<p id="blog1"></p>
	<hr />
	<p id="blog2"></p>
	<hr />
	<p id="blog3"></p>
	<hr />
	<p id="blog4"></p>
	<hr />
	<p id="blog5"></p>

</div>

<br /><br />

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>