<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="장바구니" name="pageTitle"/>
</jsp:include>
<div class="step-buy">
	<br> <img src="img/step-img.png" width="980px" height="100px">
	<br>
</div>
<div class="tbl-container">
	<table class="table">
		<tr>
			<th><input type="checkbox" name=""></th>
			<th>상품정보</th>
			<th>판매가</th>
			<th>수량</th>
			<th>판매가X수량</th>
			<th>배송비</th>
			<th>선택</th>
		</tr>
		<tr>
			<td class="tbl-td"><input type="checkbox" name=""></td>
			<td class="tbl-td">
				<div id="tbl-img-row">
					<img src="img/test1.png" alt="" width="100px" height="100px">
					<span>[GS25] 핑크죠스바</span>
				</div>
			</td>
			<td class="tbl-td">5000</td>
			<td class="tbl-td"><input type="number" class="form-control"
				style="width: 70px; margin: 0 auto;" name="" value="1" min="1">
				<button type="button" class="btn btn-light" style="width: 70px;">수정</button>

			</td>
			<td class="tbl-td">15000</td>
			<td class="tbl-td">2000</td>
			<td class="tbl-td">
				<button type="button" class="btn btn-success">구매</button> &nbsp;
				<button type="button" class="btn btn-danger">취소</button>
			</td>
		</tr>
		<tr>
			<td class="tbl-td"><input type="checkbox" name=""></td>
			<td class="tbl-td">
				<div id="tbl-img-row">
					<img src="img/test1.png" alt="" width="100px" height="100px">
					<span>[GS25] 핑크죠스바</span>
				</div>
			</td>
			<td class="tbl-td">5000</td>
			<td class="tbl-td"><input type="number" class="form-control"
				style="width: 70px; margin: 0 auto;" name="" value="1" min="1">
				<button type="button" class="btn btn-light" style="width: 70px;">수정</button>

			</td>
			<td class="tbl-td">15000</td>
			<td class="tbl-td">2000</td>
			<td class="tbl-td">
				<button type="button" class="btn btn-success">구매</button> &nbsp;
				<button type="button" class="btn btn-danger">취소</button>
			</td>
		</tr>
		<tr>
			<td class="tbl-td"><input type="checkbox" name=""></td>
			<td class="tbl-td">
				<div id="tbl-img-row">
					<img src="img/test1.png" alt="" width="100px" height="100px">
					<span>[GS25] 핑크죠스바</span>
				</div>
			</td>
			<td class="tbl-td">5000</td>
			<td class="tbl-td"><input type="number" class="form-control"
				style="width: 70px; margin: 0 auto;" name="" value="1" min="1">
				<button type="button" class="btn btn-light" style="width: 70px;">수정</button>

			</td>
			<td class="tbl-td">15000</td>
			<td class="tbl-td">2000</td>
			<td class="tbl-td">
				<button type="button" class="btn btn-success">구매</button> &nbsp;
				<button type="button" class="btn btn-danger">취소</button>
			</td>
		</tr>
		<tr>
			<td class="tbl-td"><input type="checkbox" name=""></td>
			<td class="tbl-td">
				<div id="tbl-img-row">
					<img src="img/test1.png" alt="" width="100px" height="100px">
					<span>[GS25] 핑크죠스바</span>
				</div>
			</td>
			<td class="tbl-td">5000</td>
			<td class="tbl-td"><input type="number" class="form-control"
				style="width: 70px; margin: 0 auto;" name="" value="1" min="1">
				<button type="button" class="btn btn-light" style="width: 70px;">수정</button>

			</td>
			<td class="tbl-td">15000</td>
			<td class="tbl-td">2000</td>
			<td class="tbl-td">
				<button type="button" class="btn btn-success">구매</button> &nbsp;
				<button type="button" class="btn btn-danger">취소</button>
			</td>
		</tr>
	</table>
	<hr>
	<button type="button" class="btn btn-danger" style="float: left;">선택상품
		삭제</button>
	<br>
	<br>
	<br>
	<table class="table">
		<tr>
			<th>총 배송비</th>
			<th>총 결제금액</th>
		</tr>
		<tr>
			<td class="tbl-td">2000</td>
			<td class="tbl-td">30000</td>
		</tr>
	</table>
	<hr>
	<button type="button" class="btn btn-primary"
		style="float: right; margin: 10px;">전체상품주문</button>
	<button type="button" class="btn btn-success"
		style="float: right; margin: 10px;">선택상품주문</button>
</div>      
   
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>