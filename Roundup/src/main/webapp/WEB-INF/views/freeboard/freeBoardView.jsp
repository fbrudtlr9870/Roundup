<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

</style>

<div id="freeBoardView-container">
	<div class="freeBoardView-title title">
		<div style="float:left;">
			<span>${fboard["free_board_title"]}</span>
			| 자유게시판
		</div>
		<div style="float:right;">
			${fboard["free_reg_date"] }
		</div>
	</div>
	
	<div class="freeBoardView-title member">
		<span>${fboard["member_id"] }</span>
	</div>
	<div class="freeBoardView-title member">
		<p>${fboard["free_comment"]}</p>
	</div>
	<br />
	
	<span style="margin:0 0 0 20px; color:navy;">댓글 10개</span>
	
	<c:if test="${listc==null }">
	<div class="freeBoardView-comment">
		<br />
			<div class="freeBoardView-comment write">
				<textarea name="" id="" cols="30" rows="10"></textarea>
				<button>등록</button>
			</div>
	</div>
	</c:if>
	<div class="freeBoardView-comment">
		<c:if test="${listc!=null }">
			<c:forEach items="${listc }" var="fc" >
			<c:if test="${fc['comment_level']==1 }">
				<div class="freeBoardView-comment read">
					<div class="freeBoardView-comment read title">
						<span style="font-weight:bold;">${fc['member_id'] }</span>
						<span>${fc['comment_enrolldate'] }</span>
						<button class="comment-btn">답글</button>
					</div>
					<p>
						<span>${fc['comment_content'] }</span>
					</p>
				</div>
			</c:if>
			<c:if test="${fc['comment_level']!=1 }">
				<div class="freeBoardView-comment read level2">
					<div class="freeBoardView-comment read title">
						<span style="font-weight:bold;">ㄴ${fc['member_id'] }</span>
						<span>${fc['comment_enrolldate'] }</span>
						<button class="comment-btn">답글</button>
					</div>
					<p>
						<span style="padding-left:13px;">${fc['comment_content'] }</span>
					</p>
				</div>
			</c:if>
			</c:forEach>
			<br />
			<div class="freeBoardView-comment write">
				<textarea name="" id="" cols="30" rows="10"></textarea>
				<button>등록</button>
			</div>
		</c:if>
	</div>
</div>

<script>
$(function(){
	var chk_comment_btn=false;
	$(".comment-btn").on('click',function(){
		if(chk_comment_btn==false){
		var div = $("<div style='border-bottom:1px dotted white;' class='freeBoardView-comment comment'></div>");
		var html='<button>답글</button>';
		html+='<textarea name="" id="" cols="30" rows="10"></textarea>';
		html+='<p></p>';
		
		div.html(html);
		//생성된 노드를 페이지에 추가
		div.insertAfter($(this).parent().parent()).children("div").slideDown(800);
		//$(this).off('click');
		chk_comment_btn=true;
		} else{
			$(this).parent().parent().parent().find("div.freeBoardView-comment.comment").remove();
			chk_comment_btn=false;
		}
		
		
	})
	
})
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>