<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title></title>
<style>
.nav {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    padding-left: 0;
    /* margin-bottom: 0; */
    margin: 0 auto;
    list-style: none;
    width: 980px;
}
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #fff;
    background: #5c83ad;
    
}
.nav-fill .nav-item {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    text-align: center;
    margin: 0;
    width:140px;
}
</style>
</head>
<nav class="nav nav-pills nav-fill">
  <a class="nav-item nav-link active" href="#">카테고리</a>
  <a class="nav-item nav-link" href="#">행사</a>
  <a class="nav-item nav-link" href="#">공지사항</a>
  <a class="nav-item nav-link" href="${pageContext.request.contextPath }/freeboard/freeBoardList.do">게시판</a>
  <a class="nav-item nav-link disabled" href="#">1:1문의</a>
</nav>