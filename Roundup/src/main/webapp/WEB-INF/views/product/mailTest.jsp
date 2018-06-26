<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="메일테스트" name="pageTitle"/>
</jsp:include>
<script type="text/javascript">
    $(function () {
        var chk = -1;
        
        
        $("#auth_btn").click(function () {
        	console.log("인증버튼 클릭");
            var email = $("#email").val();
            $.ajax({
                url : "${pageContext.request.contextPath}/common/util/sendmail.do",
                data : "email="+email,
                dataType:"json",
                success : function (data) {
                	console.log(data);
                    /* authNum = data;
                    alert("인증번호 전송완료.");
                    
                    chk = checkNum(authNum);
                    
                    if( chk > 0){
                        alert("인증완료");
                        chk = 1;
                        $("#lab1").html("<label>인증완료</label>");
                    }else{
                        alert("인증실패");
                        $("#lab1").html("<label>인증실패</label>");
                    } */
                    
                },error:function(jqxhr,textStatus,errorThrown){
					console.log("ajax실패",jqxhr,textStatus,errorThrown);
				}
                
            });
            
        });// 이메일 인증 버튼 end
        
        // 회원가입
        $("#signUp_btn").click(function () {
            if( chk > 0  ){
                return true;
            }else{
                alert("이메일 인증을 완료하여 주세요.");
                return false;
            }
            
        });
        
    });
</script>
<script type="text/javascript">
    function checkNum(authNum) {
        var chk = 0;
        var user_authNum = prompt("인증번호를 입력하세요.");
        // 인증번호 비교
        if (authNum == user_authNum) {
            chk = 1;
            $("#user_authNum").val(user_authNum);
        } else {
            chk = -1;
        }
 
        return chk;
    };
 
</script>

<form action="signOk.do" method="post">
        아이디 : <input type="text" name="id" id="id"><br>
        비밀번호 : <input type="password" name="pwd1" id="pwd1"><br>
        비밀번호 확인 : <input type="password" name="pwd2" id="pwd2"><br>
        이메일 주소 :  <input type="text" name="email" id="email">
        <button type="button" id="auth_btn">인증하기</button>
        <br>
        인증번호 : <input type="text" id="user_authNum" name="user_authNum" readonly="readonly"><div id="lab1"></div><br>
        
        <input type="submit" id="signUp_btn" value="가입하기">
        <input type="reset" value="지우기"><br>
    </form>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>