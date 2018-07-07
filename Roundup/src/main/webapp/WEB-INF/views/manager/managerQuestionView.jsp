<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="편의점마스터" name="pageTitle"/>
</jsp:include>

<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<style>
div#questionView-container{
	width:640px;
	min-height:500px;
	margin:0 auto;
	border:1px solid lightgray;
}
div.questionView-title{
	width:590px;
	height:30px;
}
div.questionView-title.title{
	margin:20px 20px 0px 20px;
	border-bottom: 1px dotted lightgray;
}
div.questionView-title.title span, div.questionView-title.member span{
	font-size: 15sp;
	font-weight: bold;
}
div.questionView-title.member{
	margin:10px 10px 10px 20px;
}
div.questionView-comment{
	width:638px;
	background: rgb(229, 228, 221);
}
div.questionView-comment.read{
	width:600px;
	margin:0 auto;
}
div.mypage{
   width:980px;
   margin:0 auto;
   
   min-height:780px;
}
.list-group-item {
    position: relative;
    display: block;
    padding: .75rem 1.25rem;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid rgba(0,0,0,.125);
    width: 150px;
}
.mypage-detail{
   width:780px;
}
.sidenav {
    background-color: #fff; 
    height: 100%;
}
.number-hyelin {
   display:inline;
}

.table{
   width:780px;
   font-size:13.5px;
}

.col-sm-3 {
    max-width: 200px;
}

</style>
<script>
function fn_insertQuestion(){
	location.href="${pageContext.request.contextPath}/manager/insertQuestion.do?member_id="+'${question["member_id"] }'+"&question_no="+'${question["question_no"] }';
}

</script>
<div class="mypage container">
	<div class="row">
	  <div class="col-sm-3 sidenav">
	    <div class="list-group" id="list-tab" role="tablist">
	      <a class="list-group-item list-group-item-action active" id="list-home-list"  href="${pageContext.request.contextPath }/manager/managerPage.do" role="tab" aria-controls="home">Home</a>
	      <a class="list-group-item list-group-item-action" id="list-profile-list"  href="${pageContext.request.contextPath }/manager/memberManagement.do" role="tab" aria-controls="profile">회원관리</a>
	      <a class="list-group-item list-group-item-action" id="list-deletedMember-list"  href="${pageContext.request.contextPath }/manager/deletedMember.do" role="tab" aria-controls="deletedMember">탈퇴회원목록</a>
	      <a class="list-group-item list-group-item-action" id="list-basket-list"  href="${pageContext.request.contextPath }/product/productEnroll.do" role="tab" aria-controls="baskeet">상품등록</a>
	      <a class="list-group-item list-group-item-action" id="list-allProduct-list"  href="${pageContext.request.contextPath }/product/allProductList.do" role="tab" aria-controls="allproduct">전체상품</a>
	      <a class="list-group-item list-group-item-action" id="list-deletedProduct-list"  href="#" role="tab" aria-controls="settings">삭제된상품</a>
	      <a class="list-group-item list-group-item-action" id="list-allPurchaseComplete-list"  href="${pageContext.request.contextPath }/manager/managerPurchaseComplete.do" role="tab" aria-controls="allPurchase">전체구매내역</a>
	      <a class="list-group-item list-group-item-action" id="list-allPurchaseCancel-list"  href="#" role="tab" aria-controls="allCancel">전체취소내역</a>
	      <a class="list-group-item list-group-item-action" id="list-event-list"  href="#" role="tab" aria-controls="settings">이벤트등록</a>
	      <a class="list-group-item list-group-item-action" id="list-allEvent-list"  href="#" role="tab" aria-controls="settings">전체이벤트</a>
	      <a class="list-group-item list-group-item-action" id="list-question-list"  href="${pageContext.request.contextPath }/manager/managerQuestion.do" role="tab" aria-controls="question">1:1문의</a>
	    </div>
	  </div>
	  <div class="col-8">
	    <div class="tab-content" id="nav-tabContent">
	      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-question-list">
				<div id="questionView-container">
					<div class="questionView-title title">
						<div style="float:left;">
							<span>${question["question_title"]}</span>
							| 1:1문의
						</div>
						<div style="float:right;">
							${question["question_reg_date"] }
						</div>
					</div>
					
					<div class="questionView-title member">
						<span>${question["member_id"] }</span>
					</div>
					<br /><br />
					<div id="questionView-comment">
						${question["question_comment"]}
					</div>
				
					
				</div>
				<br />
				<input type="button" class="btn btn-light" value="답변하기" style="float:left;" onclick="fn_insertQuestion();"  />
			</div>
		</div>
	</div>
</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>