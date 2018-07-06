<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a701e8b07c907d6b0da0dbd2a200e68&libraries=services"></script>
<script charset="UTF-8" type="text/javascript"
   src="http://t1.daumcdn.net/cssjs/postcode/1522037570977/180326.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/code/highcharts.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/code/modules/exporting.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/code/modules/export-data.js"></script>
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>
<style>
div.mypage{
	width:980px;
	margin:0 auto;
	
	min-height:780px;
}
.col-sm-3 {
    max-width: 200px;
}
.list-group-item {
    position: relative;
    display: block;
    padding: .75rem 1.25rem;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid rgba(0,0,0,.125);
    width: 150px;
}
table {
   margin: 0 auto;
   border: 1px solid #ddd;
   border-collapse: collapse;
   width:780px;
}

table tr {
   border: 1px solid #ddd;
}

table tr:hover {
   border: 1px solid #ddd;
   background: #FFEAEA;
}

table tr th {
   border: 1px solid #ddd;
   background: #FF7E7E;
   padding: 15px;
}

table tr td {
   border: 1px solid #ddd;
   padding: 10px;
   font-size: 0.8em;
}

.table-dh{
	width: 770px;

}

</style>



<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>

<script>
   $(function() {
      $("tr[no]").on("click",function() {
         console.log($(this).attr("no"));
         location.href = "${pageContext.request.contextPath}/manager/managerView.do?member_id="
               + $(this).attr("no");
      });
   });
</script>

<div class="mypage container">
	<div class="row">
	  <div class="row">
	  <div class="col-sm-3 sidenav">
	    <div class="list-group" id="list-tab" role="tablist">
	      <a class="list-group-item list-group-item-action active" id="list-home-list"  href="${pageContext.request.contextPath }/manager/managerPage.do" role="tab" aria-controls="home">Home</a>
	      <a class="list-group-item list-group-item-action" id="list-profile-list"  href="${pageContext.request.contextPath }/manager/memberManagement.do" role="tab" aria-controls="profile">회원관리</a>
	      <a class="list-group-item list-group-item-action" id="list-deletedMember-list"  href="${pageContext.request.contextPath }/manager/deletedMember.do" role="tab" aria-controls="deletedMember">탈퇴회원목록</a>
	      <a class="list-group-item list-group-item-action" id="list-basket-list"  href="${pageContext.request.contextPath }/product/productEnroll.do" role="tab" aria-controls="baskeet">상품등록</a>
	      <a class="list-group-item list-group-item-action" id="list-allProduct-list"  href="${pageContext.request.contextPath }/product/allProductList.do" role="tab" aria-controls="allproduct">전체상품</a>
	      <a class="list-group-item list-group-item-action" id="list-deletedProduct-list"  href="#" role="tab" aria-controls="settings">삭제된상품</a>
	      <a class="list-group-item list-group-item-action" id="list-allPurchaseComplete-list"  href="${pageContext.request.contextPath }/manager/managerPurchaseComplete.do" role="tab" aria-controls="allPurchase">전체구매내역</a>
	      <a class="list-group-item list-group-item-action" id="list-allPurchaseCancel-list"  href="#" role="tab" aria-controls="allCancel">전체취소내역</a>
	      <a class="list-group-item list-group-item-action" id="list-event-list"  href="#" role="tab" aria-controls="settings">이벤트등록</a>
	      <a class="list-group-item list-group-item-action" id="list-allEvent-list"  href="#" role="tab" aria-controls="settings">전체이벤트</a>
	    </div>
	  </div>
	  <div class="col-8">
	    <div class="tab-content" id="nav-tabContent">
	      <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
	     	<h3>탈퇴회원목록</h3><br />
	     	<div class="section_div-s" id="section-dh">
	     	
	            <p class="imsosotired2">탈퇴한 총 회원 수 : ${totalContents }명</p>
				
	            <table class="table-dh">
	               <tr>
	                  <th>아이디</th>
	                  <th>이름</th>
	                  <th>성별</th>
	                  <th>생년월일</th>
	                  <th>전화번호</th>
	                  <th>이메일</th>
	                  <th>가입일</th>
	                 
	               </tr>
	               <c:forEach items="${list}" var="m">
	                  <tr no="${m.member_id }">
	                     <td>${m.member_id }</td>
	                     <td>${m.member_name }</td>
	                     <td>${m.member_gender }</td>
	                     <td>${m.member_birthday }</td>
	                     <td>${m.member_phone }</td>
	                     <td>${m.member_email }</td>
	                     <td>${m.member_enrollDate }</td>
	                  
	
	                  </tr>
	               </c:forEach>
	
	            </table>
	            
	            <br />
				<ul class="pagination justify-content-center pagination-sm" style="clear:both; margin-left:140px;">
	            <!-- 페이지바 -->
	            <%
	               int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
	               int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
	               int cPage = 1;
	               try {
	                  cPage = Integer.parseInt(request.getParameter("cPage"));
	               } catch (NumberFormatException e) {
	
	               }
	            %>
	            <%=com.proj.rup.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "deletedMember.do")%>
			</ul>
	         </div>
	      
	      </div>
	          
	         
	      
	      </div>
	    </div>
	  </div>
	</div>
	
</div>
<br /><br /><br />


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>