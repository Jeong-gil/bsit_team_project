<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%-- head ����Ʈ ���� --%>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>�����ø� :: ������ �庸��, �����ø�</title>
    <style>
        .section_login {
            width: 340px;
            margin: 0 auto;
            padding-top: 100px;
            padding-bottom: 100px;
            letter-spacing: -.6px;
        }

        .html,
        .body {
            height: 100%;
        }

        .section_login .tit_login {
            font-weight: 800;
            font-size: 20px;
            line-height: 40px;
            text-align: center;
            padding-bottom: 20px;
        }

        .section_login .login_search {
            float: right;
            padding-top: 10px;
        }

        .section_login .login_view {
            text-align: center;
        }

        .section_login .checkbox_save {
            overflow: hidden;
            padding-bottom: 28px;
        }

        label {
            cursor: default;
        }

        .section_login input[type=number],
        .section_login input[type=text],
        .section_login input[type=password] {
            width: 100%;
            height: 47px;
            padding: 0 19px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: #fff;
            font-size: 14px;
            line-height: 20px;
            outline: none;
        }

        .section_login [name=password],
        .section_login [name=srch_id] {
            margin-top: 10px;
        }

        .section_login * {
            font-family: noto sans;
            color: #333;
        }

        .section_login .checkbox_save .label_checkbox {
            float: left;
            margin-top: 7px;
        }



        #bar {
            color: #333333;
            font-size: 10;
        }

        body,
        input,
        select,
        textarea,
        button {
            font-family: noto sans, malgun gothic, AppleGothic, dotum;
            line-height: 1;
            letter-spacing: -.05em;
            color: #4c4c4c;
            font-size: 12px;
            max-width: 100%;
        }

        .btn_type1 {
            border: 1px solid#ea97ad;
            background-color: #ea97ad;

        }

        .btn_type1,
        .btn_type2 {
            display: block;
            overflow: hidden;
            width: 100%;
            height: 47px;
            border-radius: 3px;
            font-size: 0;
            text-align: center;
        }

        .btn_type2 {
            border: 1px solid #ea97ad;
            background-color: #fff;
        }

        .btn_type1 .txt_type,
        .btn_type2 .txt_type {
            display: inline-block;
            height: 100%;
            font-weight: 500;
            font-size: 16px;
            color: #fff;
            line-height: 44px;
            text-align: center;
            width: 100%;
        }

        .section_login .btn_member {
            margin-top: 10px;
        }

        .btn_type2 .txt_type {
            color: #ea97ad;
        }
    </style>
</head>

<body>
    <div id="content">
        <div id="qnb" class="quick-navigation">
        </div>
        <div class="section_login">
            <h3 class="tit_login">�α���</h3>
            <div class="write_form">
                <div class="write_vew login_view">
                    <form method="POST" name="form" id="form" action="/member/login">
                        <input type="text" name="m_id" size="20" tabindex="1" value placeholder="���̵��Է����ּ���">
                        <input type="password" name="password" size="20" tabindex="2" value placeholder="��й�ȣ���Է����ּ���">
                        <div class="checkbox_save">
                            <label class="label_checkbox checked">
                                <input type="checkbox" id="chk_security" name="chk_security" value="y">
                                �α�������
                            </label>
                            <div class="login_search">
                                <a href="#" class="link">���̵� ã��</a>
                                <span id="bar">|</span>
                                <a href="#" class="link">��й�ȣ ã��</a>
                            </div>
                        </div>
                        <button type="submit" class="btn_type1">
                            <span class="txt_type">�α���</span>
                        </button>
                    </form>
                    <a href="#" class="btn_type2 btn_member">
                        <span class="txt_type">ȸ������</span>
                    </a>


                </div>
            </div>
        </div>
    </div>
 <%-- footer ���� --%>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />

</body>
</html>