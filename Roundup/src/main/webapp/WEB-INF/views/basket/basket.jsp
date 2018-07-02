<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="장바구니" name="pageTitle"/>
</jsp:include>

<div class="step-buy">
	<br> <img src="${pageContext.request.contextPath }/resources/img/step-img.png" width="980px" height="100px">
	<br>
</div>
<div class="tbl-container">
	<table class="table">
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
							<img src="${pageContext.request.contextPath }/resources/img/${i['renamed_filename']}" alt="" width="100px" height="100px">
							<span>[${i["brand_name"]}] &nbsp; ${i["product_name"]}</span>
						</div>
					</td>
					<td class="tbl-td">
						<fmt:formatNumber value="${i['price']}" type="currency" currencySymbol=""/>원
					</td>
					<td class="tbl-td">
						<input type="number" class="form-control inline-hyelin" style="width: 70px; margin: 0 auto;" name="product_amount" value="${i['product_amount']}" min="1">
						<button type="button" class="btn btn-light updateBasket">수정</button>
					</td>
					<td class="tbl-td">
						<input type="hidden" value="${i['product_amount']*i['price']}" name="price" id="price"/>
						<fmt:formatNumber value="${i['product_amount']*i['price']}" type="currency" currencySymbol=""/>원
					</td>
					<td class="tbl-td">
						<input type="hidden" value="${i['basket_no'] }" name="basket_no"/>
						<button type="button" class="btn btn-success" onclick="window.location.href='${pageContext.request.contextPath }/purchase/purchase.do?basketNo=${i['basket_no'] }'">구매</button> &nbsp;
						<button type="button" class="btn btn-danger deleteBasket">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty basketList }">
	          <tr>
	             <td colspan="6">장바구니에 담긴 상품이 없습니다.</td>
	          </tr>
		</c:if>
	</table>
	<hr>
	<button type="button" class="btn btn-danger" id="deleteChkItem" style="float: left;">선택상품 삭제</button>
	<br>
	<br>
	<br>
	<table class="table">
		<tr>
			<th>총 배송비</th>
			<th>총 결제금액</th>
		</tr>
		<tr>
			<td class="tbl-td"><fmt:formatNumber value="2000" type="currency" currencySymbol=""/>원</td>
			<td class="tbl-td">
				<fmt:formatNumber value="0" type="currency" currencySymbol=""/>원 
				<!-- <input type="text" name="" id="totalPrice" value="" />원 -->
			</td>
		</tr>
	</table>
	<hr>
	<button type="button" class="btn btn-primary" id="purchaseAll" style="float: right; margin: 10px;" onclick="return purchaseAll();">전체상품 주문</button>
	<button type="button" class="btn btn-success" id="purchaseChk" style="float: right; margin: 10px;" onclick="return purchaseChk();">선택상품 주문</button>
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
	
	for(var i=0; i<chkboxes.length; i++) {
		basketNo += $(chkboxes[i]).parent().parent().find("[name=basket_no]").val();     
		basketNo += "/";
    }
	
	location.href="${pageContext.request.contextPath}/purchase/purchase.do?basketNo="+basketNo;
}

function purchaseChk() {
	var basketNo = "";
	$("[name=basketList]:checked").filter(function() {
		basketNo += $(this).parent().parent().find("[name=basket_no]").val();
		basketNo += "/";
    });
	
	if(basketNo !== "") {
		location.href="${pageContext.request.contextPath}/purchase/purchase.do?basketNo="+basketNo;
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
					location.href="${pageContext.request.contextPath}/basket/selectBasketList.do?memberId=${memberLoggedIn.member_id}";
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
				location.href="${pageContext.request.contextPath}/basket/selectBasketList.do?memberId=${memberLoggedIn.member_id}";
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
						location.href="${pageContext.request.contextPath}/basket/selectBasketList.do?memberId=${memberLoggedIn.member_id}";
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

});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>