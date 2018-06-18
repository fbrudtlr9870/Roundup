<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원등록" name="pageTitle"/>
</jsp:include>	
<style>
div#update-container{
	width:400px;
	margin:0 auto;
	text-align:center;
}
</style>
<script>
$(function(){
	$("#password_chk").blur(function(){
		var p1 = $("#password_").val();
		var p2 = $(this).val();
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다.");
			$("#password_").focus();			
		};
	});
};	
/*
 * 유효성검사함수
 */
function validate(){
	var userId = $("#userId_");
	if(userId.val().trim().length<4){
		alert("아이디는 최소4자리이상이어야합니다.");
		userId.focus();
		return false;
	}
	
	return true;
}

function validate(){
	var password = $("#password_");
	if(password.val().trim().length<6){
		alert("비밀번호는 최소 6자리 이상이어랴 합니다 ");
		password.focus();
		return false;
	}
	return true;
}

</script>
	<div id="update-container">
		<form action="memberEnrollEnd.do" method="post">
			<div id="userId-container">
				<input type="text" name="userId" id="userId_" class="input form-control" placeholder="아이디" required/>
			</div>
			<br/>
			<input type="password" name="password" id="password_" class="input form-control" placeholder="비밀번호" required/>
			<br/>
			<input type="password" id="password_chk" class="input form-control" placeholder="비밀번호 확인"  required/>
			<br/>
			<input type="text" name="userName" id="userName_" class="input form-control" placeholder="이름" required/>
			<br/>
			<input type="number" name="age" id="age_" class="input form-control" placeholder="나이" required/>
			<br />
			<input type="email" class="form-control" name="email" id="email" placeholder="이메일"/>
			<br/>
			<input type="text" name="phone" id="phone_" class="input form-control" placeholder="전화번호" required/>
			<br/>
			<input type="text" name="birthday" id="birthday_" class="input form-control" placeholder="생일"/>
			<br/>
			<select name="gender" id="gender" class="input form-control" required>
				<option value=""disabled selected>성별</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select>
			<br/>
		<input type="submit" value="가입" class="btn btn-outline-success" /> 
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>