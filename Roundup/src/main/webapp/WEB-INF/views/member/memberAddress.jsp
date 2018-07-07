<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="" name="pageTitle"/>
</jsp:include>
<style>
.width980-hyelin {
	width: 980px;
	margin: 0 auto;
}
.verticalMiddle-hyelin {
	vertical-align: middle !important;
}
.verticalMiddle-hyelin img {
	margin-left: 20px;
}
</style>      
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<table class="table width980-hyelin">
	<tr>
		<th></th>
		<th>번호</th>
		<th>우편번호</th>
		<th>주소</th>
		<th>즐겨찾기</th>
	</tr>
	<c:if test="${not empty list }">
		<c:forEach var="i" items="${list }" varStatus="vs">
			<tr>
				<td class="tbl-td"><input type="radio" name="addrCheck" id="addr${i.address_no }" /></td>
				<td class="tbl-td">${i.address_level}</td>
				<td class="tbl-td">${i.zip_code}</td>
				<td class="tbl-td">
					<c:set var="address" value="${fn:split(i.address,'#')}" />				
					<c:forEach var="addr" items="${address}" varStatus="g">
					     <c:if test="${g.count % 2 == 1}">
					     	${addr} <br />
					     </c:if>
					</c:forEach> 
				</td>
				<td class="verticalMiddle-hyelin">
					<c:if test="${i.address_level == 1}">
						<img src="${pageContext.request.contextPath}/resources/img/checked.png" alt="" />
					</c:if>
				</td>
			</tr>
	 	</c:forEach>
	</c:if>
	<tr>
		<td colspan="5">
			<button type="button" class="btn" id="insertAddr">배송지 추가</button>
			<button type="button" class="btn" id="deleteAddr">삭제</button>
			<button type="button" class="btn" id="updateAddr">수정</button>
			<button type="button" class="btn" id="selectAddr">즐겨찾기 설정</button>
		</td>
	</tr>
</table>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>