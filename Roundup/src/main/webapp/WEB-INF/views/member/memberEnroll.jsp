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
div#update-container input.form-control{display:inline-block;}
div#update-container select.form-control{display:inline-block;}

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
function validate(str){
	var member_id = $("#member_id_").val().trim();
	var member_password = $("#member_password_").val().trim();
	var member_name = $("#member_name_").val().trim();
	var member_birthday = $("#member_birthday_").val().trim();
	var member_phone = $("#member_phone_").val().trim();
	var regExp = /^[가-힣]{2,8}$/;
	var regExp0 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;


	
	if(member_id.length<4 || member_id.length>=12){
		alert("아이디는 최소4자리이상 12자 미만여야 합니다");
		/* member_id.focus(); */
		$("#member_id_").focus();
		return false;
	}
	
	if(member_password.length<4 || member_password.length>8){
		alert("비밀번호는 최소4자리이상이거나 8자리 미만여야 합니다.");
		/* member_password.focus(); */
		$("#member_password_").focus();
		return false;		
	}
	
	/* if(member_name.val().trim().length>8){
		alert("이름을 8글자 미만로 적어주세요");
		return false;
	} */
	
	if(!regExp.test(member_name)){
		alert("이름을 2글자 이상 8글자 이하로 적으세요.");
		$("#member_name_").val("");
		$("#member_name_").focus();
		return false;
	}
	
	if(!regExp0.test(member_phone)){
		alert("번호를 형식에 맞게 적으세요");
		$("#member_phone_").val("");
		$("#member_phone_").focus();
		return false;
	}


	return true;
}


</script>
	<div id="update-container">
	<h2>회원가입</h2>
		<form action="memberEnrollEnd.do" method="post" onsubmit="return validate();">
			<div id="userId-container">
				 아이디 : <input type="text" name="member_id" id=member_id_ class="input form-control" required style="width:330px;"/>
				<span class="guide ok">이 아이디는 사용가능합니다.</span>
				<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
				<input type="hidden" id="idDuplicateCheck" value="0" />
			</div>
			<br/>
			 비밀번호 : <input type="password" name="member_password" id="member_password_" class="input form-control" required style="width:319px;"/>
			<br/><br/>
			비번확인 : <input type="password" id="password_chk" class="form-control" required style="width:319px;"/>
			<br/><br>
			이름 : <input type="text" name="member_name" id="member_name_" class="form-control" required autocomplete="off" style="width:347px;"/>
			<br/><br>
			이메일 : <input type="email" name="member_email" id="member_email_" class="form-control" autocomplete="off" style="width:330px;"/>
			<br/><br>
			전화번호 : <input type="text" name="member_phone" id="member_phone_" class="form-control" required autocomplete="off" style="width:319px;"/>
			<br/><br>
			<!-- 생일 : <input type="date" name="member_birthday" id="member_birthday_" class="input" style="width:300px;"/> -->
			생일 : <input type="date" name="member_birthday" id="member_birthday_" class="form-control" style="width:350px;" />
			<br/><br/>
			성별 : <select name="member_gender" id="member_gender_" class="form-control" required style="width:343px;">
				<option value=""disabled selected>성별</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select>
			<br/><br>
		<input type="submit" value="가입" class="btn btn-outline-success"/>
		<input type="reset" value="취소" class="btn btn-outline-success"/> 
		<br><br> 
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>