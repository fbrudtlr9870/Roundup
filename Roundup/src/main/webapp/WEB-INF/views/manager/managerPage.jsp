<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param value="Manager-Page" name="pageTitle"/>
</jsp:include>

<style>
* {
    box-sizing: border-box;
}

body {
    font-family: Arial;

    background: #f1f1f1;
}


.rightcolumn {   
    float: left;
    width: 100%;
}


/*image */
.img {
    background-color: lightblue;
    width: 100%;
    padding: 20px;
}

/* Add a card effect for articles */
.card {
    background-color: white;
    padding: 20px;
    margin-top: 20px;
}


/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}


@media screen and (max-width: 800px) {
    .leftcolumn, .rightcolumn {   
        width: 100%;
        padding: 0;
    }
}

@media screen and (max-width: 400px) {
    .topnav a {
        float: none;
        width: 100%;
    }
}
section div.section_div-s{
    margin:0 auto;
    width: 850px;
    min-height: 300px;
    height: auto;
}
div.section_div-s button.btn{
    background: rgba(50, 50, 58, 0.877);
    color: white;
    border: 0px;
    border-radius:5px;
    margin: 5px;
    padding: 3px;
    padding-left: 10px;
    padding-right:10px;
}
div.section_div-s{
    text-align:center;
}
div.section_div-s table{
    margin:0 auto;
    border: 1px solid #ddd;
    border-collapse: collapse;
}
div.section_div-s table tr{
    border: 1px solid #ddd;
}
div.section_div-s table tr:hover{
    border: 1px solid #ddd;
    background: cadetblue;
}
div.section_div-s table tr th{
    border: 1px solid #ddd;
    background: lightblue;
    padding:15px;
}
div.section_div-s table tr td{
    border: 1px solid #ddd;
    padding:10px;
}
</style>


        <br><br>
        <h2>회원관리</h2>
        <div class="main-li-container">
                   <div class="row">
   
  <div class="rightcolumn">
        <div class="section_div-s" >
      
            <table>
                <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>생년월일</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>가입일</th>
                    <th>회원등급</th>
                </tr>
                <c:forEach items="${list}" var="m">
                <tr>
                    <td><a href="#">${m.member_id }</a></td>
                    <td>${m.member_name }</td>
                    <td>${m.member_gender }</td>
                    <td>${m.member_birthDay }</td>
                    <td>${m.member_phone }</td>
                    <td>${m.member_email }</td>
                    <td>${m.member_enrollDate }</td>
                    <td>${m.member_grade }</td>
                    
                </tr>
                </c:forEach>
                
            </table>
            <br>
            <span>이전</span><span>1 2 3 4 5</span><span>다음</span>
        </div>
    	<a href="${pageContext.request.contextPath }/product/productEnroll.do">상품등록페이지</a>
  </div>
  
</div>
        </div>
        <br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>