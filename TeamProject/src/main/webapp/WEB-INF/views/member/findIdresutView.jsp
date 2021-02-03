<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- head 컨텐트 영역 --%>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">



</head>
<style>
.section_login .tit_login {
	font-weight: 800;
	font-size: 20px;
	line-height: 20px;
	text-align: center;
}

.section_login * {
	color: #333;
}

.section_login .find_view .desc {
	padding-bottom: 14px;
	font-weight: 700;
	font-size: 20px;
	color: #ea97ad;
	line-height: 29px;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.section_login {
	width: 340px;
	margin: 0 auto;
	padding-top: 90px;
	padding-bottom: 90px;
	letter-spacing: -.6px;
}

.btn_type1 {
	border: 1px solid #ea97ad;
	background-color: #ea97ad;
}

.btn_type1 {
	display: block;
	width: 100%;
	height: 54px;
	border-radius: 3px;
	text-align: center;
}

.section_login .find_view {
	padding-top: 26px;
	text-align: center;
}

.section_login .find_view .info {
	padding-bottom: 30px;
	font-size: 12px;
	color: #333;
	line-height: 18px;
}
</style>
<body>
	<div class="section_login">
		<h3 class="tit_login">아이디찾기</h3>
		<div class="write_form find_view">



			<p class="desc">

				고객님의 <br> 아이디 찾기가 완료되었습니다!
			<div>
				<i class="far fa-user"></i>
			</div>

			</p>
			<p class="info">아이디 :</p>
			<a href="/member/login" class="btn_type1"> <span class="txt_type">
					로그인 하기 </span>
			</a>
		</div>

	</div>

	</div>


	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />

</body>
</html>