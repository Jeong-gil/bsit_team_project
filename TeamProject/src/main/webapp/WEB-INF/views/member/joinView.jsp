<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%-- head 컨텐트 영역 --%>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="Jolly_Logo.png">
    <link rel="stylesheet" href="/css/joinView.css" type="text/css">
    <title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>

</head>
<body class="member_join">
    <div id="main">
        <div id="content">
            <div class="page_aticle">
                <div class="type_form member_join ">
                    <form id="form"action="/member/joinView" method="post" name="frm" id="form">
                        <div class="field_head">
                            <h3 class="tit">회원가입</h3>
                            <p class="sub1"><span class="ico">*</span>필수입력사항</p>
                        </div>
                    <table class="tbl_comm">
                        <tbody>
                            <tr id="idTr">
                                <th class="fst">
                                    아이디
                                    <span class="ico">*</span>
                                </th>
                                <td>
                                    <input type="text" name="id" maxlength="16"placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" id="left" v-model="inputIdVal" required>
                                    <a href="#"class="btn default" v-on:click="idDupChk($event)">중복확인</a><br>
                                	<input type="hidden" name="checked_id" value=""> <!-- 제대로 중복확인 되면 y가 들어옴 -->
                                    <span id="idvalChk"></span><br>
                                    <span id="idDubChk"></span>
                                   
                                </td>
                            </tr>
                            
                            <tr>
                                <th>
                                    비밀번호
                                    <span class="ico">*</span>
                                </th>
                                <td id="pwChkTd">
                                    <input type="password" name="pw" maxlength="16" placeholder="비밀번호를 입력해주세요" v-model="inputPw" required>
                                    <input type="hidden" name="checked_pw" value=""><br>	<!-- 제대로 비번 입력되면 y가 들어옴 -->
                                    {{ pwLengthChk }}
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    비밀번호확인
                                    <span class="ico">*</span>
                                </th>
                                <td id="rePwChkTd">
                                    <input type="password" name="re_pw" maxlength="16" placeholder="비밀번호를 한번 더 입력해주세요" v-model="inputRePw" required><br>
                                    {{ pwEqualChk }}    
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    이름
                                    <span class="ico">*</span>
                                </th>
                                <td>
                                    <input type="text" name="name" value maxlength="16" required placeholder="이름을 입력해주세요">
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    이메일
                                    <span class="ico">*</span>
                                </th>
                                <td>
                                    <input type="text" name="email" maxlength="16" required placeholder="예: marketkurly@kurly.com">
                                    <a href="#"class="btn default">중복확인</a>
                                    <!--중복확인 경고 글-->
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    휴대폰
                                    <span class="ico">*</span>
                                </th>
                                <td>
                                    <input type="text" name="tel" maxlength="16" required placeholder="숫자만 입력해주세요">
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    주소
                                    <span class="ico">*</span>
                                </th>
                                <td>
                                    <a href="#"id="addressSearch">
                                    <span id="addressNo">주소 검색</span>
                                    </a><br>
                                    <span id="span_text">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
                                    <input type="hidden" name="address"><!-- 입력한 주소가 입력됨 -->
                                </td>
                            </tr>

                            <tr class="select_sex">
                                <th>성별</th>
                                <td>
                                <!-- 라디오버튼 값받기 알아본 후 name 붙이기 -->
                                    <label class>
                                        <input type="radio" name="gender" value="남"><span class="ico"></span>남자
                                    </label>
                                    <label class>
                                        <input type="radio" name="gender" value="여"><span class="ico"></span>여자
                                    </label>
                                    <label class="checked">
                                        <input type="radio" name="gender"value="X"><span class="ico"></span>선택안함
                                    </label>
                                </td>
                            </tr>
                            <tr class="birth field_birth">
                                <th>생년월일</th>
                                <td>
                                    <div class="birth_day">
                                        <input type="text" name="birthday" maxlength="8" placeholder="예) 19920411">
<!--                                         <span class="bar"></span> -->
<!--                                         <input type="text"size="2" maxlength="2" placeholder="MM"> -->
<!--                                         <span class="bar"></span> -->
<!--                                         <input type="text"size="2" maxlength="2" placeholder="DD"> -->
                                    </div>
                                </td>
                            </tr>
                            <tr class="route" id="selectRecommend">
                                <th>추가입력 사항</th>
                                <td>
                                    <div class="group_radio">
                                        <span class="radio_wrapper">
                                            <label class>
                                                <input type="radio" name="recommend">
                                                <span class="ico"></span>
                                                추천인 아이디
                                            </label>
                                        </span>
                                        <span class="radio_wrapper">
                                            <label class="checked">
                                                <input type="radio" name="recommend">
                                                <span class="ico"></span>
                                                참여 이벤트명
                                            </label>
                                        </span>
                                    </div>
                                    <div class="input_wrapper" selected>
                                        <input type="text" name="push" class="inp" placeholder=" 추천인 아이디를 입력하세요." id="ex2">
                                        <p class="span_text">
                                            추천인 아이디와 이벤트명 중 하나만 선택 가능합니다.<br>
                                            가입 이후, 수정이 불가합니다.<br>
                                            대소문자 및 띄어쓰기에 유의해주세요.
                                        </p>
                                    </div>
                                </td>
                            </tr>
                            <tr class="reg_agree">
                                <th>이용약관동의<span class="ico">*</span></th>
                                <td>
                                    <div class="check">
                                        <label class="check_agree label_all_check label_block">
                                            <input type="checkbox"id="allcheck">
                                            <span class="ico"></span>
                                            전체 동의합니다.
                                        </label>
                                        <p class="sub1">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</p>
                                    </div>
                                    <div class="check_view">
                                        <label class="check_agree label_block">
                                            <input type="checkbox" name="chk">
                                            <span class="ico"></span>
                                            이용약관 동의 
                                            <span class="sub1">(필수)</span>
                                        </label>
                                    </div>
                                    <div class="check_view">
                                        <label class="check_agree label_block">
                                            <input type="checkbox" name="chk">
                                            <span class="ico"></span>개인정보처리방침 동의 <span class="sub1">(필수)</span>
                                        </label>
                                        
                                    </div>
                                    <div class="check_view">
                                        <input type="hidden" id="consentHidden" name="consent[1]" value="n">
                                        <label class="check_agree label_block">
                                            <input type="checkbox"name="chk">
                                            <span class="ico"></span>개인정보처리방침 동의 <span class="sub1">(선택)</span>
                                        </label>
                                        
                                    </div>
                                    <div class="check_view">
                                        <label class="label_block check_agree ">
                                            <input type="checkbox" name="chk">
                                            <span class="ico"></span>무료배송, 할인쿠폰 등 혜택/정보 수신 동의 <span class="sub1">(선택)</span>
                                        </label>
                                        <div class="check_event email_sms">
                                            <label class="label_block check_agree ">
                                                <input type="checkbox" name="chk">
                                                <span class="ico"></span>SMS
                                            </label>
                                            <label class="label_block check_agree ">
                                                <input type="checkbox" name="chk">
                                                <span class="ico"></span>이메일
                                            </label>
                                        </div>
                                        <p class="sms_info">
                                            동의 시 한 달간 [5% 적립] + [무제한 무료배송] <span class="sub1">(첫 주문 후 적용)</span>
                                        </p>
                                    </div>
                                    <div class="check_view">
                                        <label class=" check_agree label_block">
                                            <input type="checkbox" name="chk">
                                            <span class="ico"></span>본인은 만 14세 이상입니다. <span class="sub1">(필수)</span>
                                        </label>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="formsubmit" class="form_footer">
                        <input type="button" class="btn active btn_join"style='cursor:pointer;'  id="btnSubmit" value="가입하기"/>
                      
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
    <script src="../js/jquery-3.5.1.js"></script>
    

    <script>
    
    new Vue({
    	el:'#main',
    	data:{
            inputIdVal: '',	// id입력 벨류
            inputPw: '',	// 비번1 입력 벨류
            inputRePw: ''	// 비밀2 입력 벨류
            
        },
        computed:{
        	
        	
        	pwLengthChk: function () {
        		
        		let pwLength = '';
        		
        		if(this.inputPw.length == 0){
        			pwLength = '※ 4자 이상 입력하세요';
        			
        			return pwLength;
        		} else {
        			
        			if(this.inputPw.length < 4){
        				
        				pwLength = 'X 4자 이상 입력되지 않았습니다.';
            			$("#pwChkTd").css('color', 'red');
            			return pwLength;
        				
        			} else {
        				pwLength = 'O 4자 이상 입력 되었습니다.';
            			$("#pwChkTd").css('color', 'green');
            			return pwLength;
        			}
        			
        		}
        	},
        	
        	pwEqualChk: function () { // 댓글입력 남은 글자수
        		
        		let pwChkSuc= '';
        	
        	if(this.inputPw == ''){
        		
        		pwChkSuc= '※ 동일한 비밀번호를 입력해주세요';
        		$("#rePwChkTd").css('color', 'green');
        		return pwChkSuc;
        		
        	} else {
        		
        		if (this.inputPw != this.inputRePw){
					pwChkSuc = 'X 동일한 비밀번호를 입력해주세요.';
					$("#rePwChkTd").css('color', 'red');
					$('input[name="checked_pw"]').val('');
					return pwChkSuc;
					
				} else {
					
					pwChkSuc = 'O 동일한 비밀번호가 입력되었습니다.';
					$("#rePwChkTd").css('color', 'green');
					$('input[name="checked_pw"]').val('y');
					return pwChkSuc;
				}
        	}

			}
        },
    	methods:{
    		
    		idDupChk: function (event) {
    			
    			event.preventDefault(); // 스크롤바 이동 방지
    		
    			if(this.inputIdVal.length < 4 || this.inputIdVal.length == null){
    				alert('아이디를 4자 이상 입력하세요.');
    				return false;
    				
    			}; // if문

    			let id = this.inputIdVal;

    			$.ajax({ 
    				url: '/member/ajax/idDupChk',
					data: {id : id},
					success: function (response) {
						console.log(typeof response);
						console.log(response);
			
						if (response.isIdDup) {
							$('span#idDubChk').html('X 이미 사용중인 아이디 입니다.').css('color', 'red');
						} else {
							$('span#idDubChk').html('O 사용 가능한 아이디 입니다.').css('color', 'green');
							$('input[name="checked_id"]').val('y');
						}
					},
					error: function(){
						alert('중복확인 실패...');
					}
					
    			});// ajax
    		}, // idDubChk
    		
    		pwCheck: function () {
    			
    		}
    	} //methods

    }); // new Vue
    
    
 
    
    </script>
    
    <script>
  
    // 체크박스 전체 채우기
    
        $(document).ready(function(){
    //최상단 체크박스 클릭
    $("#allcheck").click(function () {
                //클릭되었으면
                if ($("#allcheck").prop("checked")) {
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
                    $("input[name=chk]").prop("checked", true);
                    //클릭이 안되있으면
                } else {
                    //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
                    $("input[name=chk]").prop("checked", false);
                }
            })
        });

        // id 4자 이상 입력 검사.
        $('input[name="id"]').focus(function() {
        	
        	if ($("input[name='checked_id']").val()==''){
        		
            	$('span#idvalChk').text('※ 4자 이상의 영문 혹은 영문과 숫자를 조합').css('color', '#666');
            	$('span#idDubChk').text('※ 아이디 중복확인').css('color', '#666');

        	}
        
        	 // propertychange chang keyup paste 입력 실시간 감지 하여 4자 이상 검사
            $("#left").on("propertychange chang keyup paste",function() {
            	let id = $('input[name="id"]').val().length;
            	
            	$('span#idDubChk').html('X 아이디 중복확인을 하세요.').css('color', 'red');
        		$('input[name="checked_id"]').val('');
            	
            	if(id<4){
            		$('span#idvalChk').text('X 4자 이상의 영문 혹은 영문과 숫자를 조합').css('color', 'red');
            	} else{
            		$('span#idvalChk').text('O 4자 이상의 영문 혹은 영문과 숫자를 조합').css('color', 'green');
            	}
            	
        	});
        	 
		});

    </script>
  </body>
</html>
    
<%--      footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />

