<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>${param.pageTitle }</title>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>		
<!-- 부트스트랩관련 라이브러리 -->
<!-- navi관련 수정(18.06.15) -->
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
   <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script> -->
<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />
</head>	
<style>
div#container{
    width:300px;
    margin:0 auto;
    margin-top: 200px;
}
div#container h1{
    text-align: center;
}
div#btn-container{
    margin:0 auto;
    text-align: center;
}
</style>
<script>
$(function(){
	$("#login_btn").click(function(e){
		var member_id = $("[name=member_id]").val().trim();
		var password=$("[name=member_password]").val().trim();
		
		if(member_id==""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		
		if(password==""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		$.ajax({
			url:"checkConnectMember.do",
			data:{
				  member_id:member_id
			},
			dataType:"json",
			success:function(data){
				console.log(data);			
				if(data.isUsable==true){
					$("#loginFrm").submit();
				}else{
					var result=confirm("현재 접속중입니다.그래도 로그인 하시겠습니까?");
					if(result){
						$.ajax({
							url:"deleteConnectMember.do",
							data:{
								member_id:member_id
							},
							dataType:"json",
							success:function(data){
								if(data.isUsable==true){
									$("#loginFrm").submit();
								}
							},
							error:function(jqxhr,textStatus, errorThrown){
								console.log("ajax실패",jqxhr,textStatus, errorThrown);
							}
						});
					}else{
						alert("로그인취소");
					}
				}
			},
			error:function(jqxhr,textStatus, errorThrown){
				console.log("ajax실패",jqxhr,textStatus, errorThrown);
			}	
		});	
	});
});
</script>
<body>
    
    <div id="container">
       <form id="loginFrm" action="${pageContext.request.contextPath }/member/memberLogin" method="post">
      		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <h1>편의점마스터</h1>
            <br>
            <input class="form-control" type="text" placeholder="아이디" name="member_id">
            <br>
            <input class="form-control" type="password" placeholder="비밀번호" name="member_password">
            <br>
            <input type="button" value="로그인" id="login_btn">
            <br><br>
        </form>
        <hr>
        <c:if test="${param.error==true }">
        	<span style="color:red;">아이디 혹은 비밀번호가 틀립니다. <br />다시 확인 해 주세요</span>
        </c:if>
        <div id="btn-container">
                <button type="button" class="btn btn-success">회원가입</button>
                <button type="button" class="btn btn-info">아이디찾기</button>
                <button type="button" class="btn btn-info">비밀번호찾기</button>
        </div>
    </div>     
</body>

</html>