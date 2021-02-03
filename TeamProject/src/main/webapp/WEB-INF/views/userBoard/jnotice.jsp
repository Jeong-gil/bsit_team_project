<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/notice.css">
</head>
<body>
	<div id="main">
		<div id="content">
			<div class="page_aticle aticle_type2">
				<div id="snb" class="snb_cc">
					<h2 class="tit_snb">고객센터</h2>
					<div class="inner_snb">
						<ul class="list_menu">
							<li class="on"><a href="/userBoard/notice">공지사항</a></li>
							<li><a href="#">자주하는 질문</a></li>
							<li><a href="#">1:1 문의</a></li>
							<li><a href="#">대량주문 문의</a></li>
							<li><a href="#">상품 제안</a></li>
							<li><a href="#">에코포장 피드백</a></li>
						</ul>
					</div>
				</div>
				<div class="page_section">
					<div class="head_aticle">
						<h2 class="tit">
							공지사항 <span class="tit_sub">졸리 스또</span>
						</h2>
					</div>
					<form name="frmList" action="#" onsubmit="">
						<input type="hidden" name="id" value="notice">
						<table width="100%" align="center" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td>
										<div
											class="xans-element- xans-myshop xans-myshop-couponserial ">
											<table width="100%" class="xans-board-listheader jh"
												cellpadding="0" cellspacing="0">
												<thead>
													<tr>
														<th>번호</th>
														<th>제목</th>
														<th>작성자</th>
														<th>작성일</th>
														<th>조회</th>
													</tr>
												</thead>
												<tbody>
													<c:choose>
														<c:when test="${ not empty jnoticeList }">

															<c:forEach var="jnotice" items="${ jnoticeList }">
																<tr>
																	<td width="50" align="center">공지</td>
																	<td
																		style="padding-left: 10px; text-align: left; color: #999">
																		<a href="#"><b>${ jnotice.title }</b></a>

																	</td>
																	<td width="100" align="center">${ jnotice.id }</td>
																	<td width="100" align="center" class="eng2"><fmt:formatDate
																			value="${ jnotice.regDate }" pattern="yyyy.MM.dd" /></td>
																	<td width="30" align="center" class="eng2">${ jnotice.readcount }</td>
																</tr>
															</c:forEach>
														</c:when>
													</c:choose>
												</tbody>
											</table>
										</div>
									</td>
								</tr>
							</tbody>
						</table>

					</form>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />
</body>
</html>