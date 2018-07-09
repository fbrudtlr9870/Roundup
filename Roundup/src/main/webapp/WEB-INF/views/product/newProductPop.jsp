<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<img src="${pageContext.request.contextPath }/resources/upload/productFile/${pf['RENAMED_FILENAME'] }" alt="" width="200px" height="150px"/>
<h2>신상품이 등록되었습니다.</h2>
<h4>상품명 : ${pf['PRODUCT_NAME'] }</h4>
<h4>가격 : ${pf['PRICE'] }</h4>
