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
</script>
	<div id="update-container">
		<form action="memberEnrollEnd.do" method="post">
			<div id="userId-container">
				<input type="text" name="userId" id="userId_" class="input" placeholder="아이디" required/>
			</div>
			<br/>
			<input type="password" name="password" id="password_" class="input" placeholder="비밀번호" required/>
			<br/><br/>
			<input type="password" id="password_chk" placeholder="비밀번호 확인" class="input" required/>
			<br/><br/>
			<input type="text" name="userName" id="userName_" class="input" placeholder="이름" required/>
			<br/><br/>
			<input type="number" name="age" id="age_" class="input" placeholder="나이" required/>
			<br/><br/>
			<input type="text" name="phone" id="phone_" class="input" placeholder="전화번호" required/>
			<br/><br/>
			<input type="text" name="address" id="address_" class="input" placeholder="주소"/>
			<br/><br/>
			<select name="gender" id="gender" class="input" required>
				<option value=""disabled selected>성별</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select>
			<br/><br/>
			<div class="form-check-inline form-check">
			취미 : &nbsp;
			<input type="checkbox" value="독서"
				   class="form-check-input" 
				   name="hobby" id="hobby1" />
			<label for="hobby1" 
				   class="form-check-label" >독서</label>
			&nbsp;
			<input type="checkbox" class="form-check-input" value="공부" name="hobby" id="hobby2" />
			<label for="hobby2" class="form-check-label">공부</label>
			&nbsp;
			<input type="checkbox" class="form-check-input" value="산책" name="hobby" id="hobby3" />
			<label for="hobby3" class="form-check-label">산책</label>
			&nbsp;
			<input type="checkbox" class="form-check-input" value="게임" name="hobby" id="hobby4" />
			<label for="hobby4" class="form-check-label">게임</label>
			&nbsp;
			<input type="checkbox" class="form-check-input" value="여행" name="hobby" id="hobby5" />
			<label for="hobby5" class="form-check-label">여행</label>
		</div>
		<br />
		<input type="submit" value="가입" class="btn btn-outline-success" /> 
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>