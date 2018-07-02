<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="purchase" name="pageTitle" />
</jsp:include>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript"
   src="http://t1.daumcdn.net/cssjs/postcode/1522037570977/180326.js"></script>
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<style>
.membership-hyelin {
	width: 100px;
	text-align: right;
	display: inline;
}
#membershipText {
	display: inline;
	color: blue;
	font-weight: bold;
}
</style>

<div class="step-buy">
	<br> <img
		src="${pageContext.request.contextPath }/resources/img/step-img2.PNG"
		width="980px" height="100px"> <br>
</div>

<div class="tbl-container">
	<table class="table">
		<tr>
			<th>상품정보</th>
			<th>판매가</th>
			<th>수량</th>
			<th>판매가X수량</th>
		</tr>
		<c:if test="${not empty purchase }">
			<tr>
				<td class="tbl-td">
					<div id="tbl-img-row">
						<input type="hidden" name="basketNo" id="basketNo" value="${purchase['basket_no'] }"/>
						<input type="hidden" name="productNo" id="productNo" value="${purchase['product_no'] }"/>
						<img src="${pageContext.request.contextPath }/resources/upload/productFile/${purchase['renamed_filename']}" alt="" width="100px" height="100px">
						<span>[${purchase["brand_name"]}] &nbsp; ${purchase["product_name"]}</span>
					</div>
				</td>
				<td class="tbl-td">
					<fmt:formatNumber value="${purchase['price']}" type="currency" currencySymbol=""/>원
				</td>
				<td class="tbl-td">
					<input type="hidden" name="amount" id="amount" value="${purchase['product_amount'] }"/>
					${purchase['product_amount'] }
				</td>
				<td class="tbl-td">
					<input type="hidden" class="total" name="total" value="${purchase['product_amount']*purchase['price']}" id="total"/>
					<fmt:formatNumber value="${purchase['product_amount']*purchase['price']}" type="currency" currencySymbol=""/>원
				</td>
			</tr>
		</c:if>
		
		<c:if test="${not empty purchaseList }">
			<c:forEach var="i" items="${purchaseList }" varStatus="vs">
				<tr>
				<td class="tbl-td">
					<div id="tbl-img-row">
						<input type="hidden" name="basketNo" class="basketNo" value="${i['basket_no'] }"/>
						<input type="hidden" name="productNo" class="productNo" value="${i['product_no'] }"/>
						<img src="${pageContext.request.contextPath }/resources/upload/productFile/${i['renamed_filename']}" alt="" width="100px" height="100px">
						<span>[${i["brand_name"]}] &nbsp; ${i["product_name"]}</span>
					</div>
				</td>
				<td class="tbl-td">
					<fmt:formatNumber value="${i['price']}" type="currency" currencySymbol=""/>원
				</td>
				<td class="tbl-td">
					<input type="hidden" name="amount" class="amount" value="${i['product_amount'] }"/>
					${i['product_amount'] }
				</td>
				<td class="tbl-td">
					<input type="hidden" name="total" value="${i['product_amount']*i['price']}" class="total"/>
					<fmt:formatNumber value="${i['product_amount']*i['price']}" type="currency" currencySymbol=""/>원 
				</td>
			</tr>
			</c:forEach>

		</c:if>
		
		<c:if test="${not empty buyNow }">
			<tr>
				<td class="tbl-td">
					<div id="tbl-img-row">
						<input type="hidden" name="buyNow" id="buyNow"/>
						<input type="hidden" name="productNo" id="productNo" value="${buyNow['productNo'] }"/>
						<img src="${pageContext.request.contextPath }/resources/upload/productFile/${buyNow['renamedFileName']}" alt="" width="100px" height="100px">
						<span>[${buyNow["brandName"]}] &nbsp; ${buyNow["productName"]}</span>
					</div>
				</td>
				<td class="tbl-td">
					<fmt:formatNumber value="${buyNow['price']}" type="currency" currencySymbol=""/>원
				</td>
				<td class="tbl-td">
					<input type="hidden" name="amount" id="amount" value="${productAmount }"/>
					${productAmount}
				</td>
				<td class="tbl-td">
					<input type="hidden" class="total" name="total" value="${productAmount*buyNow['price']}" id="total"/>
					<fmt:formatNumber value="${productAmount*buyNow['price']}" type="currency" currencySymbol=""/>원
				</td>
			</tr>
		</c:if>
	
	</table>
	<hr>
	
	<br>
	<br>
	<br>
	<table class="table">
		<tr>
			<th>배송비</th>
			<th>적립금</th>
			<th>총 결제금액</th>
		</tr>
		<tr>
			<td class="tbl-td">
				<fmt:formatNumber value="2000" type="currency" currencySymbol=""/>원
			</td>
			<td>
				<input class="form-control membership-hyelin" type="number" name="membership" id="membership" placeholder="0" min="0" value="0"/>원 &nbsp;&nbsp;&nbsp;
				<button class="btn btn-secondary" id="allUse">전액사용</button><br />
				(사용가능금액 : <p id="membershipText"></p>원)
			</td>
			<td class="tbl-td">
				<input type="hidden" name="total" value="" id="total2"/>
				<c:if test="${not empty purchase }">
					<span id="totalPrice"></span>원
				</c:if>
				<c:if test="${not empty purchaseList }">
					<!-- <span id="listPrice"></span> -->
					<span id="totalPrice"></span>원
				</c:if>
				<c:if test="${not empty buyNow }">
					<span id="totalPrice"></span>원
				</c:if>
			</td>
		</tr>
	</table>
	<hr>
	<br>
	<br>
	<br>
	

	<form action="" id="addressInfo" >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<span class="h3-hyelin">배송지 정보 </span> 
		<div class="inline-hyelin right-hyelin">
			<input class="btn btn-light" id="user_info" type="button" value="회원정보 동일"/> &nbsp; 
		    <input class="btn btn-light" id="addr_list" type="button" value="주소록" /> &nbsp; 
		    <input class="btn btn-light" id="new_info" type="button" value="신규입력"/> &nbsp;
	    </div>  
		<br /><br />
		<table class="table">
			<tr>
				<th>받으시는 분</th>
				<td>
		        	<input type="text" class="form-control" name="userId" id="userId" value="${member_name}" title="받으시는분" style="width: 100px;" readonly>

	           </td>
			</tr>
			<tr>
				<th>휴대폰 번호</th>
				<td>
	               <input name="phone_num1" class="form-control inline-hyelin" id="phone_num1" type="text" placeholder="010" title="앞자리" style="width: 80px;" value="" readonly> -
	               <input name="phone_num2" class="form-control inline-hyelin" id="phone_num2" type="text" placeholder="1234" title="중간자리" style="width: 80px;" value="" readonly> -
	               <input name="phone_num3" class="form-control inline-hyelin" id="phone_num3" type="text" placeholder="5678" title="뒷자리" style="width: 80px;" value="" readonly>
	            </td>
			</tr>
			<tr>
	           <th>배송 주소</th>
	           <td>
	              <input type="text" class="form-control inline-hyelin addr" id="sample4_postcode" placeholder="우편번호" style="width: 120px;" required readonly> 
	              <input type="button" class="btn btn-light" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" size="35px"><br>
	              <input type="text" class="form-control addr" id="sample4_roadAddress" placeholder="도로명 주소" required readonly> 
	              <input type="text" class="form-control addr" id="sample4_jibunAddress" placeholder="지번 주소" required readonly>
	              <input type="text" class="form-control addr" id="sample4_detailAddress" placeholder="상세 주소" required/>
	              <span id="guide" style="color: #999"></span>
	           </td>
	        </tr>
	        <tr>
	         <th class="info-container2">배송 메세지</th>
	         <td>
	            <input type="text" class="form-control" name="msg" list="msg" size="40px" placeholder="직접 입력"> 
	            <!-- datalist id값과 위에 input의 list 속성 값이 일치해야 함. -->
	            <datalist id="msg">
	            <option value="부재시 경비실에 맡겨주세요.">
	            <option value="부재시 휴대폰으로 연락바랍니다.">
	            <option value="집 앞에 놓아주세요.">
	            <option value="택배함에 넣어주세요.">
	            </datalist>
	         </td>
	    	</tr>
		</table>
		<hr />
		<button type="button" class="btn btn-success" style="float: right; margin: 10px;" onclick="return payRequest();">구매하기</button>
	</form>
</div>


<script>

// 우편번호 검색 api
function sample4_execDaumPostcode() {
     new daum.Postcode(
      {
         oncomplete : function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
               extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
               extraRoadAddr += (extraRoadAddr !== '' ? ', '
                     + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
               extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if (fullRoadAddr !== '') {
               fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if (data.autoRoadAddress) {
               //예상되는 도로명 주소에 조합형 주소를 추가한다.
               var expRoadAddr = data.autoRoadAddress
                     + extraRoadAddr;
               document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
                     + expRoadAddr + ')';

            } else if (data.autoJibunAddress) {
               var expJibunAddr = data.autoJibunAddress;
               document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
                     + expJibunAddr + ')';

            } else {
               document.getElementById('guide').innerHTML = '';
            }
         }
      }).open();
  }
  
// 결제 api
function payRequest() {
	if(validate()) {
		// 수량 목록
		var amountId = document.getElementById('amount');
		var amountClass = document.getElementsByClassName('amount');
		var amountList = "";
		
		if(amountId == null) {
			for(var i=0; i<amountClass.length; i++){
		    	amountList +=  amountClass[i].value + "/";
			}			
		} else {
			amountList = amountId.value;
		}
		
		// 상품번호 목록
		var productId = document.getElementById('productNo');
		var productClass = document.getElementsByClassName('productNo');
		var productList = "";
		
		if(productId == null) {
			for(var i=0; i<productClass.length; i++){
				productList +=  productClass[i].value + "/";
			}			
		} else {
			productList = productId.value;
		}
		
		var basketId = document.getElementById('basketNo');
		var basketClass = document.getElementsByClassName('basketNo');
		var buyNow = document.getElementById('buyNow');
		var basketList = "";
		
		if(basketId == null && buyNow == null) {
			for(var i=0; i<basketClass.length; i++){
				basketList +=  basketClass[i].value + "/";
			}			
		} else if(basketId != null) {
			basketList = basketId.value;
			
		} else {
			basketList = "";
		}

		var IMP = window.IMP; // 생략가능
		IMP.init('imp34778853');
		IMP.request_pay({
			pg : 'inicis', // 결제방식
	        pay_method : 'card',   // 결제 수단
	        merchant_uid : 'merchant_' + new Date().getTime(),
	        name : '주문명: 결제 테스트',   // order 테이블에 들어갈 주문명 혹은 주문 번호
	        amount : '100',   // 결제 금액
	        buyer_email : '',   // 구매자 email
	        buyer_name : "${member_name}",   // 구매자 이름
	        buyer_addr :  $("#sample4_roadAddress").val() + '#' + $("#sample4_jibunAddress").val() + '#' + $("#sample4_detailAddress").val(),   // 구매자 주소
	        buyer_postcode :  $("#sample4_postcode").val()   // 구매자 우편번호
		   }, function(rsp) {
			   console.log(rsp);
			 
			   console.log(token+","+header);
			   if ( rsp.success ) {
			    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			    	jQuery.ajax({
			    		url: "${pageContext.request.contextPath}/purchase/purchaseEnd.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
			    		type: 'POST',
			    		data: {
				    		imp_uid : rsp.imp_uid,
				    		product_no : productList,
				    		member_id : "${member_id}",
				    		product_amount : amountList, 
				    		address : rsp.buyer_addr,
				    		zip_code : rsp.buyer_postcode,
				    		basketNo : basketList,
				    		membership : $("#membership").val(),
				    		totalPrice : parseInt($("#total2").val())-parseInt($("#membership").val())-2000
			    		},
			    		success:function(data) {
			    			console.log(data);
			    			if(data==="success") {
			    				if(confirm("결제가 완료되었습니다. 결제 내역 페이지로 이동하시겠습니까?")) {
			    					// 결제내역 페이지 보여주기
			    					location.href="${pageContext.request.contextPath}"; 
			    				} else {
			    					// 장바구니 페이지 보여주기
			    					location.href="${pageContext.request.contextPath }/basket/selectBasketList.do?memberId=${member_id}";
			    				} 
			    			}
			    		},
			    		error:function(jqxhr, textStatus, errorThrown) {
			                  console.log("ajax처리실패!");
			                  console.log(jqxhr);
			                  console.log(textStatus);
			                  console.log(errorThrown);
			            } 
			    	}).done(function(data) {
			    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			    		console.log(data);
			    		if ( everythings_fine ) {
			    			console.log(msg);
			    			var msg = '결제가 완료되었습니다.';

			    			alert(msg);
			    		} else {
			    			//[3] 아직 제대로 결제가 되지 않았습니다.
			    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			    		}
			    	});
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
	
			        alert(msg);
			    }
		});
	}
}

//배송지 정보 버튼 
$(function() {
	$("#phone_num1").val("${member.member_phone}".substring(0, 3));
	if("${member.member_phone}".length == 11) {
		$("#phone_num2").val("${member.member_phone}".substring(3, 7));
		$("#phone_num3").val("${member.member_phone}".substring(7));
	} else if("${member.member_phone}".length == 10) {
		$("#phone_num2").val("${member.member_phone}".substring(3, 6));
		$("#phone_num3").val("${member.member_phone}".substring(6));				
	}
	
	// 신규 입력 버튼
	$("#new_info").click(function() {
	 	var addr = document.getElementsByClassName('addr');
	 	for(var i=0; i<addr.length; i++){
	 		addr[i].value = "";
		}
	});
	
	// 회원정보 동일 버튼
	$("#user_info").click(function() {
	 	$.ajax({
			url:"${pageContext.request.contextPath}/purchase/selectMemberInfo.do",
			data: {
				memberId : "${member_id}"
    		},
			success:function(data) {			
				$("#sample4_postcode").val(data.zip_code);
				
				var address = data.address.split("#");
				$("#sample4_roadAddress").val(address[0]);
				$("#sample4_jibunAddress").val(address[1]);
				$("#sample4_detailAddress").val(address[2]);
				
			},
			error:function(jqxhr, textStatus, errorThrown) {
                  console.log("ajax처리실패!");
                  console.log(jqxhr);
                  console.log(textStatus);
                  console.log(errorThrown);
            }
		});
	});
	
	$("#addr_list").click(function() {
		var url = "${pageContext.request.contextPath}/purchase/selectAddrList.do?memberId=${member_id}";
		var title = "주소록";
		var status = "left=500px, top=200px, width=900px, height=300px";
		
	 	window.open(url, title, status);
	});
});


// 총 결제 금액
$(function() {
	// 총 결제금액 계산
	var totalClass = document.getElementsByClassName('total');

	var totalId = document.getElementById('total');

	var total = 0;
	
	if(totalId == null) {
		for(var i=0; i<totalClass.length; i++){
			total += parseInt(totalClass[i].value);
		}			

	} else {
		total = parseInt(totalId.value);
	}	
	$("#total2").val(total+2000);
	$("#totalPrice").text(addCommaSearch(parseInt(document.getElementById('total2').value)));
	
	// 멤버십 가져오기
	$.ajax({
		url:"${pageContext.request.contextPath}/member/selectMembership.do",
		data: {
			memberId : "${member_id}"
		},
		success:function(data) {			
			$("#membershipText").text(data.point);
		},
		error:function(jqxhr, textStatus, errorThrown) {
              console.log("ajax처리실패!");
              console.log(jqxhr);
              console.log(textStatus);
              console.log(errorThrown);
        }
	});
	
	// 적립금 전액 사용 버튼 
	$("#allUse").click(function() {
		// 적립금이 결제 금액보다 많은 경우 사용 적립 금액에 결제 금액 값 찍어주기
		if(parseInt($("#membershipText").text()) > parseInt($("#total2").val())) {
			$("#membership").val($("#total2").val());
		}
		else {
			// 적립금이 1000원 이상인 경우만 사용 가능
			if(parseInt($("#membershipText").text()) > 1000) {
				$("#membership").val(parseInt($("#membershipText").text()));		
			}
			else {
				alert("적립금은 1000원 이상부터 사용 가능합니다.")
			}
		}
		totalCalc($("#membership").val());

	});
	
 	// 총 결제 금액 표시
	$("#totalPrice").text(addCommaSearch(parseInt(document.getElementById('total2').value)));

 	// 적립금 직접 입력 시
	$("#membership").on("keyup", function() {
		var membership = document.getElementById("membership");
		var total = parseInt(document.getElementById("total2").value);
		
		if(parseInt($("#membershipText").text()) < parseInt(membership.value)) {
			alert("보유 금액 이상 사용하실 수 없습니다.");
			membership.value=0;
			$("#totalPrice").text(addCommaSearch(total));
		} else if(parseInt(membership.value) > $("#total2").val()) {
			alert("결제 금액을 초과하였습니다.");
			membership.value=$("#total2").val();
			$("#totalPrice").text(0);
		}
		
		$("#totalPrice").text(addCommaSearch($("#totalPrice").text()));
		if(this.value >= 1000)
			totalCalc(this.value);
		else
			totalCalc(0);
	});
});


function totalCalc(membership) {
	var total = parseInt(document.getElementById("total2").value);
	total -= membership;

	$("#totalPrice").text(addCommaSearch(total));
}

// 유효성 검사
function validate() {
	var postCode = $("#sample4_postcode").val();
	var roadAddress = $("#sample4_roadAddress").val();
	var jibunAddress = $("#sample4_jibunAddress").val();
	var detailAddress = $("#sample4_detailAddress").val();
	
	if(postCode != "" && roadAddress != "" && jibunAddress != "" && detailAddress != "")
		return true;
	else { 
		alert("배송지 정보를 입력해주세요");
		return false;
	}
}

function addCommaSearch(value) {
	str = String(value);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>