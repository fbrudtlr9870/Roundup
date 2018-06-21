<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="purchase" name="pageTitle" />
</jsp:include>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript"
   src="http://t1.daumcdn.net/cssjs/postcode/1522037570977/180326.js"></script>
<style>
.inline-hyelin {
	display: inline !important;
}
table#info2-hyelin {
	width: 80%;
}
table#info2-hyelin td {
	padding: 5px;
}
.red-hyelin {
	color: red;
	font-weight: bold;
}
.h3-hyelin {
	font-size: 25px;
	/* font-weight: bold;  */
}
.right-hyelin {
	float: right;
}
</style>
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
						<img src="${pageContext.request.contextPath }/resources/img/${purchase['renamed_filename']}" alt="" width="100px" height="100px">
						<span>[${purchase["brand_name"]}] &nbsp; ${purchase["product_name"]}</span>
					</div>
				</td>
				<td class="tbl-td">
					<fmt:formatNumber value="${purchase['price']}" type="currency" currencySymbol=""/>원
				</td>
				<td class="tbl-td">${purchase['product_amount'] }</td>
				<td class="tbl-td">
					<fmt:formatNumber value="${purchase['product_amount']*purchase['price']}" type="currency" currencySymbol=""/>원
				</td>
			</tr>
		</c:if>
		
		<c:if test="${not empty purchaseList }">
			<c:forEach var="i" items="${purchaseList }" varStatus="vs">
				<tr>
				<td class="tbl-td">
					<div id="tbl-img-row">
						<img src="${pageContext.request.contextPath }/resources/img/${i['renamed_filename']}" alt="" width="100px" height="100px">
						<span>[${i["brand_name"]}] &nbsp; ${i["product_name"]}</span>
					</div>
				</td>
				<td class="tbl-td">
					<fmt:formatNumber value="${i['price']}" type="currency" currencySymbol=""/>원
				</td>
				<td class="tbl-td">${i['product_amount'] }</td>
				<td class="tbl-td">
					<fmt:formatNumber value="${i['product_amount']*i['price']}" type="currency" currencySymbol=""/>원
				</td>
			</tr>
			</c:forEach>
		</c:if>
	
	</table>
	<hr>
	
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
			<td class="tbl-td"><fmt:formatNumber value="0" type="currency" currencySymbol=""/>원</td>
		</tr>
	</table>
	<hr>
	<br>
	<br>
	<br>
	

	<span class="h3-hyelin">배송지 정보 </span> 
	<div class="inline-hyelin right-hyelin">
		<input class="btn btn-light" id="user_info" type="button" value="회원정보 동일"/> &nbsp; 
	    <input class="btn btn-light" id="addr_list" type="button" value="주소록" onclick="popup_addrList();"/> &nbsp; 
	    <input class="btn btn-light" id="new_info" type="button" value="신규입력"/> &nbsp;
    </div>  
	<br /><br />
	<table class="table">
		<tr>
			<th>받으시는 분</th>
			<td>
	        	<input type="text" class="form-control" name="userId" id="userId" title="받으시는분" style="width: 100px;" required>
           </td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td>
               <select name="phone_num1" id="phone_num1" title="휴대폰 앞자리" class="form-control inline-hyelin" style="width:80px;">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select> - 
               <input name="phone_num2" class="form-control inline-hyelin" id="phone_num2" type="text" title="중간자리" style="width: 80px;" maxlength="4"> -
               <input name="phone_num3" class="form-control inline-hyelin" id="phone_num3" type="text" title="뒷자리" style="width: 80px;" maxlength="4">
            </td>
		</tr>
		<tr>
           <th>배송 주소</th>
           <td>
              <input type="text" class="form-control inline-hyelin" id="sample4_postcode" placeholder="우편번호" style="width: 120px;" required> 
              <input type="button" class="btn btn-light" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" size="35px"><br>
              <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" required> 
              <input type="text" class="form-control" id="sample4_jibunAddress" placeholder="지번주소" required>
              <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" required/>
              <span id="guide" style="color: #999"></span>
           </td>
        </tr>
        <tr>
         <th class="info-container2">배송 메세지</th>
         <td>
            <input type="text" class="form-control" name="msg" list="msg" size="40px" placeholder="직접입력"> 
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

	<button type="button" class="btn btn-success"
		style="float: right; margin: 10px;" onclick="return payRequest();">구매하기</button>
</div>


<script>
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
function payRequest() {
    var IMP = window.IMP; // 생략가능
	IMP.init('imp34778853');
	IMP.request_pay({
	       pg : 'inicis', // 결제방식
	       pay_method : 'card',	// 결제 수단
	       merchant_uid : 'merchant_' + new Date().getTime(),
	       name : '주문명: 결제 테스트',	// order 테이블에 들어갈 주문명 혹은 주문 번호
	       amount : '100',	// 결제 금액
	       buyer_email : '',	// 구매자 email
	       buyer_name : $("#userId").val(),	// 구매자 이름
	       // buyer_tel :  $("#phone_num1").val()+'-'+$("#phone_num2").val()+'-'+$("#phone_num3").val()+'-',	// 구매자 전화번호
	       buyer_addr :  $("#sample4_roadAddress").val() + '#' + $("#sample4_jibunAddress").val() + '#' + $("#sample4_detailAddress").val(),	// 구매자 주소
	       buyer_postcode :  $("#sample4_postcode").val()	// 구매자 우편번호
	       
	   }, function(rsp) {
		   console.log(rsp);
		   if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "${pageContext.request.contextPath}/purchase/purchaseEnd.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid,
			    		amount : rsp.paid_amount,
			    		email : rsp.buyer_email,
			    		userId : rsp.buyer_name
			    		//productNo/memberId
		    		}
		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;

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
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>