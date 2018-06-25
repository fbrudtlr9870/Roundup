<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.css">
    <script src="bootstrap-3.3.7-dist/js/jquery-3.3.1.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <title>로그인</title>
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
<body>
    
    <div id="container">
       <form action="${pageContext.request.contextPath }/member/memberLogin.do" method="post">
      		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <h1>편의점마스터</h1>
            <br>
            <input class="form-control" type="text" placeholder="아이디" name="member_id">
            <br>
            <input class="form-control" type="password" placeholder="비밀번호" name="member_password">
            <br>
            <input type="submit" value="로그인">
            <br><br>
        </form>
        <hr>
        <div id="btn-container">
                <button type="button" class="btn btn-success">회원가입</button>
                <button type="button" class="btn btn-info">아이디찾기</button>
                <button type="button" class="btn btn-info">비밀번호찾기</button>
        </div>
    </div>     
</body>
</html>