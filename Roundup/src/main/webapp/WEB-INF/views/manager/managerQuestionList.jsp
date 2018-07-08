<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="편의점마스터" name="pageTitle"/>
</jsp:include>

<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id"/>
	<sec:authentication property="principal.member_name" var="member_name"/>
</sec:authorize>

<style>

div#question_container{
	text-align: center;
}
div#question_container tr th{
	text-align: center;
}
div.mypage{
   width:980px;
   margin:0 auto;
   
   min-height:780px;
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
.mypage-detail{
   width:780px;
}
.sidenav {
    background-color: #fff; 
    height: 100%;
}
.number-hyelin {
   display:inline;
}

.table{
   width:780px;
   font-size:13.5px;
}

.col-sm-3 {
    max-width: 200px;
}
.chart-master{
   width:780px;
}

.center-hyelin {
   text-align: center;
   margin-top: 15px;
}
.border-bottom-hyelin {
   border-bottom: 1px solid rgba(0,0,0,.1);
}
.padding-hyelin{
   padding-bottom: 20px !important;
   padding-top: 20px !important;
}
.btnBuy {
   width: 100%;
}
</style>


<br /><br />
<div class="container-fluid-master">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item-my">
                <a class="nav-link active" href="${pageContext.request.contextPath }/manager/managerPage.do">
                  <span data-feather="home"></span>
                  Home <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item-my">
                <a class="nav-link" href="${pageContext.request.contextPath }/manager/memberManagement.do">
                  <span data-feather="file"></span>
                  회원관리
                </a>
              </li>
              <li class="nav-item-my">
                <a class="nav-link" href="${pageContext.request.contextPath }/manager/deletedMember.do">
                  <span data-feather="shopping-cart"></span>
                  탈퇴회원목록
                </a>
              </li>
              <li class="nav-item-my">
                <a class="nav-link" href="${pageContext.request.contextPath }/product/productEnroll.do">
                  <span data-feather="users"></span>
                  상품등록
                </a>
              </li>
              <li class="nav-item-my">
              <!-- wnth지워주세염 -->
                <a class="nav-link" href="${pageContext.request.contextPath }/product/allProductList.do">
                  <span data-feather="bar-chart-2"></span>
                  전체상품
                </a>
              </li>
              <li class="nav-item-my">
              <!-- wnth지워주세염 -->
                <a class="nav-link" href="${pageContext.request.contextPath }/manager/managerPurchaseComplete.do">
                  <span data-feather="bar-chart-2"></span>
                 전체구매내역
                </a>
              </li>
              <li class="nav-item-my">
              <!-- wnth지워주세염 -->
                <a class="nav-link" href="${pageContext.request.contextPath }/manager/managerPurchaseCancel.do">
                  <span data-feather="bar-chart-2"></span>
                 전체취소내역
                </a>
              </li>
              <li class="nav-item-my">
              <!-- wnth지워주세염 -->
                <a class="nav-link" href="${pageContext.request.contextPath }/manager/managerQuestion.do">
                  <span data-feather="bar-chart-2"></span>
                 1:1문의
                </a>
              </li>
              
            </ul>
          </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">

				<div class="mypage container">
	<div class="row">
	  
	  </div>
		<div class="col-8">
		 <div class="tab-content" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="list-profile" role="tabpanel" aria-labelledby="list-question-list">
				<div id="question_container">
				<h2>1:1문의 목록</h2>
				<table class="table table-striped">
					<tr>
						<th>번호</th>
						<th >제목</th>
						<th>아이디</th>
						<th >날짜</th>
					</tr>
					<c:if test="${list !=null }">
						<c:forEach items="${list }" var="f">
							<tr>
								<td>${f["question_no"] }</td>
								<td style="text-align:left;">
									<a href="managerQuestionView.do?no=${f['question_no']}" style="color:black;">
									${f["question_title"] }
									</a>
								</td>
								<td>${f["member_id"]}</td>
								<td>${f["question_reg_date"] }</td>
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
			<%=com.proj.rup.common.util.Utils.getPageBar(count,cPage,numPerPage,"managerQuestion.do")%>
			</div>	
		</div>
		</div>
		</div>
	</div>	
</div>
      
			
	      	
	 
        
         
        </main>
      </div>
    </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


