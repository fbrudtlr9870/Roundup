<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유게시판" name="pageTitle"/>
</jsp:include>

<style>

div#table_container{
	width:980px;
	margin:0 auto;
	text-align: center;
}
div#table_container th,tr td{
	text-align: center;
}

</style>

<div class="main-img-wrapper">
	<div class="main-img">
		 <img src="${pageContext.request.contextPath }/resources/img/main-display.png" 
		 class="main-img-one" style="width:100%">
	</div>
</div>
<br /><br />

<div id="table_container">
	<h2>자유게시판</h2>
	<table class="table table-striped">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>날짜</th>
		</tr>
		<c:if test="${list !=null }">
			<c:forEach items="${list }" var="f">
				<tr>
					<td>${f["free_board_no"] }</td>
					<td>${f["free_board_title"] }</td>
					<td>${f["member_id"] }</td>
					<td>${f["free_reg_date"] }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<br />

<!-- 페이지바 -->
<%
	int count = Integer.parseInt(String.valueOf(request.getAttribute("count")));
	int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
	int cPage = 1;
	try{
		cPage = Integer.parseInt(request.getParameter("cPage"));
	}catch(NumberFormatException e){
		
	}
%>
<%=com.proj.rup.common.util.Utils.getPageBar(count,cPage,numPerPage,"freeBoardList.do")%>
</div>	



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>