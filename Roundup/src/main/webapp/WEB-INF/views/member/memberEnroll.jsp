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
div#update-container input#member_birthday_{display:inline-block;}

div#userId-container{position:relative; padding:0px;}
div#userId-container span.guide{
	display:none;
	font-size:12px;
	position:absolute;
	top:12px;
	right:10px;
}
div#userId-container span.ok{color:blue;}
div#userId-container span.error{color:orange;}
</style>
<script>
$(function(){
	$("#password_chk").blur(function(){
		var p1 = $("#member_password_").val();
		var p2 = $(this).val();
		if(p1!=p2){
			alert("패스워드가 일치하지 않습니다.");
			$("#member_password_").focus();			
		};
	});
	
	$("#member_id_").on("keyup",function(){
		var member_id = $(this).val().trim();
		if(member_id.length<4){
			$(".guide").hide();
			$("#idDuplicateCheck").val(0);
			return;
		}
		
		$.ajax({
			url : "checkIdDuplicate.do",
			data : {member_id:member_id},
			dataType:"json",
			success : function(data){
				console.log(data);//{isUsable: false}
				if(data.isUsable==true){
					$(".guide.error").hide();
					$(".guide.ok").show();
					$("#idDuplicateCheck").val(1);	
				}
				else{
					$(".guide.error").show();
					$(".guide.ok").hide();
					$("#idDuplicateCheck").val(0);						
				}
			},
			error:function(jqxhr,textStatus,errorThrown){
				console.log("ajax실패",jqxhr,textStatus,errorThrown);
				
			}
			
		});
		
	});
});	
/*
 * 유효성검사함수
 */
function validate(){
	var member_id = $("#member_id_");
	var member_password = $("#member_password_");
	var member_name = $("#member_name_");
	
	if(member_id.val().trim().length<4 || member_id.val().trim().length>12){
		alert("아이디는 최소4자리이상 12자 이하여야 합니다");
		member_id.focus();
		return false;
	}
	
	if(member_password.val().trim().length<4 || member_password.val().trim().length>8){
		alert("비밀번호는 최소4자리이상이거나 8자리 이하여야 합니다.");
		member_password.focus();
		return false;		
	}
	
	return true;
}


</script>
	<div id="update-container">
	<h2>회원가입</h2>
		<form action="memberEnrollEnd.do" method="post" onsubmit="return validate();">
			<div id="userId-container">
				<input type="text" name="member_id" id=member_id_ class="input form-control" placeholder="아이디" required/>
				<span class="guide ok">이 아이디는 사용가능합니다.</span>
				<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
				<input type="hidden" id="idDuplicateCheck" value="0" />
			</div>
			<br/>
			<input type="password" name="member_password" id="member_password_" class="form-control" placeholder="비밀번호" required/>
			<br/>
			<input type="password" id="password_chk" class="form-control" placeholder="비밀번호 확인"  required/>
			<br/>
			<input type="text" name="member_name" id="member_name_" class="form-control" placeholder="이름" required/>
			<br/>
			<input type="email" name="member_email" id="member_email_" class="form-control" placeholder="이메일"/>
			<br/>
			<input type="text" name="member_phone" id="member_phone_" class="form-control" placeholder="전화번호" required/>
			<br/>
			<!-- 생일 : <input type="date" name="member_birthday" id="member_birthday_" class="input" style="width:300px;"/> -->
			생일 : <input type="date" name="member_birthday" id="member_birthday_" class="form-control" style="width:360px;" />
			<br/><br/>
			<select name="member_gender" id="member_gender_" class="form-control" required>
				<option value=""disabled selected>성별</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select>
			<br/>
		<input type="submit" value="가입" class="btn btn-outline-success"/> 
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>