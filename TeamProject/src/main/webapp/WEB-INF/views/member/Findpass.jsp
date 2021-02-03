<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.section_login {
	width: 340px;
	margin: 0 auto;
	padding-top: 90px;
	letter-spacing: -.6px;
}

.section_login .tit_login {
	font-weight: 800;
	font-size: 20px;
	line-height: 20px;
	text-align: center;
}

.section_login {
	font-family: noto sans;
	color: #333;
}

.section_login .find_view {
	padding-top: 26px;
	text-align: center;
}

.section_login .find_view .tit_label {
	display: block;
	padding: 11px 0 7px;
	font-size: 12px;
	line-height: 18px;
	text-align: left;
}

strong {
	font-weight: 700;
}

.section_login input[type=text] {
	width: 100%;
	height: 54px;
	padding: 0 19px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background-color: #fff;
	font-size: 14px;
	line-height: 20px;
	outline: none;
}

.section_login .find_view .btn_type1 {
	margin-top: 30px;
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
	font-size: 20;
	text-align: center;
}
</style>
</head>

<body>

	<div class="section_login">
		<h3 class="tit_login">비밀번호 찾기</h3>
		<div class="write_form find_view">
			<form method="get" id="form" name="fm" action="">
				<strong class="tit_label">이름</strong> <input name="such_name"
					type="text" size="29" required label="이름" tabindex="2"> <strong
					class="tit_label">아이디</strong> <input name="such_id" type="text"
					size="29" required label="아이디" tabindex="2">
				<p></p>
				<strong class="tit_label">이메일</strong> <input name="such_mail"
					type="text" size="29" required label="메일주소" tabindex="5">
				<p></p>
				<button type="submit" class="btn_type1">
					<span class="txt_type">찾기</span>

				</button>



			</form>


		</div>



	</div>

	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />
</body>
</html>