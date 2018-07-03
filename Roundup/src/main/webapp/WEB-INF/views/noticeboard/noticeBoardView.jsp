
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- 유저롤을 가진 유저  -->
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시물-상세보기" name="pageTitle"/>
</jsp:include>

<style>
div#freeBoardView-container{
	width:640px;
	margin:0 auto;
	border:1px solid lightgray;
}
div.freeBoardView-title{
	width:590px;
	height:30px;
}
div.freeBoardView-title.title{
	margin:20px 20px 0px 20px;
	border-bottom: 1px dotted lightgray;
}
div.freeBoardView-title.title span, div.freeBoardView-title.member span{
	font-size: 15sp;
	font-weight: bold;
}
div.freeBoardView-title.member{
	margin:10px 10px 10px 20px;
}
div.freeBoardView-comment{
	width:638px;
	background: rgb(229, 228, 221);
}
div.freeBoardView-comment.read{
	width:600px;
	margin:0 auto;
}
div.freeBoardView-comment.read.level2{
	padding-left: 15px;
}
div.freeBoardView-comment.read.title{
		margin-bottom:5px;
}
div.freeBoardView-comment.read p{
	border-bottom:1px dotted white;
	padding-bottom:3px;
}
div.freeBoardView-comment.write{
	width:600px;
	height:150px;
	margin:0 auto;
}
div.freeBoardView-comment.comment{
	width:550px;
	height:70px;
	margin:0 0 10px 50px;
	
}
div.freeBoardView-comment.comment textarea{
	width:450px;
	height:70px;
	display:block;
	float:right;
	resize:none;
}
div.freeBoardView-comment.comment button{
	width:100px;
	height:70px;
	float:right;
}
div.freeBoardView-comment.comment p{
	clear:both;
	padding-bottom:5px;
	border-bottom:1px dotted white;
}
div.freeBoardView-comment.write textarea{
	width:500px;
	height:70px;
	display:block;
	float:left;
	resize:none;
}
div.freeBoardView-comment.write button{
	width:100px;
	height:70px;
	float:left;
}
/* 게시판 리스트 관련 */
div#freetable_container{
	width:980px;
	margin:0 auto;
	text-align: center;
}
div#freetable_container tr th{
	text-align: center;
}
div#freeBoard-comment img{
	max-width:550px;
}
</style>

<!-- 글쓰기 상세보기 아래에 넣음 -->
<script>
function fn_insertBoard(){
	location.href="${pageContext.request.contextPath}/noticeboard/insertBoard.do";
}
</script>


<div id="freeBoardView-container">
	<div class="freeBoardView-title title">
		<div style="float:left;">
			<span>${fboard["notice_board_title"]}</span>
			| 공지사항
		</div>
		<div style="float:right;">
			${fboard["notice_reg_date"] }
		</div>
	</div>
	
	<div class="freeBoardView-title member">
		<span>${fboard["member_id"] }</span>
	</div>
	<div id="freeBoard-comment">
		${fboard["notice_comment"]}
	</div>
	<br />
	
	
	
</div>

<!-- 게시판 리스트 관련 -->

<div id="freetable_container">
	<h2>공지사항</h2>
	<table class="table table-striped">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>날짜</th>
		</tr>
		<c:if test="${blist !=null }">
			<c:forEach items="${blist }" var="f">
				<tr>
					<td>${f["notice_board_no"] }</td>
					<td  style="text-align:left;">
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
	
	<c:if test="${member_id !=null}">
	<input type="button" class="btn btn-light" value="글쓰기" style="float:right;" onclick="fn_insertBoard();"  />
	</c:if>

<!-- 페이지바 -->
<%
	int count = Integer.parseInt(String.valueOf(request.getAttribute("pcount")));
	int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
	int cPage = 1;
	int no = Integer.parseInt(String.valueOf(request.getAttribute("no")));
	try{
		cPage = Integer.parseInt(request.getParameter("cPage"));
	}catch(NumberFormatException e){
		
	}
%>
<%=com.proj.rup.common.util.UtilsView.getPageBar(count,cPage,numPerPage,no,"freeBoardView.do")%>
</div>	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
