<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 작성" name="pageTitle"/>
</jsp:include>
<!-- 유저롤을 가진 유저  -->
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
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
        if(text.length>300){
            alert("길이를 초과하였습니다.");
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
	position:relative;
	top:50px;
}
</style>

<div id="insertBoard-container">

<form action="insertEndBoard.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
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
<div style="text-align: center;">
	<button type="button" class="btn btn-success" id="insertBoard">제출</button>
	<button type="button" class="btn btn-danger" onclick="fn_cancelBoard()">취소</button>
</div>
</form>
</div>
<br /><br />
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>