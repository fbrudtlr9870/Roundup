<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="구매완료" name="pageTitle"/>
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
               <li role="presentation"><a href="./purchase/purchaseComplete.do">구매내역</a></li>
               <li role="presentation"><a href="./freeboard/freeBoardList.do">공지사항</a></li>
               <li role="presentation"><a href="#">1:1문의</a></li>
           </ul>
     </div>
 </nav>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>