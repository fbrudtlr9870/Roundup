<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>
<style>
.imsosotired {
	font-size: 20px;
	color: #337ab7;
	font-weight: bold;
}


section#enroll-container-dh {
	text-align: center;
}

section#enroll-container-dh input {
	margin: 3px;
}

section#enroll-container-dh table {
	margin: 0 auto;
}

section#enroll-container-dh table th {
	padding: 5px 15px 5px 130px;
	text-align: right;
}

section#enroll-container-dh table td {
	padding: 5px 50px 5px 5px;
	text-align: left;
}

.updatebody-dh {
	background-color: rgb(82, 55, 36);
	color: rgb(255, 255, 255);
	/* font: 400 0.875rem/1.5 "Open Sans", sans-serif; */
	margin: 0;
	min-height: 100%;
}

table#enroll-dh {
	border-spacing: 20px;
	border: 1px solid lightgrey;
	height: 500px;
	width: 980px;
	border-radius: 0.35rem;
}

table input[id="userName-dh"]:focus, table input[id="userName-dh"]:hover,
	table input[id="age-dh"]:focus, table input[id="age-dh"]:hover, table input[id="email-dh"]:focus,
	table input[id="email-dh"]:hover, table input[id="phone-dh"]:focus,
	table input[id="phone-dh"]:hover, table input[id="tel"]:focus, table input[id="tel"]:hover
	{
	background-color: whitesmoke;
}

table input[id="userName-dh"], table input[id="age-dh"], table input[id="email-dh"],
	table input[id="phone-dh"], input[id="userId-dh"] {
	background-color: lightblue;
	color: black;
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
	border: 0;
	color: inherit;
	font: inherit;
	margin: 0;
	outline: 2;
	padding: 10px;
	/* -webkit-transition: background-color .3s; */
	transition: background-color .3s;
}

table input[id="userId-dh"]  {
	background-color: lightpink;
	color: black;
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
	border: 0;
	color: inherit;
	font: inherit;
	margin: 0;
	outline: 0;
	padding: 1;
	/* -webkit-transition: background-color .3s; */
	transition: background-color .3s;
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

<div class="rightcolumn">

	<section id="enroll-container-dh">
		<br>
		<h2 class="imsosotired">회원정보관리</h2>


		<br>
		<form action="${pageContext.request.contextPath}/member/memberUpdate.do " method="post" name="memberUpdateFrm" class="formform">
			<table id="enroll-dh">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="userId" id="userId-dh"
						value="${member.member_id }" readonly /></td>
				</tr>
				<%-- 	<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="password" id="password_" value="<%=m.getPassword()%>" required/>
				</td>
			</tr>
			<tr>
				<th>패스워드 확인</th>
				<td>				
					<input type="password" id="password_chk" required onblur="fn_pwdCheck();"/>
				</td>
			</tr> --%>

				<tr>
					<th>이름</th>
					<td><input type="text" name="userName" id="userName-dh"
						value="${member.member_name }" readonly></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="age" id="age-dh"
						value="${member.member_birthday }" readonly /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" name="email"
						placeholder="abcd@efgh.com" id="email-dh"
						value="${member.member_email }" readonly /></td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td><input type="tel" id="phone-dh" name="phone"
						placeholder="(-없이)01012345678" maxlength="11"
						value="${member.member_phone }" required /></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="radio" name="member_gender" id="member_gender_" value="M" ${member.member_gender=='M'?'checked':'' } /> 
						<label for="gender0">남</label> 
						<input type="radio" name="member_gender" id="member_gender_" value="F" ${member.member_gender=='F'?'checked':'' } /> 
						<label for="gender1">여</label></td>
				</tr>
				<tr>
					<th>회원등급</th>
					<td><input type="radio" name="member_grade" id="member_grade_1" value="A" ${member.member_grade=='A'?'checked':'' }  >
			<label for="member_grade_1">A</label> 
			<input type="radio" name="member_grade" id="member_grade_2" value="G" ${member.member_grade=='G'?'checked':'' }   >
			<label for="member_grade_2">G</label> </td>
				</tr>
			</table>
			<br /> 
			<input type="submit" value="수정" class="btn btn-outline-success" /> 
		<input type="reset" value="취소" class="btn btn-outline-success">
		
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</form>
	</section>
</div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>