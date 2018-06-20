<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>
<style>
div#update-container{
	width:400px;
	margin:0 auto;
	text-align:center;
}
</style>

<nav class="nav-list">
     <div class="nav-list-wrapper">
           <ul class="nav nav-tabs nav-justified">
               <li role="presentation" class="active"><a href="#">회원정보수정</a></li>
               <li role="presentation"><a href="#">장바구니</a></li>
               <li role="presentation"><a href="${pageContext.request.contextPath }/purchase/purchaseComplete.jsp">구매내역</a></li>
               <li role="presentation"><a href="./freeboard/freeBoardList.do">공지사항</a></li>
               <li role="presentation"><a href="#">1:1문의</a></li>
           </ul>
     </div>
 </nav>
<div class="mypage-container-master">
	<div id="update-container">
	<br/>
	<h4>회원정보</h4>
	</br>
		<form action="${pageContext.request.contextPath}/member/memberUpdate.do " method="post" name="memberUpdateFrm">
			<div id="userId-container">
				<input type="text" name="member_id" id=member_id_ class="input form-control" value="${member.member_id }" required/>
			</div>
			<br/>
			<input type="text" name="member_name" id="member_name_" class="input form-control" value="${member.member_name }" required/>
			<br/>
			<input type="email" name="member_email" id="member_email_" value="${member.member_email }" class="form-control" required/>
			<br/>
			<input type="text" name="member_phone" id="member_phone_" value="${member.member_phone }" class="input form-control"  required/>
			<br/>
			<input type="text" name="member_birthday" id="member_birthday_" value="${member.member_birthday }" class="input form-control" />
			<br/>
			<select name="member_gender" id="member_gender_" class="input form-control" required>
				<option value=""disabled selected>성별</option>
				<option value="M" ${member.member_gender=='M'?'selected':'' }>남자</option>
				<option value="F" ${member.member_gender=='F'?'selected':'' }>여자</option>
			</select>
			<br/>
		<input type="submit" value="수정" class="btn btn-outline-success" /> 
		<input type="reset" value="취소" class="btn btn-outline-success">
		<input type="reset" value="삭제" class="btn btn-outline-success">
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>