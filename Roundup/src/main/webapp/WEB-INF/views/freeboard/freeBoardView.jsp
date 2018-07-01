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
	<div id="freeBoard-comment">
		${fboard["free_comment"]}
	</div>
	<br />
	
	<span style="margin:0 0 0 20px; color:navy;" id="comment_count">댓글 ${count }개</span>
	
	<c:if test="${listc==null }">
	<div class="freeBoardView-comment">
		<br />
			<div class="freeBoardView-comment write">
				<textarea name="pcomment_content" cols="30" rows="10"></textarea>
				<button id="insertComment">등록</button>
			</div>
	</div>
	</c:if>
	<div class="freeBoardView-comment">
		<c:if test="${listc!=null }">
			<c:forEach items="${listc }" var="fc" >
				<c:if test="${fc['comment_level']==1 }">
				<div class="freeBoardView-comment read">
					<input type="hidden" name="${fc['comment_no'] }" />
					<div class="freeBoardView-comment read title">
						<span style="font-weight:bold;">${fc['member_id'] }</span>
						<span>${fc['comment_enrolldate'] }</span>
						<input type="hidden" name="parentId" value="${fc['member_id'] }" />
						<button class="comment-btn" value="${fc['comment_no'] }">답글</button>
					</div>
					<p>
						<span>${fc['comment_content'] }</span>
					</p>
				</div>
			</c:if>
			<c:if test="${fc['comment_level']==2 }">
			<div class="${fc['parent_comment'] }">
				<div class="freeBoardView-comment read level2">
					<div class="freeBoardView-comment read title">
						<span style="font-weight:bold;">ㄴ${fc['member_id'] }</span>
						<span>${fc['comment_enrolldate'] }</span>
						<input type="hidden" name="parentId" value="${fc['member_id'] }" />
						<button class="comment-btn-reply" value="${fc['parent_comment'] }">답글</button>
					</div>
					<p>					
						<span style="padding-left:13px;">
						<span style="font-weight:bold">${fc['parent_id'] } </span>					
						${fc['comment_content'] }
						</span>
					</p>
				</div>
			</div>
			</c:if>
			</c:forEach>
			<div class="freeBoardView-comment write">
				<textarea name="pcomment_content" cols="30" rows="10"></textarea>
				<input type="hidden" name="member_id_t" value="${member_id }" />
				<input type="hidden" name="free_board_no" value="${fboard['free_board_no'] }" />
				<input type="hidden" name="parent_comment" value="0" />
				<input type="hidden" name="comment_level" value="1" />
				<button id="insertComment">등록</button>
			</div>
		</c:if>
	</div>
</div>

<!-- 게시판 리스트 관련 -->

<div id="freetable_container">
	<h2>자유게시판</h2>
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
					<td>${f["free_board_no"] }</td>
					<td  style="text-align:left;">
						<a href="freeBoardView.do?no=${f['free_board_no']}" style="color:black;">
						${f["free_board_title"] }
						<c:if test="${f['bc_count'] !=0 }">
						<span style="color:orange;">[${f["bc_count"]}]</span>
						</c:if>
						</a>
					</td>
					<td>${f["member_id"] }</td>
					<td>${f["free_reg_date"] }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<br />

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




<script>
$(function(){
	var chk_comment_btn=false; //답글 클릭시 보여주기or사라지게 하기 위한 변수
	
	$("#insertComment").on('click',function(){
		var pcomment_content = $("[name=pcomment_content]").val().trim();
		//댓글 null체크
		if(pcomment_content==""){
			alert("댓글을 입력하셔야 합니다.");
		}
		
		<c:if test="${empty member_id}">
		alert("로그인 후 이용가능 합니다.");
		</c:if>
		
		var member_id = $("[name=member_id_t]").val().trim();
		var free_board_no = $("[name=free_board_no]").val().trim();
		var parent_comment = $("[name=parent_comment]").val().trim();
		var comment_level = $("[name=comment_level]").val().trim();
		var parent_id=null;
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			url:"insertComment.do",
			data:{
				  member_id:member_id,
				  free_board_no:free_board_no,
				  parent_comment:parent_comment,
				  comment_level:comment_level,
				  comment_content:pcomment_content,
				  parent_id:parent_id
			},
			method:"POST",
			dataType:"json",
			success:function(data){
				console.log(data);
				var html='<div class="freeBoardView-comment read">';
				for(var index in data){
					var bc=data[index];
					if(index=='fbc'){
					html+= '<div class="freeBoardView-comment read title">';
					html+= '<span style="font-weight:bold;">'+bc["member_id"]+'</span>';
					html+= '<span> '+bc["comment_enrolldate"]+'</span>'
					html+= '<input type="hidden" name="parentId" value="'+bc["member_id"]+'" />'
					html+='<button class="comment-btn" value="'+bc["comment_no"]+'">답글</button></div>';
					html+='<p><span>'+bc["comment_content"]+'</span></p></div>';
					}
					if(index=='count'){
						$("#comment_count").html("댓글"+bc+"개");
					}
				}
				$(html).insertBefore(".freeBoardView-comment.write");
			},
			error:function(jqxhr,textStatus, errorThrown){
				console.log("ajax실패",jqxhr,textStatus, errorThrown);
			}	
		});
		
	});	
	
	//대댓글 관련 부분 
	$(document).on('click','.comment-btn',function(){
		var div = $("<div style='border-bottom:1px dotted white;' class='freeBoardView-comment comment'></div>");
		var html='<button id="insertCommentComment">답글</button>';
		html+='<input type="hidden" name="member_id_cc" value="${member_id }" />';
		html+='<input type="hidden" name="free_board_no_c" value="${fboard['free_board_no']}" />';
		html+='<input type="hidden" name="parent_comment_c" value="'+$(this).val()+'" />';
		html+='<input type="hidden" name="comment_level_c" value="2" />';
		html+='<input type="hidden" name="parentId_c" value="'+$(this).prev().val()+'" />';
		html+='<textarea name="comment_content_c" cols="30" rows="10" ></textarea></form>';
		html+='<p></p>';
		console.log($(this).prop('tagName'));
		console.log($(this).prev().val());
		div.html(html);
		if(chk_comment_btn==false){
		//생성된 노드를 페이지에 추가
		$(".freeBoardView-comment.comment").remove();
		div.insertAfter($(this).parent().parent()).next().slideDown(800);
		chk_comment_btn=true;
				
		} else{
			$(".freeBoardView-comment.comment").remove();
			chk_comment_btn=false;
			div.insertAfter($(this).parent().parent()).next().slideDown(800);
		}		
	});
	
	$(document).on('click','.comment-btn-reply',function(){	
		var div = $("<div style='border-bottom:1px dotted white;' class='freeBoardView-comment comment'></div>");
		var html='<button id="insertCommentComment-reply">답글</button>';
		html+='<input type="hidden" name="member_id_re" value="${member_id}" />';
		html+='<input type="hidden" name="free_board_no_re" value="${fboard['free_board_no']}" />';
		html+='<input type="hidden" name="parent_comment_re" value="'+$(this).val()+'" />';
		html+='<input type="hidden" name="comment_level_re" value="2" />';
		html+='<input type="hidden" name="parentId_re" value="'+$(this).prev().val()+'" />';
		html+='<textarea name="comment_content_re" cols="30" rows="10" placeholder="'+$(this).prev().val()+'에게 답글쓰기"></textarea></form>';
		html+='<p></p>';
		console.log($(this).prop('tagName'));
		console.log($(this).prev().val());
		div.html(html);
		if(chk_comment_btn==false){
		//생성된 노드를 페이지에 추가
		$(".freeBoardView-comment.comment").remove();
		div.insertAfter($(this).parent().parent()).next().slideDown(800);
		chk_comment_btn=true;
				
		} else{
			$(".freeBoardView-comment.comment").remove();
			chk_comment_btn=false;
			div.insertAfter($(this).parent().parent()).next().slideDown(800);
		}		
	});
	
	$(document).on('click','#insertCommentComment',function(){
		var comment_content = $("[name=comment_content_c]").val().trim();
		//댓글 null체크
		if(comment_content==""){
			alert("댓글을 입력하셔야 합니다.");
			
			return false;
		}
		
		<c:if test="${empty member_id}">
		alert("로그인 후 이용가능 합니다.");
		</c:if>
		
		var member_id = $("[name=member_id_cc]").val();
		var free_board_no = $("[name=free_board_no_c]").val().trim();
		var parent_comment = $("[name=parent_comment_c]").val().trim();
		var comment_level = $("[name=comment_level_c]").val().trim();
		var parent_id =null;//$("[name=parentId_c]").val();
		console.log(member_id+','+free_board_no+','+parent_comment+','+comment_level+','+parent_id);
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			url:"insertComment.do",
			data:{member_id:member_id,
				  free_board_no:free_board_no,
				  parent_comment:parent_comment,
				  comment_level:comment_level,
				  comment_content:comment_content,
				  parent_id:parent_id
			},
			method:"POST",
			dataType:"json",
			success:function(data){
				console.log(data);
				var html='<div class="'+parent_comment+'">';
				for(var index in data){
					var bc=data[index];
					if(index=='fbc'){
					html+='<div class="freeBoardView-comment read level2">';
					html+= '<div class="freeBoardView-comment read title">';
					html+= '<span style="font-weight:bold;">ㄴ'+bc["member_id"]+'</span>';
					html+= '<span> '+bc["comment_enrolldate"]+'</span>'
					html+= '<input type="hidden" name="parentId_c" value="'+member_id+'"/>';
					html+='<button class="comment-btn-reply" value="'+bc["parent_comment"]+'">답글</button></div>';
					html+='<p><span style="padding-left:13px;">'+bc["comment_content"]+'</span></p></div></div>';
					}
					
					if(index=='count'){
						$("#comment_count").html("댓글"+bc+"개");
					}
				}
				if($('.'+parent_comment).length){
					$(".freeBoardView-comment.comment").remove();
					console.log("1");
					$(html).insertAfter($('.'+parent_comment+':last').children(".freeBoardView-comment.read.level2:last"));
				}else{
					console.log("2");
					$(html).insertBefore(".freeBoardView-comment.comment");
					$(".freeBoardView-comment.comment").remove();
				}
				
				
			},	
			error:function(jqxhr,textStatus, errorThrown){
				console.log("ajax실패",jqxhr,textStatus, errorThrown);
			}	
		});
		
	});	
	
	$(document).on('click','#insertCommentComment-reply',function(){
		var comment_content = $("[name=comment_content_re]").val().trim();
		//댓글 null체크
		if(comment_content==""){
			alert("댓글을 입력하셔야 합니다.");
			
			return false;
		}
		
		<c:if test="${empty member_id}">
			alert("로그인 후 이용가능 합니다.");
		</c:if>
		
		var member_id = $("[name=member_id_re]").val();
		var free_board_no = $("[name=free_board_no_re]").val().trim();
		var parent_comment = $("[name=parent_comment_re]").val().trim();
		var comment_level = $("[name=comment_level_re]").val().trim();
		var parent_id =$("[name=parentId_re]").val();
		console.log(member_id+','+free_board_no+','+parent_comment+','+comment_level+','+parent_id);
		
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
		$.ajax({
			url:"insertComment.do",
			data:{member_id:member_id,
				  free_board_no:free_board_no,
				  parent_comment:parent_comment,
				  comment_level:comment_level,
				  comment_content:comment_content,
				  parent_id:parent_id
			},
			method:"POST",
			dataType:"json",
			success:function(data){
				console.log(data);
				var html='<div class="'+parent_comment+'">';
				for(var index in data){
					var bc=data[index];
					if(index=='fbc'){
					html+='<div class="freeBoardView-comment read level2">';
					html+= '<div class="freeBoardView-comment read title">';
					html+= '<span style="font-weight:bold;">ㄴ'+bc["member_id"]+'</span>';
					html+= '<span> '+bc["comment_enrolldate"]+'</span>'
					html+= '<input type="hidden" name="parentId_c" value="'+member_id+'"/>';
					html+='<button class="comment-btn-reply" value="'+bc["parent_comment"]+'">답글</button></div>';
					html+='<p><span style="padding-left:13px;"><span style="font-weight:bold">'+parent_id+' </span>'+bc["comment_content"]+'</span></p></div></div>';
					}
					
					if(index=='count'){
						$("#comment_count").html("댓글"+bc+"개");
					}
				}
				if($('.'+parent_comment).length){
					$(".freeBoardView-comment.comment").remove();
					console.log("1");
					$(html).insertAfter($('.'+parent_comment+':last').children(".freeBoardView-comment.read.level2:last"));
				}else{
					console.log("2");
					$(html).insertBefore(".freeBoardView-comment.comment");
					$(".freeBoardView-comment.comment").remove();
				}
				
				
			},	
			error:function(jqxhr,textStatus, errorThrown){
				console.log("ajax실패",jqxhr,textStatus, errorThrown);
			}	
		});
		
	});	
	
})
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

