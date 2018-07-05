<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="자유게시판" name="pageTitle"/>
</jsp:include>
<jsp:include page="/WEB-INF/views/common/nav.jsp">
	<jsp:param value="active" name="active3"/>
</jsp:include>
<!-- 유저롤을 가진 유저  -->
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<style>

div#freetable_container{
	width:980px;
	margin:0 auto;
	text-align: center;
}
div#freetable_container tr th{
	text-align: center;
}

</style>

<script>
function fn_insertBoard(){
	location.href="${pageContext.request.contextPath}/noticeboard/insertBoard.do";
}

</script>


<div class="main-img-wrapper">
	<div class="main-img">
		 <img src="${pageContext.request.contextPath }/resources/img/main-display.png" 
		 class="main-img-one" style="width:100%">
	</div>
</div>
<br /><br />

<div id="freetable_container">
	<h2>공지사항</h2>
	<table class="table table-striped">
		<tr>
			<th>번호</th>
			<th >제목</th>
			<th >아이디</th>
			<th >날짜</th>
		</tr>
		<c:if test="${list !=null }">
			<c:forEach items="${list }" var="f">
				<tr>
					<td>${f["notice_board_no"] }</td>
					<td style="text-align:left;">
						<a href="noticeBoardView.do?no=${f['notice_board_no']}" style="color:black;">
						${f["notice_board_title"] }
						<c:if test="${f['bc_count'] !=0 }">
						<span style="color:orange;">[${f["bc_count"]}]</span>
						</c:if>
						</a>
					</td>
					<td>${f["member_id"] }</td>
					<td>${f["notice_reg_date"] }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<br />
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<input type="button" class="btn btn-light" value="글쓰기" style="float:right;" onclick="fn_insertBoard();"  />
	</sec:authorize>
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
<%=com.proj.rup.common.util.Utils.getPageBar(count,cPage,numPerPage,"noticeBoardList.do")%>
</div>	



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>