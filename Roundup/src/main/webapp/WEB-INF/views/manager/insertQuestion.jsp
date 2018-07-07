<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="편의점마스터" name="pageTitle"/>
</jsp:include>

<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
	<sec:authentication property="principal.username" var="admin_id"/>
	<sec:authentication property="principal.member_name" var="admin_name"/>
</sec:authorize>
<script src="${pageContext.request.contextPath }/resources/smarteditor/js/HuskyEZCreator.js" charset="UTF-8"></script>


<script>
//smarteditor 관련 설정
$(function(){
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef : oEditors,
        elPlaceHolder : "smarteditor",
        sSkinURI : "${pageContext.request.contextPath}/resources/smarteditor/SmartEditor2Skin.html",
        fCreator : "createSEditor2"
    });
    //전송버튼
    $("#insertBoard").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
        
        //간단한 유효성검사
        var title = $("#boardTitle").val().trim();
        var text = $("#smarteditor").val().trim();
        
        if(title==""){
        	alert("제목을 입력해주세요.");
        	return false;
        }
        if(text=="<p>&nbsp;</p>"){
        	alert("내용을 입력해주세요");
        	return false;
        }
        
        //폼 submit
        $("#insertBoardFrm").submit();
    });
    
});

function fn_cancelBoard(){
	if(confirm("현재 작성중인 게시글을 취소하시겠습니까?")==true){
		location.href="cancelBoard.do";
	}else{
		return false;
	}
	
}
</script>
<style>
div#insertBoard-container{
	width:640px;
	margin:0 auto;
	border:1px solid lightgray;
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
.chart-master{
   width:780px;
}

.center-hyelin {
   text-align: center;
   margin-top: 15px;
}
.border-bottom-hyelin {
   border-bottom: 1px solid rgba(0,0,0,.1);
}
.padding-hyelin{
   padding-bottom: 20px !important;
   padding-top: 20px !important;
}
.btnBuy {
   width: 100%;
}
</style>
</style>
<div class="mypage container">
	<div class="row">
	  <div class="col-sm-3 sidenav">
	    <div class="list-group" id="list-tab" role="tablist">
	     <a class="list-group-item list-group-item-action" id="list-home-list"  href="${pageContext.request.contextPath }/member/myPage.do?member_id=${member_id }" role="tab" aria-controls="home">Home</a>
	      <a class="list-group-item list-group-item-action" id="list-profile-list"  href="${pageContext.request.contextPath }/member/myPageMemberView.do?member_id=${member_id }" role="tab" aria-controls="profile">내정보</a>
	      <a class="list-group-item list-group-item-action" id="list-basket-list"  href="${pageContext.request.contextPath }/member/myPageBasket.do?member_id=${member_id }" role="tab" aria-controls="baskeet">장바구니</a>
	      <a class="list-group-item list-group-item-action" id="list-settings-list"  href="${pageContext.request.contextPath }/member/myPagePurchaseComplete.do?member_id=${member_id }" role="tab" aria-controls="settings">구매내역</a>
	      <a class="list-group-item list-group-item-action active" id="list-settings-list"  href="${pageContext.request.contextPath }/member/myPageQuestion.do?member_id=${member_id }" role="tab" aria-controls="Question">1:1문의</a>
	    </div>
	  </div>
	<div class="col-8">

		<div id="insertBoard-container">
		
		<form action="insertEndQuestion.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
		    <span class="input-group-text" id="basic-addon1">제목</span>
		  </div>
		  <input type="text" class="form-control" id="boardTitle" name="boardTitle" aria-label="Username" aria-describedby="basic-addon1">
		</div>
		<div style="width:605px; margin:0 auto;">
		<textarea name="smarteditor" id="smarteditor" cols="30" rows="10" style="width:600px;height:500px;"></textarea>
		</div>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="memberId" value="${member_id }" />
		<input type="hidden" name="adminId" value="${admin_id }" />
		<input type="hidden" name="question_no" value="${question_no}" />
		<div style="text-align: center;">
			<button type="button" class="btn btn-success" id="insertBoard">제출</button>
			<button type="button" class="btn btn-danger" onclick="fn_cancelBoard()">취소</button>
		</div>
		</form>
		</div>
	</div>
	</div>
</div>
<br /><br />

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>