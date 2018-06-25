<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>		
<!-- 부트스트랩관련 라이브러리 -->
<!-- navi관련 수정(18.06.15) -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />

<style>
div#addrList-hyelin {
	width: 800px;
	margin: 0 auto;
}
div#popup_btn-hyelin {
	margin: 0 auto;
	width: 120px;
}
</style>
<form action="">
	<div id="addrList-hyelin">
		<table id="tblAddrList-hyelin" class="table">
			<tr>
				<th>번호</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>선택</th>
			</tr>
			<c:if test="${not empty addrList }">
				<c:forEach var="i" items="${addrList }" varStatus="vs">
					<tr>
						<td class="tbl-td">
							<%-- <input type="hidden" id="address_no" value="${i['address_no']}"/> --%>
							${i['address_level'] }
						</td>
						<td class="tbl-td">
							<input type="hidden" id="zip_code" value="${i['zip_code']}"/>
							${i["zip_code"] }
						</td>
						<td class="tbl-td">
							<input type="hidden" id="fullAddress" value="${i['address']}"/>
							<c:forTokens items="${i['address'] }" var="f" delims="#">
								${f}<br>
							</c:forTokens>
						</td>
						<td class="tbl-td">
							<input type="radio" class="addr" name="addr" id="addr${vs.count }" value="${i['address_level'] }"/>
						</td>
					</tr>
				</c:forEach>
			</c:if> 
		</table>
		<hr />
		<div id="popup_btn-hyelin">
			<input class="btn btn-light" id="chooseAddr" type="button" value="선택" onclick="self.close();"/> &nbsp;
			<input class="btn btn-light" type="button" value="닫기" onclick="self.close();"/>
	    </div>	
    </div>
</form>

<script>
// 첫 번째 주소 체크 해놓기

// 선택한 주소 값 폼으로 전달
$(function() {
	$("#addr1").attr('checked', 'checked'); 
	
	$("#chooseAddr").on("click",function(){
        var fullAddress = $("[name=addr]:checked").parent().parent().find("#fullAddress").val();
        var zip_code = $("[name=addr]:checked").parent().parent().find("#zip_code").val();
        var address = fullAddress.split("#");
        
        // 우편번호
        opener.document.getElementById("sample4_postcode").value = zip_code; 
        
        // 주소
        opener.document.getElementById("sample4_roadAddress").value = address[0]; 
        opener.document.getElementById("sample4_jibunAddress").value = address[1];   
        opener.document.getElementById("sample4_detailAddress").value = address[2]; 
       
     });
});

</script>