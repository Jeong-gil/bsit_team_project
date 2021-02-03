<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("id")) {
			String id = cookie.getValue();
			
			// 로그인 인증 처리(세션에 id값 추가)
			session.setAttribute("id", id);
		}
	}
}

String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/header.css">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<script src="https://kit.fontawesome.com/d6fd3b6ecc.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/images/jolly-pavi.png">
</head>


<body>
	<header>
		<div id="header">
			<div id="userMenu">
				<ul class="list_menu">
					<li class="menu none_sub menu_join">
						<%if (name !=null){
             %> <span class="ico6">웰컴</span> <a href="#"
						class="link_menu"><%=name %> 님▼</a>
						<ul class="sub">
							<li><a href="/member/joinView">주문내역</a></li>
							<li><a href="#">배송지관리</a></li>
							<li><a href="#">늘 사는것</a></li>
							<!---->
							<li><a href="#">상품 후기 </a></li>
							<li><a href="#">적립금</a></li>
							<li><a href="#">쿠폰</a></li>
							<li><a href="#">개인 정보 수정</a></li>
							<li><a href="/member/logout">로그아웃</a></li>
						</ul> <%
  
           
           
           
           
          }else { 
             %> <a href="/member/joinView" class="link_menu">회원가입</a>
					</li>
					<li class="menu none_sub"><a href="/member/login"
						class="link_menu">로그인</a></li>
					<%
             
             
          }%>




					<li class="menu lst"><a href="/userBoard/jnotice"
						class="link_menu">고객센터▼</a>
						<ul class="sub">
							<li><a href="/userBoard/jnotice">공지사항</a></li>
							<li><a href="/shop/service/faq.php">자주하는 질문</a></li>
							<li><a href="/shop/mypage/mypage_qna.php">1:1 문의</a></li>
							<!---->
							<li><a href="/shop/mypage/offer.php">상품 제안</a></li>
							<li><a href="/shop/mypage/echo_packing.php">에코포장 피드백</a></li>
							<li><a href="/goods/writer">관리자 모드</a> <!-- 로그인 만들면 수정 --></li>
						</ul></li>
				</ul>
			</div>
			<div id="headerLogo" class="layout-wrapper">
				<h1 class="logo">
					<a href="/" class="link_main"> <span id="gnbLogoContainer"></span>
						<img src="/images/jolly-main.png" alt="졸리스토어 로고"
						style="display: block; margin-bottom: 40px; width: 120px; height: 120px;">
					</a>
				</h1>
			</div>
			<div id="gnb">
				<h2 class="screen_out">메뉴</h2>
				<div id="gnbMenu" class="gnb_kurly">
					<div class="inner_gnbkurly">
						<div class="gnb_main">
							<div class="gnb_mainul">
								<ul class="gnb">
									<li class="menu1">
										<!-- <div class="dropdown"> --> <a href="#none"
										style="width: 168px; padding-left: 19px;"> <span
											class="ico"></span> <span class="txt">전체 카테고리</span></a>

										<ul class="ksub_menu">
											<li><a href="#">비린내 나는 생선</a>
												<ul class="kssub">
													<li><a href="#">제품명1</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
												</ul></li>
											<li><a href="#">귀지맛 과자</a>
												<ul class="kssub">
													<li><a href="#">제품명2</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
												</ul></li>
											<li><a href="#">유전자 변형온 회</a>
												<ul class="kssub">
													<li><a href="#">제품명3</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
												</ul></li>
											<li><a href="#">소금물</a>
												<ul class="kssub">
													<li><a href="#">제품명4</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
												</ul></li>
											<li><a href="#">뜨거운 맥주</a>
												<ul class="kssub">
													<li><a href="#">제품명5</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
													<li><a href="#">제품명</a></li>
												</ul></li>

										</ul>

									</li>
									<li><a href="/goods/allGoods" class="link new "> <span class="txt">신상품</span>
									</a></li>
									<li><a href="#" class="link best "> <span class="txt">베스트</span>
									</a></li>
									<li><a href="#" class="link bargain "> <span
											class="txt">알뜰쇼핑</span>
									</a></li>
									<li class="lst"><a href="#" class="link event "> <span
											class="txt">금주혜택</span>
									</a></li>
								</ul>
							</div>
							<div id="side_search" class="gnb_search">
								<form action="/shop/goods/goods_search.php?&amp;"
									onsubmit="return searchTracking(this)">
									<input type="hidden" name="searched" value="Y"> <input
										type="hidden" name="log" value="1"> <input
										type="hidden" name="skey" value="all"> <input
										type="hidden" name="hid_pr_text" value="새해맞이 컬리 뷰티 페스티벌!">
									<input type="hidden" name="hid_link_url"
										value="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/2021/0114/beauty">
									<input type="hidden" id="edit" name="edit" value=""> <input
										name="sword" type="text" id="sword" value=""
										required="required" label="검색어" class="inp_search"> <input
										type="image"
										src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png"
										class="btn_search">
									<div class="init">
										<button type="button" id="searchInit" class="btn_delete">검색어삭제하기</button>
									</div>
								</form>
							</div>
							<div class="cart_count">
								<div class="inner_cartcount">
									<a href="/member/cart?id=${ id }" class="btn_cart"> <span
										class="screen_out">장바구니</span> <span id="cart_item_count"
										class="num realtime_cartcount" style="display: none;"></span>
									</a>
								</div>
								<div id="addMsgCart" class="msg_cart">
									<span class="point"></span>
									<div class="inner_msgcart">
										<img src="https://res.kurly.com/images/common/bg_1_1.gif"
											alt="" class="thumb">
										<p id="msgReaddedItem" class="desc">
											<span class="tit"></span> <span class="txt"> 장바구니에 상품을
												담았습니다. <span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span>
											</span>
										</p>
									</div>
								</div>
							</div>
							<div class="location_set">
								<button type="button" class="btn_location on">배송지 설정하기</button>
								<div class="layer_location">
									<div class="no_address">
										<span class="emph">배송지를 등록</span>하고<br> 구매 가능한 상품을 확인하세요!
										<div class="group_button double">
											<button type="button" class="btn default login">로그인</button>
											<button type="button" class="btn active searchAddress">
												<span class="ico"></span>주소검색
											</button>
										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="gnb_sub" style="display: none; width: 219px;">
							<div class="inner_sub"></div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</header>
</body>

</html>
</html>