<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
// 세션값 가져오기
String id = (String) session.getAttribute("id");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/yStyle.css">

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
		<c:forEach items="${ attachVos }" var="attach">

			<div class="y_container-col y_item y_cursor-pointer"
				>
				<img class="y_thumbnail-img" alt="test" onclick="location.href='/goods/productDetail?goodsName=${ attach.goodsName }'"
					src="/upload/${ attach.uploadpath }/${ attach.uuid }_${ attach.filename1 }"
					style="object-fit: cover;">
					 <span class="y_overflow-text" onclick="location.href='/goods/productDetail?goodsName=${ attach.goodsName }'">${ attach.goodsName }</span>
						<span class="y_overflow-price" style="font-size: 18px;" onclick="location.href='/goods/productDetail?goodsName=${ attach.goodsName }'">
							<fmt:formatNumber pattern="#,###원" value="${ attach.salePrice }" />
						</span>
						<span class="y_overflow-sub" onclick="location.href='/goods/productDetail?goodsName=${ attach.goodsName }'">${ attach.subGoods }</span>
						<c:if test="${ sessionScope.id == 'admin' }">
							<div>
								<a href="#" class="btn default btnModify" style="margin-left: 30px; margin-right: 40px;">수정</a>
								<input type="hidden" value="${ attach.goodsName }">
								<a href="#" class="btn default btnDel">삭제</a>
								<input type="hidden" value="${ attach.goodsName }">
							</div>
						</c:if>
						
			</div>

		</c:forEach>
	</div>

	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />
	
	<script src="../js/jquery-3.5.1.js"></script>
	
	<script>
// 	$('.btnDel').click(function () {
// 		let goodsName = $(this).next().val();	//메서드를 부른 버튼의 이후 요소를 지목
// 		event.preventDefault(); // 스크롤바 이동 방지
// 		goodsDelete(goodsName);
// 	});
	
// 	function goodsDelete(goodsName) {
		
// 		let result = confirm('해당 상품을 정말 삭제하시겠습니까?');
		
// 		if (result == false) {
// 			return;
// 		}
		
// 		location.href='/goods/goodsDelete?goodsName=' + goodsName;
// 	}

$('.btnDel').click(function () {
	
		let goodsName = $(this).next().val();	//메서드를 부른 버튼의 이후 요소를 지목
		event.preventDefault(); // 스크롤바 이동 방지
		
		let result = confirm('해당 상품을 삭제하시겠습니까?');
		
		if (result == false) {
			return;
		}
		
		
		$.ajax({
			url: '/goods/goodsDelete?goodsName=' + goodsName,
			success: function (response) {
				console.log(response);
				// 현재 페이지 다시 불러오기
				location.href='/goods/allGoods'
	
			},
			error: function () {
				alert('상품 삭제 실패!');
				location.href = '/goods/allGoods';
			}
		});
		
	});
	
	
	$('.btnModify').click(function () {
		let goodsName = $(this).next().val();	//메서드를 부른 버튼의 이후 요소를 지목
		event.preventDefault(); // 스크롤바 이동 방지
		
		goodsModify(goodsName);
	});
	
	function goodsModify(goodsName) {
		
		let result = confirm('해당 상품을 수정하시겠습니까?');
		
		if (result == false) {
			return;
		}
		
		location.href='/goods/goodsModify?goodsName=' + goodsName;
	}
	
	
	
	
	</script>

</body>
</html>