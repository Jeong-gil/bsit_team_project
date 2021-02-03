<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/yStyle.css">
<title>건강 견과류 - 전체상품</title>
</head>
<body>
	<%-- head 컨텐트 영역 --%>
	<jsp:include page="/WEB-INF/views/include/header_.jsp" />
	<div class="y_product-classification-header">전체상품</div>
	<div class="y_ranking-category">
		<a href="/goods/allproducts.jsp">최신순</a> | <a
			href="/goods/allproducts.jsp?sort=highSales">누적판매순</a> | <a
			href="/goods/allproducts.jsp?sort=lowPrice">낮은가격순</a>
	</div>

	<div class="y_container-row y_chage-category">
		<c:forEach items="${ goodsVos }" var="goods">

			<div class="y_container-col y_item y_cursor-pointer"
				onclick="location.href='/goods/productDetail?goodsName=${ goods.goodsName }'">
				<img class="y_thumbnail-img" alt="test"
					src="/images/orange-1164504_1920.jpg"
					style="object-fit: cover;"> <span class="y_overflow-text">${ goods.goodsName }</span>
				<span class="y_overflow-text" style="font-size: 18px;"><fmt:formatNumber
						pattern="#,###원" value="${ goods.salePrice }" /></span>
			</div>

		</c:forEach>
	</div>

	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />

</body>
</html>