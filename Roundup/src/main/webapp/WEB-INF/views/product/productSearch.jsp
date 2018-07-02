<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="검색결과" name="pageTitle"/>
</jsp:include>

<script src="${pageContext.request.contextPath }/resources/js/jquery.sumoselect.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/sumoselect.css" rel="stylesheet" />

<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<script>
$(function(){
   var bloginfo=${bloginfo};
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
    var chkboxes = document.getElementsByName("convenience");

    for(var i=0; i<chkboxes.length; i++) {
        chkboxes[i].checked = bool;
    }
}

function fn_toggle(bool) {
    var chkboxes = document.getElementsByName("convenience");
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
$(function(){
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
	}); */
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
div#searchContainer-hyelin {
	width: 980px;
	margin: 0 auto;
}

img.prod-img-hyelin {
	width: 280px;
	height: 280px;
}

div.card-hyelin {
	width: 320px;
	display: inline-block;
	position: relative;
	height: 400px;
}

p.card-text-hyelin {
	font-size: 20px;	
}

div.btnDiv-hyelin {
	opacity: 0;
	position: absolute;
	top: 120px;
	margin: 0 auto;
	left: 80px;
}

div.card-hyelin:hover div.btnDiv-hyelin {
	opacity: 1;
	z-index: 20;
}

div.card-body:hover img.prod-img-hyelin{
	opacity: 0.5;
}

div.btnDiv-hyelin img {
	width: 70px;
	border-radius: 50px;
}

label.label-bgWhite-hyelin {
	background: #fff !important;
	width: 100px;
}

select.select-hyelin {
	width: 120px;
}

div#detailContainer-hyelin {
	width: 980px;
	margin: 0 auto;
}

img.btnImg-hyelin {
	cursor: pointer;
}

.right10-hyelin {
	margin-right: 10px !important;
}
.btn-transparent-hyelin {
	background: transparent;
	border-color: transparent;
}
.card-title {
	margin-top: 10px;
}
.bold-hyelin {
	font-weight: bold;
}
.fontSize30-hyelin{
	font-size: 30px;
}
.colorGray-hyelin {
	color: gray;
}
.alignCenter-hyelin {
	text-align: center;
}


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
.search_result_cate {margin-bottom:13px; width: 820px;}

/* 검색페이지 - 카테고리 */
.search__list_category {position:relative;min-height:49px;border-top:1px solid #ddd;background:url(//image.wemakeprice.com/images/2014/search/bg_sarch_tab.png) repeat-x;*zoom:1;}
.search__list_category:after {display:block;clear:both;content:'';}
.search__list_category .list_cate {float:left;min-height:49px;border-right:1px solid #ddd;padding-left: 0;}
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
.search__list_category .list_cate .list_depth_02 {display:none;margin-top:49px;padding:8px 0 17px 24px;border-width:0 0 1px 1px;border-style:solid;border-color:transparent transparent #ddd #ddd;*zoom:1;}
.search__list_category .list_cate > .on .list_depth_02 {display:block;}
.search__list_category .list_cate .list_depth_02:after {display:block;clear:both;content:'';}
.search__list_category .list_cate .list_depth_02 > li {float:left;width:24.9%;height:18px;margin-top:10px;}
.search__list_category .list_cate .list_depth_02 > li > a {float:left;margin-right:5px;}
.search__list_category .list_cate .list_depth_02 a {color:#666;}
.search__list_category .list_cate .list_depth_02 a:hover,
.search__list_category .list_cate .list_depth_02 a:focus,
.search__list_category .list_cate .list_depth_02 a:hover > .num,
.search__list_category .list_cate .list_depth_02 a:focus > .num {color:#ce1710;}
.search__list_category .list_cate .list_depth_02 .num {position:relative;top:-1px;font-family:tahoma;font-size:10px;color:#999;}
.search__list_category .list_cate .list_depth_02 > .on > a,
.search__list_category .list_cate .list_depth_02 > .on .num {color:#ce1710;}
.search__list_category .list_cate .list_depth_02 > li > .btn_more {overflow:hidden;float:left;width:14px;height:14px;margin-top:2px;background:url(//image.wemakeprice.com/images/2013/view/ico_search_result_more.png) no-repeat;text-indent:-9999px;}
.search__list_category .list_cate .layer_more_cate {overflow:hidden;position:relative;z-index:1;min-width:165px;max-width:210px;max-height:115px;height:0;border:1px solid #ddd;box-shadow:1px 1px 2px rgba(0, 0, 0, .1);background-color:#fff;opacity:0;filter:alpha(opacity=0);}
.search__list_category .list_cate .layer_more_open {overflow-y:auto;height:auto;opacity:1;filter:alpha(opacity=100);}
.search__list_category .list_cate .layer_more_cate .list_more_cate {padding:11px 15px 11px;}
.search__list_category .list_cate .layer_more_cate .list_more_cate li {margin-top:2px;padding-left:8px;background:url(//image.wemakeprice.com/images/2014/search/ico_dot.png) no-repeat 0 7px;}
.search__list_category .list_cate .layer_more_cate .list_more_cate a {display:block;}
.search__list_category ul, .search__list_category li {
	list-style: none;
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
			<input type="checkbox" id="allCheck" name="allCheck" onchange="fn_checkAll(this.checked);">
		</th>
		<td>
			<input type="checkbox" name="convenience" id="CU" onclick="fn_toggle(this.checked)"/>
			<label for="CU">CU</label>
		</td>
		<td>
			<input type="checkbox" name="convenience" id="GS25" onclick="fn_toggle(this.checked)"/>
			<label for="GS25">GS25</label>
		</td>
		<td>
			<input type="checkbox" name="convenience" id="7ELEVEN" onclick="fn_toggle(this.checked)"/>
			<label for="7ELEVEN">7ELEVEN</label>
		</td>
		<td>
			<input type="checkbox" name="convenience" id="MINISTOP" onclick="fn_toggle(this.checked)"/>
			<label for="MINISTOP">MINISTOP</label>
		</td>
		<td>
			<input type="checkbox" name="convenience" id="EMART24" onclick="fn_toggle(this.checked)"/>
			<label for="EMART24">EMART24</label>
		</td>
		<td></td>
	</tr>
	<tr>
		<th scope="row">카테고리</th>
		<td colspan="6">
		<div class="search_result_cate">
	<div class="search__list_category">
		<ul class="list_cate">
			<li class="cate01 on">
				<div class="wrap_link_cate">
					<a href="javascript:category_search(&#039;&#039;,&#039;&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);" class="link_cate"> 
						<span class="inner">간편식사</span>
					</a>
				</div>
				<ul class="list_depth_02">
					<li><a
						href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">
							PC부품&middot;주변기기<span class="num">(1686)</span>
					</a>
						<button type="button" class="btn_more">하위 카테고리 보기</button>
						<div class="layer_more_cate">
							<ul class="list_more_cate">


								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105303&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">키보드<span
										class="num">(1,497)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105304&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">PC
										액세서리<span class="num">(81)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105318&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">마우스<span
										class="num">(56)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105311&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">케이블<span
										class="num">(16)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105309&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">스피커<span
										class="num">(12)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105319&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">타블렛&middot;펜<span
										class="num">(10)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105310&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">헤드셋&middot;마이크<span
										class="num">(3)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105302&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">메인보드&middot;그래픽<span
										class="num">(2)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105306&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">외장하드&middot;NAS<span
										class="num">(2)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105307&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">USB메모리<span
										class="num">(2)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105308&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">증폭기&middot;허브<span
										class="num">(2)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105312&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">소프트웨어<span
										class="num">(1)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105322&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">케이스&middot;파워&middot;쿨러<span
										class="num">(1)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105300&#039;,&#039;105323&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">PC캠&middot;IP카메라&middot;CCTV<span
										class="num">(1)</span></a></li>

							</ul>
						</div></li>

					<li><a
						href="javascript:category_search(&#039;100030&#039;,&#039;102200&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">
							노트북&middot;PC<span class="num">(546)</span>
					</a>
						<button type="button" class="btn_more">하위 카테고리 보기</button>
						<div class="layer_more_cate">
							<ul class="list_more_cate">


								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;102200&#039;,&#039;102210&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">태블릿
										액세서리<span class="num">(166)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;102200&#039;,&#039;102201&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">노트북<span
										class="num">(119)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;102200&#039;,&#039;102208&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">중고&middot;리퍼&middot;반품&middot;전시<span
										class="num">(104)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;102200&#039;,&#039;102202&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">데스크탑PC<span
										class="num">(97)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;102200&#039;,&#039;102203&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">태블릿PC<span
										class="num">(31)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;102200&#039;,&#039;102220&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">노트북
										액세서리<span class="num">(19)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;102200&#039;,&#039;102219&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">올인원PC<span
										class="num">(10)</span></a></li>

							</ul>
						</div></li>

					<li><a
						href="javascript:category_search(&#039;100030&#039;,&#039;101000&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">
							휴대폰<span class="num">(64)</span>
					</a>
						<button type="button" class="btn_more">하위 카테고리 보기</button>
						<div class="layer_more_cate">
							<ul class="list_more_cate">


								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;101000&#039;,&#039;101009&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">휴대폰
										액세서리<span class="num">(21)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;101000&#039;,&#039;101024&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">충전기&middot;케이블<span
										class="num">(12)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;101000&#039;,&#039;101029&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">촬영용품&middot;거치대<span
										class="num">(10)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;101000&#039;,&#039;101026&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">하드
										케이스<span class="num">(8)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;101000&#039;,&#039;101027&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">가죽
										케이스<span class="num">(6)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;101000&#039;,&#039;101017&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">젤리
										케이스<span class="num">(4)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;101000&#039;,&#039;101004&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">웨어러블&middot;스마트기기<span
										class="num">(2)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;101000&#039;,&#039;101030&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">중고폰<span
										class="num">(1)</span></a></li>

							</ul>
						</div></li>

					<li><a
						href="javascript:category_search(&#039;100030&#039;,&#039;105100&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">
							카메라&middot;게임<span class="num">(43)</span>
					</a>
						<button type="button" class="btn_more">하위 카테고리 보기</button>
						<div class="layer_more_cate">
							<ul class="list_more_cate">


								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105100&#039;,&#039;105110&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">게임
										컨트롤러<span class="num">(34)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105100&#039;,&#039;105109&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">게임기<span
										class="num">(5)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105100&#039;,&#039;105111&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">게임
										액세서리<span class="num">(4)</span>
								</a></li>

							</ul>
						</div></li>

					<li><a
						href="javascript:category_search(&#039;100030&#039;,&#039;105200&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">
							모니터&middot;프린터<span class="num">(27)</span>
					</a>
						<button type="button" class="btn_more">하위 카테고리 보기</button>
						<div class="layer_more_cate">
							<ul class="list_more_cate">


								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105200&#039;,&#039;105201&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">모니터<span
										class="num">(20)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105200&#039;,&#039;105203&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">모니터
										액세서리<span class="num">(7)</span>
								</a></li>

							</ul>
						</div></li>

					<li><a
						href="javascript:category_search(&#039;100030&#039;,&#039;105000&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">
							음향기기<span class="num">(13)</span>
					</a>
						<button type="button" class="btn_more">하위 카테고리 보기</button>
						<div class="layer_more_cate">
							<ul class="list_more_cate">


								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105000&#039;,&#039;105003&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">스피커<span
										class="num">(3)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105000&#039;,&#039;105006&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">노래방&middot;마이크<span
										class="num">(3)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105000&#039;,&#039;105011&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">블루투스
										이어폰<span class="num">(3)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105000&#039;,&#039;105002&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">일반
										헤드폰<span class="num">(1)</span>
								</a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105000&#039;,&#039;105005&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">MP3<span
										class="num">(1)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105000&#039;,&#039;105013&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">보이스레코더<span
										class="num">(1)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105000&#039;,&#039;105014&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">전자사전&middot;학습기<span
										class="num">(1)</span></a></li>

							</ul>
						</div></li>

					<li><a
						href="javascript:category_search(&#039;100030&#039;,&#039;105700&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">
							생활가전<span class="num">(3)</span>
					</a>
						<button type="button" class="btn_more">하위 카테고리 보기</button>
						<div class="layer_more_cate">
							<ul class="list_more_cate">


								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;105700&#039;,&#039;105701&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">진공청소기<span
										class="num">(3)</span></a></li>

							</ul>
						</div></li>

					<li><a
						href="javascript:category_search(&#039;100030&#039;,&#039;103800&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">
							대형가전<span class="num">(2)</span>
					</a>
						<button type="button" class="btn_more">하위 카테고리 보기</button>
						<div class="layer_more_cate">
							<ul class="list_more_cate">


								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;103800&#039;,&#039;103825&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">빔프로젝터<span
										class="num">(2)</span></a></li>

							</ul>
						</div></li>

					<li><a
						href="javascript:category_search(&#039;100030&#039;,&#039;104800&#039;,&#039;&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">
							계절가전<span class="num">(2)</span>
					</a>
						<button type="button" class="btn_more">하위 카테고리 보기</button>
						<div class="layer_more_cate">
							<ul class="list_more_cate">


								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;104800&#039;,&#039;104802&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">공기청정기<span
										class="num">(1)</span></a></li>

								<li class="on"><a
									href="javascript:category_search(&#039;100030&#039;,&#039;104800&#039;,&#039;104804&#039;,&#039;키보드&#039;,&#039;5&#039;, &#039;3&#039;, &#039;&#039;);">선풍기<span
										class="num">(1)</span></a></li>

							</ul>
						</div></li>
				</ul>
			</li>
			<li class="cate02">
				<div class="wrap_link_cate">
					<a href="javascript:;" class="link_cate"> 
						<span class="inner">식품</span>
					</a>
				</div>
			</li>
					<li class="cate03 ">
				<div class="wrap_link_cate">
					<a href="javascript:;" class="link_cate"> 
						<span class="inner">과자류</span>
					</a>
				</div>

			</li>
			<li class="cate04 ">
				<div class="wrap_link_cate">
					<a href="javascript:;" class="link_cate"> 
						<span class="inner">아이스크림</span>
					</a>
				</div>

			</li>
			<li class="cate05 ">
				<div class="wrap_link_cate">
					<a href="javascript:;" class="link_cate"> 
						<span class="inner">즉석식품</span>
					</a>
				</div>

			</li>
			<li class="cate06 ">
				<div class="wrap_link_cate">
					<a href="javascript:;" class="link_cate"> 
						<span class="inner">음료</span>
					</a>
				</div>

			</li>
		</ul>
	</div>

</div>
			<!-- <div id="addSelectCategory">

			</div>
			<div class="input-group mb-3">
		  		<select class="custom-select category-level level-1" name="categoryNo" id="category1" >onchange="doChange(this,'category2');"
					<option value="1">간편식사</option>
					<option value="2">식품</option>
					<option value="3">과자류</option>
					<option value="4">아이스크림</option>
					<option value="5">즉석식품</option>
					<option value="6">음료</option>
				</select>
				<select class="custom-select category-level level-2" name="categoryNo" id="category2">
				  	<option value="7">김밥</option>
				    <option value="8">도시락</option>
				    <option value="9">샌드위치</option>
				    <option value="10">햄버거</option>
				    <option value="11">컵밥/국</option>
				    <option value="12">라면</option>
				    <option value="13">냉동식품</option>
				    <option value="14">냉장식품</option>
				    <option value="15">껌/사탕/초코</option>
				    <option value="16">박스과자</option>
				    <option value="17">봉지과자</option>
				    <option value="18">바</option>
				    <option value="19">콘</option>
				    <option value="20">컵</option>
				    <option value="21">튀김</option>
				    <option value="22">빵</option>
				    <option value="23">유제품</option>
				    <option value="24">캔</option>
				    <option value="25">페트</option>
				    <option value="26">유리</option>
				</select>
	  			<select class="custom-select category-level level-3" name="categoryNo" id="category3">
	  				<option value="27">삼각김밥</option>
				    <option value="28">원형김밥</option>
				    <option value="29">고기</option>
				    <option value="30">치킨</option>
				    <option value="31">컵라면</option>
				    <option value="32">봉지라면</option>
				    <option value="33">치킨</option>
				    <option value="34">피자</option>
				    <option value="35">만두</option>
				    <option value="36">돼지고기</option>
				    <option value="37">가공식품</option>
				    <option value="38">안주</option>
				    <option value="39">식재료</option>
	  			</select>
		    </div>
		</td>
		<td>
			<input type="checkbox" name="간편식사" id="간편식사" />
			<label for="간편식사">간편식사</label>
		</td>
		<td>
			<input type="checkbox" name="식품" id="식품" />
			<label for="식품">식품</label>
		</td>
		<td>
			<input type="checkbox" name="과자류" id="과자류" />
			<label for="과자류">과자류</label>
		</td>
		<td>
			<input type="checkbox" name="아이스크림" id="아이스크림" />
			<label for="아이스크림">아이스크림</label>
		</td>
		<td>
			<input type="checkbox" name="즉석식품" id="즉석식품" />
			<label for="즉석식품">즉석식품</label>
		</td>
		<td>
			<input type="checkbox" name="음료" id="음료" />
			<label for="음료">음료</label>
		</td> -->
	</tr>
	<tr>
		<th scope="row">가격대</th>
		<td colspan="5">
			<input type="number" name="price1" min="0" step="500" value="0" class="form-control" style="width: 150px; display: inline-block;">원 &nbsp; ~ &nbsp;
			<input type="number" name="price2" min="0" step="500" value="0" class="form-control" style="width: 150px; display: inline-block;">원
		</td>
		<td>
			<button type="button" class="btn btn-info"> <img src="${pageContext.request.contextPath }/resources/img/search.png" alt="" /> 검색 </button>
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
				<img src="${pageContext.request.contextPath}/resources/upload/productFile/${p.renamedFileName}" class="prod-img-hyelin">
				<h5 class="card-title">${p.brandName } ${p.productName }</h5>
				<p class="card-text card-text-hyelin inline-hyelin"><fmt:formatNumber value="${p.price }" type="currency" currencySymbol=""/>원</p>					
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

<a href="${pageContext.request.contextPath}/product/mailTest.do">이메일테스트페이지</a>
<%-- <div class="searchbtn">
	<button class="btn btn-success" onclick="search();">상세검색</button>
</div>
<br />
<div class="search-div">
	<form action="${pageContext.request.contextPath}/product/reSearch.do">
		<br />
		<h4>브랜드</h4>
		<input type="hidden" name="searchKeyword" value="${searchKeyword }" />
		<input class="form-check-input" type="hidden" name="brand" value="all">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="form-check-input" type="checkbox" name="brand" value="CU" id="CU"><label for="CU">CU</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="form-check-input" type="checkbox" name="brand" value="GS25" id="GS25"><label for="GS25">GS25</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="form-check-input" type="checkbox" name="brand" value="7ELEVEN" id="7ELEVEN"><label for="7ELEVEN">7ELEVEN</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="form-check-input" type="checkbox" name="brand" value="MINISTOP" id="MINISTOP"><label for="MINISTOP">MINISTOP</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<input class="form-check-input" type="checkbox" name="brand" value="EMART24" id="EMART24"><label for="EMART24">EMART24</label> <br />
		<h4>카테고리</h4>
		<select name="categoryselect" id="category" class="form-control" style="width: 50%;">
			<option id="category" name="category" value="0" selected>카테고리</option>
			<option id="category" name="category" value="1">간편식사</option>
			<option id="category" name="category" value="7">-김밥</option>
			<option id="category" name="category" value="27">--삼각김밥</option>
			<option id="category" name="category" value="28">--원형김밥</option>
			<option id="category" name="category" value="8">-도시락</option>
			<option id="category" name="category" value="29">--고기</option>
			<option id="category" name="category" value="30">--치킨</option>
			<option id="category" name="category" value="9">-샌드위치</option>
			<option id="category" name="category" value="10">-햄버거</option>
			<option id="category" name="category" value="2">식품</option>
			<option id="category" name="category" value="11">-컵밥/국</option>
			<option id="category" name="category" value="12">-라면</option>
			<option id="category" name="category" value="31">--컵라면</option>
			<option id="category" name="category" value="32">--봉지라면</option>
			<option id="category" name="category" value="13">-냉동식품</option>
			<option id="category" name="category" value="33">--치킨</option>
			<option id="category" name="category" value="34">--피자</option>
			<option id="category" name="category" value="35">--만두</option>
			<option id="category" name="category" value="36">--돼지고기</option>
			<option id="category" name="category" value="14">-냉장식품</option>
			<option id="category" name="category" value="37">--가공식품</option>
			<option id="category" name="category" value="38">--안주</option>
			<option id="category" name="category" value="39">--식재료</option>
			<option id="category" name="category" value="3">과자류</option>
			<option id="category" name="category" value="15">-껌/사탕/초코</option>
			<option id="category" name="category" value="16">-박스과자</option>
			<option id="category" name="category" value="17">-봉지과자</option>
			<option id="category" name="category" value="4">아이스크림</option>
			<option id="category" name="category" value="18">-바</option>
			<option id="category" name="category" value="19">-콘</option>
			<option id="category" name="category" value="20">-컵</option>
			<option id="category" name="category" value="5">즉석식품</option>
			<option id="category" name="category" value="21">-튀김</option>
			<option id="category" name="category" value="22">-빵</option>
			<option id="category" name="category" value="6">음료</option>
			<option id="category" name="category" value="23">-유제품</option>
			<option id="category" name="category" value="24">-캔</option>
			<option id="category" name="category" value="25">-페트</option>
			<option id="category" name="category" value="26">-유리</option>
		</select>
		<h4>가격대</h4>
		<input type="number" name="price1" min="0" step="500" value="0" class="form-control" style="width: 200px; display: inline-block;">
		~ <input type="number" name="price2" min="0" step="500" value="0" class="form-control" style="width: 200px; display: inline-block;">
		<br>
		<br> <input type="submit" class="btn btn-success" value="검색">
		<input type="button" class="btn btn-success" value="닫기" onclick="searchClose();" /> <br />
		<br />
	</form>
</div>
<br>
<br>


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
</div>
<br>
<br> --%>


<c:if test="${not empty searchKeyword }">
	<div class="blog-container">
		<div class="blogtext-container">
			<img src="${pageContext.request.contextPath}/resources/img/blogimg.GIF" alt="" class="blogimg" /> 
			<input type="text" readonly="readonly" value="  ${searchKeyword } 후기" class="blogtext" />
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
</c:if>
<br /><br /><br />
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>