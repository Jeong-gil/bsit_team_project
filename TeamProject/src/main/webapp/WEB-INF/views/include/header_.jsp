<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("id")) {
			String id = cookie.getValue();
			
			// �α��� ���� ó��(���ǿ� id�� �߰�)
			session.setAttribute("id", id);
		}
	}
}

String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/style2.css">
  <title>�����ø� :: ������ �庸��, �����ø�</title>
  <script src="https://kit.fontawesome.com/d6fd3b6ecc.js" crossorigin="anonymous"></script>
  <link rel="shortcut icon" href="/images/jolly-pavi.png">

</head>
<body>
  <header>
    <div id="header">
      <div id="userMenu">
        <ul class="list_menu">
          <c:choose>
          	<c:when test="${ not empty sessionScope.id }">
          	  <li class="menu none_sub menu_join">
	            ${ sessionScope.id }�� ȯ���մϴ�
	          </li>
	          <li>
                <a href="/member/logout">�α׾ƿ�</a>
              </li>
          	</c:when>
          	<c:otherwise>
          	  <li class="menu none_sub menu_join">
	            <a href="/member/joinView" class="link_menu">ȸ������</a>
	          </li>
	          <li class="menu none_sub"><a href="/member/login" class="link_menu">�α���</a>
	          </li>
	          <!---->
	          <li class="menu lst">
	
	            <a href="/shop/board/list.php?id=notice" class="link_menu">�����͡�</a>
	            <ul class="sub">
	              <li>
	                <a href="/shop/board/list.php?id=notice">��������</a>
	              </li>
	              <li>
	                <a href="/shop/service/faq.php">�����ϴ� ����</a>
	              </li>
	              <li>
	                <a href="/shop/mypage/mypage_qna.php">1:1 ����</a>
	              </li>
	              <!---->
	              <li>
	                <a href="/shop/mypage/offer.php">��ǰ ����</a>
	              </li>
	              <li>
	                <a href="/shop/mypage/echo_packing.php">�������� �ǵ��</a>
	              </li>
	            </ul>
	          </li>
          	</c:otherwise>
          </c:choose>
        </ul>
      </div>
      <div id="headerLogo" class="layout-wrapper">
        <h1 class="logo">
          <a href="/" class="link_main">
            <span id="gnbLogoContainer"></span>
            <img src="/images/jolly-main.png" alt="��������� �ΰ�" style="display: block; width: 120px; height: 120px;">
          </a>
        </h1>
      </div>
      <div id="gnb">
        <h2 class="screen_out">�޴�</h2>
        <div id="gnbMenu" class="gnb_kurly">
          <div class="inner_gnbkurly">
            <div class="gnb_main">
              <div class="gnb_mainul">
                <ul class="gnb">
                  <li class="menu1">
                    <!-- <div class="dropdown"> -->
                    <a href="#none" style="width: 168px; padding-left: 19px;">
                      <span class="ico"></span>
                      <span class="txt">��ü ī�װ�</span></a>

                    <ul class="ksub_menu">
                      <li><a href="#">�񸰳� ���� ����</a>
                        <ul class="kssub">
                          <li><a href="#">��ǰ��1</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                        </ul>
                      </li>
                      <li><a href="#">������ ����</a>
                        <ul class="kssub">
                          <li><a href="#">��ǰ��2</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                        </ul>
                      </li>
                      <li><a href="#">������ ������ ȸ</a>
                        <ul class="kssub">
                          <li><a href="#">��ǰ��3</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                        </ul>
                      </li>
                      <li><a href="#">�ұݹ�</a>
                        <ul class="kssub">
                          <li><a href="#">��ǰ��4</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                        </ul>
                      </li>
                      <li><a href="#">�߰ſ� ����</a>
                        <ul class="kssub">
                          <li><a href="#">��ǰ��5</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                          <li><a href="#">��ǰ��</a></li>
                        </ul>
                      </li>

                    </ul>

                  </li>
                  <li>
                    <a href="/goods/allGoods" class="link new ">
                      <span class="txt">�Ż�ǰ</span>
                    </a>
                  </li>
                  <li>
                    <a href="#" class="link best ">
                      <span class="txt">����Ʈ</span>
                    </a>
                  </li>
                  <li>
                    <a href="#" class="link bargain ">
                      <span class="txt">�˶����</span>
                    </a>
                  </li>
                  <li class="lst">
                    <a href="#" class="link event ">
                      <span class="txt">��������</span>
                    </a>
                  </li>
                </ul>
              </div>
              <div id="side_search" class="gnb_search">
                <form action="/shop/goods/goods_search.php?&amp;" onsubmit="return searchTracking(this)">
                  <input type="hidden" name="searched" value="Y">
                  <input type="hidden" name="log" value="1">
                  <input type="hidden" name="skey" value="all">
                  <input type="hidden" name="hid_pr_text" value="���ظ��� �ø� ��Ƽ �佺Ƽ��!">
                  <input type="hidden" name="hid_link_url"
                    value="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/2021/0114/beauty">
                  <input type="hidden" id="edit" name="edit" value="">
                  <input name="sword" type="text" id="sword" value="" required="required" label="�˻���"
                    class="inp_search">
                  <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png"
                    class="btn_search">
                  <div class="init">
                    <button type="button" id="searchInit" class="btn_delete">�˻�������ϱ�</button>
                  </div>
                </form>
              </div>
              <div class="cart_count">
                <div class="inner_cartcount">
                  <a href="/goods/cart" class="btn_cart">
                    <span class="screen_out">��ٱ���</span>
                    <span id="cart_item_count" class="num realtime_cartcount" style="display: none;"></span>
                  </a>
                </div>
                <div id="addMsgCart" class="msg_cart">
                  <span class="point"></span>
                  <div class="inner_msgcart">
                    <img src="https://res.kurly.com/images/common/bg_1_1.gif" alt="" class="thumb">
                    <p id="msgReaddedItem" class="desc"><span class="tit"></span>
                      <span class="txt"> ��ٱ��Ͽ� ��ǰ�� ��ҽ��ϴ�.
                        <span class="repeat">�̹� ������ ��ǰ�� �־� �߰��Ǿ����ϴ�.</span>
                      </span>
                    </p>
                  </div>
                </div>
              </div>
              <div class="location_set">
                <button type="button" class="btn_location on">����� �����ϱ�</button>
                <div class="layer_location">
                  <div class="no_address">
                    <span class="emph">������� ���</span>�ϰ�<br>
                    ���� ������ ��ǰ�� Ȯ���ϼ���!
                    <div class="group_button double">
                      <button type="button" class="btn default login">�α���</button>
                      <button type="button" class="btn active searchAddress">
                        <span class="ico"></span>�ּҰ˻�
                      </button>
                    </div>
                  </div>

                </div>
              </div>
            </div>
            <div class="gnb_sub" style="display: none; width: 219px;">
              <div class="inner_sub">

              </div>
            </div>
          </div>

        </div>

      </div>
    </div>
  </header>
</body>
</html>