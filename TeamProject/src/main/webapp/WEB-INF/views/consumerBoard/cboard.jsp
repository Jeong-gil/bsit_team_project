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
<style type="text/css">
.mypage_top {
    width: 100%;
    padding: 50px 0;
    margin-bottom: -20px;
    background-color: #f7f7f7;
}
.page_aticle {
    width: 1050px;
    margin: 0 auto;
}
.mypage_top .mypagetop_user {
    overflow: hidden;
    width: 1050px;
    margin: 0 auto;
}
.page_aticle button, .page_aticle input, .page_aticle select, .page_aticle * {
    font-family: noto sans;
    font-weight: 400;
    letter-spacing: 0;
}
.mypage_top .inner_mypagetop {
    overflow: hidden;
    width: 100%;
    background: url(https://res.kurly.com/pc/service/common/1904/bg_mypagetop.png) repeat-y 0 0;
}
.mypage_top .grade_user {
    float: left;
    width: 444px;
    height: 100%;
    padding: 28px 0 30px 30px;
    background-color: #fff;
}
.mypage_top .grade_user .grade {
    overflow: hidden;
    width: 100%;
    padding-right: 26px;
}

.mypage_top .grade_user .class0 {
    border: 1px solid #ea97ad;
    background-color: #fff;
    color: #ea97ad;
}
.mypage_top .grade_user .ico_grade {
    float: left;
    width: 64px;
    height: 64px;
    margin: 2px 20px 0 0;
    border-radius: 3px;
    font-size: 16px;
    color: #fff;
    text-align: center;
    word-break: break-all;
}
.mypage_top .grade_bnenfit {
    overflow: hidden;
}
.mypage_top .grade_user .user {
    overflow: hidden;
    padding: 2px 0 14px;
}
.mypage_top .name {
    overflow: hidden;
    float: left;
    max-width: 263px;
    font-weight: 700;
    font-size: 20px;
    color: #333;
    line-height: 28px;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.mypage_top .txt {
    float: left;
    padding-left: 5px;
    font-size: 16px;
    line-height: 28px;
}
.mypage_top .grade_user .benefit {
    padding-top: 2px;
}
.mypage_top .benefit {
    font-size: 12px;
    line-height: 18px;
    color: #333;
}
.mypage_top .total_grade {
    width: 121px;
}
.mypage_top .benefit .tit {
    color: #ea97ad;
}
.mypage_top .next {
    overflow: hidden;
    width: 100%;
    padding: 22px 0 0 84px;
}
.mypage_top .next a {
    float: left;
    height: 30px;
    padding-top: 4px;
    margin-right: 10px;
    border: 1px solid #f4f4f3;
    border-radius: 15px;
    background-color: #f4f4f4;
    font-size: 14px;
    color: #333;
    line-height: 18px;
    text-align: center;
}
.mypage_top .next_month {
    width: 169px;
}
.mypage_top .list_mypage {
    float: right;
    width: 602px;
}
.mypage_top .list_mypage li {
    float: left;
    width: 198px;
    margin-right: 4px;
    background-color: #fff;
}
.mypage_top .list_mypage .link {
    float: left;
    width: 100%;
    padding: 29px 0 0 30px;
}
.mypage_top .list_mypage li {
    float: left;
    width: 198px;
    margin-right: 4px;
    background-color: #fff;
}
.mypage_top .list_mypage .tit {
    padding-bottom: 26px;
    font-size: 14px;
    line-height: 18px;
    color: #333;
}
.mypage_top .list_mypage .info {
    font-weight: 700;
    font-size: 20px;
    color: #ea97ad;
    line-height: 28px;
}
.mypage_top .list_mypage .info .date {
    display: block;
    padding-top: 12px;
    font-size: 12px;
    color: #999;
    line-height: 16px;
}
.mypage_top .list_mypage .user_kurlypass {
    margin-right: 0;
}
.mypage_top .bnr_event {
    display: block;
    overflow: hidden;
    width: 100%;
    height: 60px;
    margin-top: 20px;
    background-size: 1050px 60px;
    background-repeat: no-repeat;
    background-position: 50% 50%;
}

.Jline {
	margin-top: 20px;
}
.Jlineheader{
	font-weight: bold;
	font-size: 25px;
}


.JlineUl {
	padding-top: 10px;
	border-top: 2px solid #ea97ad;
}

.Jdate {
	padding-top: 20px;
	font-size: 16px;
	line-height: 24px;
	font-weight: 700;
	color: #666;
}

.Jgoods {
	position: relative;
	margin-top: 10px;
	padding: 0 20px;
	border: 1px solid #dddfe1;
}

.JgoodsName {
	padding: 20px 0 13px;
	border-bottom: 1px solid #dddfe1;
}
.Jgoodsname {
	display: block;
	overflow: hidden;
	/* background: url(""); */
	font-size: 16px;
	line-height: 24px;
	font-weight: 700;
	color: #000;
	cursor: pointer;
}
.order_info {
    overflow: hidden;
    padding: 14px 0 20px;
}
.goodsImg {
	float:left;
	width: 60px;
	margin-right: 20px;
}
.goodsImg img {
	width: 60px;
	height: auto;
}
.Jex {
	overflow: hidden;
	padding-top: 1px;
}
.order_info:first-child {
	padding-top: 3px;
}
.order_info dl {
	overflow: hidden;
}
.order_info dt {
	float: left;
	padding-right: 15px;
	font-size: 12px;
	color: #000;
	line-height: 20px;
}
.order_info dd {
	float: left;
	font-size: 14px;
	line-height: 20px;
	font-weight: 700;
	color: #000;
}
.order_info .order_end {
	color: #ea97ad;
}
.order_status {
	display: table;
	position: absolute;
	right: 20px;
	bottom: 0;
	height: 114px;
	vertical-align: middle;
}
.inner_status {
	display: table-cell;
	vertical-align: middle;
}
.order_status .link {
	display: block;
	width: 100px;
	height: 34px;
	border: 1px solid #ea97ad;
	background-color: #fff;
	font-size: 12px;
	color: #ea97ad;
	line-height: 32px;
	text-align: center;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="main">
		<div id="content">
			<div class="page_aticle aticle_type2">
			
				<div id="myPageTop" class="page_aticle mypage_top">
					<div class="mypagetop_user">
						<div class="inner_mypagetop">
							<div class="grade_user">
								<div class="grade">
									<span class="screen_out">등급</span> 
									<span class="ico_grade class0">
										<span class="inner_grade">
											<span class="in_grade">일반</span>
										</span>
									</span>
									<div class="grade_bnenfit">
										<div class="user">
											<strong class="name">신우경</strong> 
											<span class="txt">님</span>
										</div>
										<div class="benefit">
											<strong class="tit">첫구매 우대 - </strong>적립 5%
										</div>
										<div class="benefit">
											<strong class="tit">첫구매 우대 - </strong>20,000원 이상 무료 배송
										</div>
										<div class="benefit"></div>
									</div>
								</div>
								<div class="next">
									<a href="#" class="total_grade">전체등급 보기</a> 
									<a href="#" class="next_month">다음 달 예상등급 보기</a>
								</div>
							</div>
							<ul class="list_mypage">
								<li class="user_reserve">
									<div class="link">
										<div class="tit">적립금
										</div>
										<a href="#" class="info"> 0 원
											<span class="date">소멸 예정 0 원</span>
										</a>
									</div>
								</li>
								<li class="user_coupon"><div class="link">
									<div class="tit">쿠폰	</div>
										<a href="#" class="info">1 개
										</a>
									</div>
								</li>
								<li class="user_kurlypass"><div class="link">
										<div class="tit">컬리패스</div>
										<a href="#" class="info info_link">	알아보기 
										</a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				
				<div id="snb" class="snb_cc">
					<h2 class="tit_snb">마이컬리</h2>
					<div class="inner_snb">
						<ul class="list_menu">
							<li class="on"><a href="/consumerBoard/cboard">주문내역</a></li>
							<li><a href="/consumerBoard/shipping">배송지 관리</a></li>
							<li><a href="/consumerBoard/alwaysLiving">늘 사는 것</a></li>
							<li><a href="/consumerBoard/goodsReview">상품 후기</a></li>
							<li><a href="/consumerBoard/savings">적립금</a></li>
							<li><a href="/consumerBoard/coupon">쿠폰</a></li>
							<li><a href="/consumerBoard/memberUpdate">개인 정보 수정</a></li>
						</ul>
					</div>
				</div>
				<div class="page_section">
					<div class="head_aticle Jline">
						<h2 class="tit Jlineheader">
							주문내역 <span class="tit_sub">지난 3년간의 주문 내역 조희가 가능합니다</span>
						</h2>
					</div>
					<div>
						<ul class="JlineUl">
							<li>
								<div class="Jdate">ex)2021.02.05 (10시 45분)</div>
								<div class="Jgoods">
									<div class="JgoodsName">
										<a class="Jgoodsname">ex)[택배배송] 제주 삼다수 2종 외4건</a>
									</div>
									<div class="order_info">
										<div class="goodsImg">
											<img alt="상품이미지" src="">
										</div>
										<div class="Jex">
											<dl>
												<dt>주문번호</dt>
												<dd>ex)1561651651</dd>
											</dl>
											<dl>
												<dt>결제금액</dt>
												<dd>ex)10,999</dd>
											</dl>
											<dl>
												<dt>주문상태</dt>
												<dd class="order_end">배송완료</dd>
											</dl>
										</div>
									</div>
									<div class="order_status">
										<span class="inner_status">
											<a class="link">1:1문의</a>
										</span>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />
</body>
</html>