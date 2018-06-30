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


$(function () {
	window.searchSelAll = $('.search-box-sel-all').SumoSelect({ csvDispCount: 3, selectAll:true, search: true, searchText:'편의점명', okCancelInMulti:true });
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
	width: 150px;
}




















.search_more{overflow:hidden;border:1px solid #ddd}
.search_more>div{border-top:1px solid #ddd}
.search_more>div:first-child{border-top:none}
.search_more_list{clear:both;padding:13px 0 0 25px;overflow:hidden}
.search_more_list .title{float:left;width: 90px;margin-right:45px}
.search_more_list .title h3{float:left;color:#000000;font-size:14px;font-weight:bold}
.search_more_list .title .cmore{float:right;margin-top:1px;width:20px;height:20px;background:url(../../images/icon/ico_plus.gif) no-repeat 0 0;text-indent:-5000px;vertical-align:middle;}
.search_more_list .title .cmore.open{background:url(../../images/icon/ico_minus.gif) no-repeat 0 0;}
.search_more_list ul{float:left;width:920px;height:35px}
.search_more_list ul.addchk{width:553px}
.search_more_list ul li{float:left;width:184px;margin-bottom:15px}
.search_more_list ul li label{font-size:12px}
.search_more_list ul li input.chkbox{width:15px;height:15px}
.search_more_list .price_range{float:left;margin-top:-4px;font-size:12px}
.search_more_list .price_range strong{margin-right:15px;font-size:13px}
.search_more_list .price_range .input_style{width:80px;font-size:13px;color:#000;font-weight:bold}
.search_more_list .price_range .price_range_schBtn{float:right;margin:5px 0 0 15px;width:18px;height:18px;background:url(../../images/icon/ico_category.png) no-repeat 0 -389px;text-indent:-5000px;vertical-align:middle}
.search_more_control{clear:both;padding:13px 0 0 25px;overflow:hidden;background:#f5f5f5}
.search_more_control .title{float:left;width: 90px;margin-right:45px;margin-bottom:16px}
.search_more_control .title h3{float:left;font-size:13px;color:#333333;font-weight:normal}
.search_more_control .title .all_clear{float:left;margin-left:10px;margin-top:2px;width:17px;height:17px;background:url(../../images/layout/rquick_bl.png) no-repeat -58px -207px;text-indent:-5000px;vertical-align:middle;}
.search_more_control .checked_item{float:left;width:920px}
.search_more_control .checked_item li {float:left;margin-right:40px;margin-bottom:15px;font-size:12px}
.search_more_control .checked_item .btn_del{display:inline-block;margin:-1px 0 0 5px;width:11px;height:11px;background:url(../../images/layout/rquick_bl.png) no-repeat -39px -209px;text-indent:-9999px;z-index:1;vertical-align:middle}
</style>

<script>
$(function () {
	$("#brand").on("click", function() {
		alert($("#brand option:selected").val());
	}); 
	
/* 	var category1 = $("#brand option:selected").val()
	if() */
});

</script>
<p class="alignCenter-hyelin"><span class="bold-hyelin fontSize30-hyelin">'${searchKeyword }'</span>&nbsp; <span class="fontSize30-hyelin colorGray-hyelin">검색결과</span></p>

<!-- 상세검색 -->

<div class="search_more">
	<div class="search_more_list">
		<div class="title">
			<h3>카테고리</h3>
			<a href="javascript:" class="cmore">더보기</a>
		</div>
		<ul class="listStyleNone-hyelin">
			<li><label> <input type="checkbox" class="chkbox"
					title="통조림/즉석/음료" id="lcateSelect0" value="01110001_통조림/즉석/음료_0111"
					CHECKBOXSEQ="0" CHECKBOXNAME="통조림/즉석/음료" /> 통조림/즉석/음료(75)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="냉장/냉동/유제품" id="lcateSelect1" value="01110056_냉장/냉동/유제품_0111"
					CHECKBOXSEQ="1" CHECKBOXNAME="냉장/냉동/유제품" /> 냉장/냉동/유제품(61)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="동원브랜드관" id="lcateSelect2" value="01110018_동원브랜드관_0111"
					CHECKBOXSEQ="2" CHECKBOXNAME="동원브랜드관" /> 동원브랜드관(16)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="슈퍼&마트" id="lcateSelect3" value="01110057_슈퍼&마트_0111"
					CHECKBOXSEQ="3" CHECKBOXNAME="슈퍼&마트" /> 슈퍼&마트(9)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="메가마트 대형마트전용관" id="lcateSelect4"
					value="01110038_메가마트 대형마트전용관_0111" CHECKBOXSEQ="4"
					CHECKBOXNAME="메가마트 대형마트전용관" /> 메가마트 대형마트전용관(7)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="김치/반찬/소스" id="lcateSelect5" value="01110002_김치/반찬/소스_0111"
					CHECKBOXSEQ="5" CHECKBOXNAME="김치/반찬/소스" /> 김치/반찬/소스(2)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="코스트코구매대행관" id="lcateSelect6" value="01110014_코스트코구매대행관_0111"
					CHECKBOXSEQ="6" CHECKBOXNAME="코스트코구매대행관" /> 코스트코구매대행관(2)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="수산/축산" id="lcateSelect7" value="01110004_수산/축산_0111"
					CHECKBOXSEQ="7" CHECKBOXNAME="수산/축산" /> 수산/축산(1)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="생활용품" id="lcateSelect8" value="01110008_생활용품_0111"
					CHECKBOXSEQ="8" CHECKBOXNAME="생활용품" /> 생활용품(1)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="주방용품" id="lcateSelect9" value="01110009_주방용품_0111"
					CHECKBOXSEQ="9" CHECKBOXNAME="주방용품" /> 주방용품(1)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="유아동/도서" id="lcateSelect10" value="01110011_유아동/도서_0111"
					CHECKBOXSEQ="10" CHECKBOXNAME="유아동/도서" /> 유아동/도서(1)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="동원몰" id="lcateSelect11" value="0111_동원몰_0111"
					CHECKBOXSEQ="11" CHECKBOXNAME="동원몰" /> 동원몰(1)
			</label></li>
		</ul>
	</div>
	<div class="search_more_list">
		<div class="title">
			<h3>매장</h3>
		</div>
		<ul>
			<li><label> <input type="checkbox" class="chkbox"
					title="쿨밴드배송" id="lcateSelect12" value="01120009_쿨밴드배송_0112"
					CHECKBOXSEQ="12" CHECKBOXNAME="쿨밴드배송" /> 쿨밴드배송(37)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="임직원몰" id="lcateSelect13" value="01120011_임직원몰_0112"
					CHECKBOXSEQ="13" CHECKBOXNAME="임직원몰" /> 임직원몰(7)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="달려라할인 쿠폰적용상품" id="lcateSelect14"
					value="01120012_달려라할인 쿠폰적용상품_0112" CHECKBOXSEQ="14"
					CHECKBOXNAME="달려라할인 쿠폰적용상품" /> 달려라할인 쿠폰적용상품(2)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="밴드배송" id="lcateSelect15" value="01120008_밴드배송_0112"
					CHECKBOXSEQ="15" CHECKBOXNAME="밴드배송" /> 밴드배송(1)
			</label></li>
		</ul>
	</div>
	<div class="search_more_list">
		<div class="title">
			<h3>브랜드</h3>
			<a href="javascript:" class="cmore">더보기</a>
		</div>
		<ul>
			<li><label> <input type="checkbox" class="chkbox"
					title="기타" id="brandSelect0" value="19_기타" CHECKBOXSEQ="0"
					CHECKBOXNAME="기타" /> 기타(28)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="동원" id="brandSelect1" value="01_동원" CHECKBOXSEQ="1"
					CHECKBOXNAME="동원" /> 동원(18)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="삼립" id="brandSelect2" value="136_삼립" CHECKBOXSEQ="2"
					CHECKBOXNAME="삼립" /> 삼립(11)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="가든포레스트" id="brandSelect3" value="9060_가든포레스트"
					CHECKBOXSEQ="3" CHECKBOXNAME="가든포레스트" /> 가든포레스트(11)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="청정원" id="brandSelect4" value="457_청정원" CHECKBOXSEQ="4"
					CHECKBOXNAME="청정원" /> 청정원(8)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="메가마트" id="brandSelect5" value="7378_메가마트" CHECKBOXSEQ="5"
					CHECKBOXNAME="메가마트" /> 메가마트(8)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="CJ제일제당" id="brandSelect6" value="222_CJ제일제당" CHECKBOXSEQ="6"
					CHECKBOXNAME="CJ제일제당" /> CJ제일제당(7)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="하림" id="brandSelect7" value="278_하림" CHECKBOXSEQ="7"
					CHECKBOXNAME="하림" /> 하림(5)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="사조" id="brandSelect8" value="7220_사조" CHECKBOXSEQ="8"
					CHECKBOXNAME="사조" /> 사조(5)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="풀무원" id="brandSelect9" value="40_풀무원" CHECKBOXSEQ="9"
					CHECKBOXNAME="풀무원" /> 풀무원(4)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="쟌슨빌" id="brandSelect10" value="6880_쟌슨빌" CHECKBOXSEQ="10"
					CHECKBOXNAME="쟌슨빌" /> 쟌슨빌(4)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="진주햄" id="brandSelect11" value="255_진주햄" CHECKBOXSEQ="11"
					CHECKBOXNAME="진주햄" /> 진주햄(3)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="기타" id="brandSelect12" value="6372_기타" CHECKBOXSEQ="12"
					CHECKBOXNAME="기타" /> 기타(3)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="대림선" id="brandSelect13" value="1039_대림선" CHECKBOXSEQ="13"
					CHECKBOXNAME="대림선" /> 대림선(2)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="크라제" id="brandSelect14" value="1201_크라제" CHECKBOXSEQ="14"
					CHECKBOXNAME="크라제" /> 크라제(2)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="오뚜기" id="brandSelect15" value="63_오뚜기" CHECKBOXSEQ="15"
					CHECKBOXNAME="오뚜기" /> 오뚜기(2)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="롯데푸드" id="brandSelect16" value="7352_롯데푸드" CHECKBOXSEQ="16"
					CHECKBOXNAME="롯데푸드" /> 롯데푸드(2)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="하인즈" id="brandSelect17" value="235_하인즈" CHECKBOXSEQ="17"
					CHECKBOXNAME="하인즈" /> 하인즈(1)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="와인앤쿡" id="brandSelect18" value="8517_와인앤쿡" CHECKBOXSEQ="18"
					CHECKBOXNAME="와인앤쿡" /> 와인앤쿡(1)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="제우스" id="brandSelect19" value="9422_제우스" CHECKBOXSEQ="19"
					CHECKBOXNAME="제우스" /> 제우스(1)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="뉴트리" id="brandSelect20" value="9557_뉴트리" CHECKBOXSEQ="20"
					CHECKBOXNAME="뉴트리" /> 뉴트리(1)
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="올반키친" id="brandSelect21" value="9664_올반키친" CHECKBOXSEQ="21"
					CHECKBOXNAME="올반키친" /> 올반키친(1)
			</label></li>
		</ul>
	</div>
	<div class="search_more_list">
		<div class="title">
			<h3>구성/혜택</h3>
		</div>
		<ul class="addchk">
			<li><label> <input type="checkbox" class="chkbox"
					title="단일상품 선택" id="comCdSelect0" value="01" /> 단일상품
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="세트상품 선택" id="comCdSelect1" value="02" /> 세트상품
			</label></li>
			<li><label> <input type="checkbox" class="chkbox"
					title="무료배송 선택" id="PB_DELI_SURE_YN" value="N" /> 무료배송
			</label></li>
		</ul>
		<div class="price_range">
			<strong>가격대</strong> <input type="text" class="input_style"
				title="최저가격" value="" id="sPriceSelect">&nbsp;원&nbsp;~&nbsp;&nbsp;
			<input type="text" class="input_style" title="최고가격" value=""
				id="ePriceSelect">&nbsp;원 <a
				href="javascript:changeFilter();" class="price_range_schBtn">가격대
				검색</a>
		</div>
	</div>
	<div id="pageMovePosition"></div>
	<div class="search_more_control">
		<div class="title">
			<h3>전체해제</h3>
			<a href="javascript:deleteOptionAreaAll();" class="all_clear">전체해제
				버튼</a>
		</div>
		<ul class="checked_item">
			<div id="searchOptionArea"></div>
		</ul>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {
		/* 조건검색 펼치기 */
		$(".search_more_list").each(function() {
			var this_idx = $(this);
			$(this).find(".cmore").click(function() {
				if ($(this).hasClass("open")) {
					$(this).removeClass("open");
					$(this_idx).find("ul").css("height", "35px");
				} else {
					$(this).addClass("open");
					$(this_idx).find("ul").css("height", "auto");
				}
			});
		});
	});
</script>












<div class="searchMore-hyelin">
	<div>
		<ul class="listStyleNone-hyelin paddingLeft10-hyelin category-hyelin">
			<li>
				<span class="listTitle-hyelin">브랜드</span>
			</li>
			<li>
				<input type="checkbox" name="CU" id="CU" />
				<label for="CU">CU</label>
			</li>
			<li>
				<input type="checkbox" name="GS25" id="GS25" />
				<label for="GS25">GS25</label>
			</li>
			<li>
				<input type="checkbox" name="7ELEVEN" id="7ELEVEN" />
				<label for="7ELEVEN">7ELEVEN</label>
			</li>
			<li>
				<input type="checkbox" name="MINISTOP" id="MINISTOP" />
				<label for="MINISTOP">MINISTOP</label>
			</li>
			<li>
				<input type="checkbox" name="EMART24" id="EMART24" />
				<label for="EMART24">EMART24</label>
			</li>
		</ul>
	</div>
	<hr />
	
	<div>
		<div class="title-hyelin">
			<span class="listTitle-hyelin">카테고리</span>
		</div>
		<div>
		<ul class="listStyleNone-hyelin paddingLeft10-hyelin category-hyelin">
			<li>
				<input type="checkbox" name="간편식사" id="간편식사" />
				<label for="간편식사">간편식사</label>
			</li>
			<li>
				<input type="checkbox" name="식품" id="식품" />
				<label for="식품">식품</label>
			</li>
			<li>
				<input type="checkbox" name="과자류" id="과자류" />
				<label for="과자류">과자류</label>
			</li>
			<li>
				<input type="checkbox" name="아이스크림" id="아이스크림" />
				<label for="아이스크림">아이스크림</label>
			</li>
			<li>
				<input type="checkbox" name="즉석식품" id="즉석식품" />
				<label for="즉석식품">즉석식품</label>
			</li>
			<li>
				<input type="checkbox" name="음료" id="음료" />
				<label for="음료">음료</label>
			</li>
		</ul>
		</div>
	</div>
	<hr />
</div>

<!-- <select id="brand" name="brand" multiple="multiple" placeholder="편의점명" onchange="console.log($(this).children(':selected').length)" class="search-box-sel-all">
    <option value="CU">CU</option>
    <option value="GS25">GS25</option>
    <option value="7ELEVEN">7ELEVEN</option>
    <option value="MINISTOP">MINISTOP</option>
    <option value="EMART24">EMART24</option>
</select>

<select id="category1" name="category1" multiple="multiple" placeholder="대카테고리" onchange="console.log($(this).children(':selected').length)" class="search-box-sel-all">
    <option value="1">간편식사</option>
    <option value="2">식품</option>
    <option value="3">과자류</option>
    <option value="4">아이스크림</option>
    <option value="5">즉석식품</option>
    <option value="6">음료</option>
</select>

<select id="category2" name="category2" multiple="multiple" placeholder="중카테고리" onchange="console.log($(this).children(':selected').length)" class="search-box-sel-all">
    <option value="7" class="category1">김밥</option>
    <option value="8" class="category1">도시락</option>
    <option value="9" class="category1">샌드위치</option>
    <option value="10" class="category1">햄버거</option>
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

<select id="category3" name="category3" multiple="multiple" placeholder="소카테고리" onchange="console.log($(this).children(':selected').length)" class="search-box-sel-all">
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
 -->






























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
<div class="searchbtn">
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


<%-- <div class="main-li-container">
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>