<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- head 컨텐트 영역 --%>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/css/bootStrap/bootstrap.min.css" rel="stylesheet">
<link href="/css/bootStrap/kfonts2.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.btnSubmit {
	display: block;
	background-color: #ffffff;
	border: 1px solid #ea97ad;
	color: #ea97ad;
	border-radius: 3px;
	text-align: center;
	width: 200px;
	margin: 30px;
	padding: 20px 20px 20px 20px;
	font-size: 14px;
}

.imgBtn {
	border: dotted 3px;
	width: 100px;
	height: 100px;
	color: #ea97ad;
	text-align: center;
	padding: 40px 10px 10px 10px;
	cursor: pointer;
	margin: 0px auto;
}

.imgBox {
	width: 600px;
	height: 650px;
	border: solid 1px;
	color: #ea97ad;
	padding-top: 270px;
}

.container-fluid {
	min-height: calc(100vh - 136px);
	display: inline;
}

.select_box {
	width: 200px;
	padding: .8em .5em;
	font-family: inherit;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 1px solid #999;
	border-radius: 0px;
}

.select_box::-ms-expand {
	/* for IE 11 */
	display: none;
}
</style>

</head>

<body style="padding: 0px 200px;">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/js/bootstrap.min.js"></script>
	<script>
        function fnMove(seq) {
            var offset = $("#t" + seq).offset();
            $('html, body').animate({ scrollTop: offset.top }, 400);
        }
    </script>

	<form action="/goods/writer" method="post" id="app"
		enctype="multipart/form-data" name="frm">
		<br> <br> <br> <br>
		<div style="width: 300px; margin: auto;">
			<h2>상품 등록 페이지</h2>
		</div>

		<div class="container-fluid">
			<!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
				<div class="panel panel-default">
					<div class="panel-heading" role="tab">
						<a role="button" id="category_a" data-toggle="collapse"
							data-parent="#accordion" href="#collapse1" aria-expanded="false"
							class="category_Atag" style="color: #ea97ad;"> 카테고리 </a>
					</div>
					<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
						<div class="panel-body">
							<span>카테고리를 선택해주세요.</span><br>
							<br> <select class="select_box" name="mainCategory"
								v-model="selected1" v-on:change="selectedMethod">
								<option value="채소">채소</option>
								<option value="육류">육류</option>
								<option value="해산물">해산물</option>
							</select> <select class="select_box" name="subCategory"
								v-model="selected2">
								<option v-for="option in options" v-bind:value="option.value">
									{{ option.text }}</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row" style="min-width: 1300px;">
			<div class="col-lg-5" style="padding-top: 100px">
				<input type=file name="filename1" @change="onFileChange"> <img
					v-if="url" :src="url"
					style="width: 500px; height: 650px; object-fit: cover;" />
			</div>
			<div class="col-lg-7" style="padding-top: 100px">
				<table class="table">
					<tr>
						<th scope="col" colspan="2"><input type="text"
							style="font-size: 32px;" name="goodsName"
							placeholder="ex) 말린 감귤 / goods_name"><br> <input
							type="text" style="font-size: 16px;" name="subGoods"
							placeholder="ex) 말린 감귤 / sub_goods"><br> <input
							type="number" style="font-size: 34px;" name="salePrice"
							placeholder="ex) 1900 sale_price"><span
							style="font-size: 20px;">원</span><br> <span
							style="color: #5f0080; font-size: 16px;">로그인 후, 적립혜택이
								제공됩니다.</span><br>
						<br></th>
					</tr>
					<tr>
						<th scope="row"
							style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
							판매단위<br>
						<br> 중량/용량
						</th>
						<th style="font-size: 16px; padding: 25px 0px;"><input
							type="text" name="salesUnit" placeholder="ex) 1팩 / sales_unit"><br>
						<br> <input type="text" name="volume"
							placeholder="ex) 300g / volume"></th>
					</tr>
					<tr>
						<th scope="row"
							style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
							배송구분</th>
						<th style="font-size: 16px; padding: 25px 0px;"><input
							type="text" name="delClassification"
							placeholder="ex) 샛별배송/택배배송 / del_classification"
							style="width: 300px;"></th>
					</tr>
					<tr>
						<th scope="row"
							style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
							포장타입<br>
						<br>
						</th>
						<th style="font-size: 16px; padding: 25px 0px;"><input
							type="text" name="packingType"
							placeholder="ex) 종이포장 / packing_type"><br> <span
							style="font-size: 14px; color: #666;">택배배송은 에코포장이 스티로폼으로
								대체됩니다.</span></th>
					</tr>
					<tr>
						<th scope="row"
							style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
							알레르기정보</th>
						<th style="font-size: 16px; padding: 25px 0px;"><input
							type="text" name="allergy" placeholder="ex) 대두함유 / allergy">
						</th>
					</tr>
					<tr>
						<th scope="row"
							style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
							유통기한<br>
						<br>
						</th>
						<th style="font-size: 16px; padding: 25px 0px;">출고일 기준, 유통기한
							만기 8일 이상 남은 상품을 보내드립니다.(총유통기<br> 한:<input type="text"
							name="shelfLife" placeholder="ex) 15일 / shelf_life">)
						</th>
					</tr>
				</table>
			</div>
		</div>
		<div class="container">
			<br> <br> <br> <br> <br> <br> <br>
			<br>
			<ul class="nav nav-tabs nav-justified" id="t1">
				<li class="active" onclick="fnMove('1')"><a href="#"
					onclick="return false;">메뉴1</a></li>
				<li onclick="fnMove('2')"><a href="#" onclick="return false;">메뉴2</a></li>
				<li onclick="fnMove('3')"><a href="#" onclick="return false;">메뉴3</a></li>
				<li onclick="fnMove('4')"><a href="#" onclick="return false;">메뉴4</a></li>
			</ul>
			<div style="background: aqua;">
				<!--            <textarea id="editor-body1" name="contents1" placeholder="내용" -->
				<!-- 				required="required"></textarea> -->
				<textarea name="contents1" id="editor1" rows="10" cols="80"> </textarea>

			</div>
		</div>
		<div class="container">
			<br> <br> <br> <br> <br> <br> <br>
			<br>
			<ul class="nav nav-tabs nav-justified" id="t2">
				<li onclick="fnMove('1')"><a href="#" onclick="return false;">메뉴1</a></li>
				<li class="active" onclick="fnMove('2')"><a href="#"
					onclick="return false;">메뉴2</a></li>
				<li onclick="fnMove('3')"><a href="#" onclick="return false;">메뉴3</a></li>
				<li onclick="fnMove('4')"><a href="#" onclick="return false;">메뉴4</a></li>
			</ul>
			<div style="background: black;">
				<!--             <textarea id="editor-body2" name="contents2" placeholder="내용" -->
				<!-- 				required="required"></textarea> -->
				<textarea name="contents2" id="editor2" rows="10" cols="80"> </textarea>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		<div style="width: 300px; margin: auto;">
			<input type="submit" value="등록" class="btnSubmit">
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
	</form>
	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />
	<!-- 	<script src="https://cdn.ckeditor.com/4.8.0/full-all/ckeditor.js"></script> -->
	<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>

	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>

	<script>
    
    new Vue({
    	el:'#app',
    	data:{
    		selected1: '',
    		selected2: '',
    			options: [],
    			options1: [
    				{ text:'배추', value: '배추'}, { text:'무', value: '무'}, { text:'상추', value: '상추'} 
    			],
    			options2: [
    				{ text:'돼지고기', value: '돼지고기' }, { text:'소고기', value: '소고기'}, { text:'말고기', value: '밀고기'}
    			],
    			options3: [
    				{ text:'개불', value: '개불'}, { text:'해삼', value: '해삼'}, { text:'광어', value: '광어'}
    			],
    			url: null
    	},
    	watch:{
    	
    	},
    	methods:{
    		
    		selectedMethod: function(){
    			
    			if(this.selected1 == '채소'){
    				this.options = this.options1
    				return;
    			}
    			
    			if(this.selected1 == '육류'){
    				this.options = this.options2
    				return;
    			}
    			
    			if(this.selected1 == '해산물'){
    				this.options = this.options3
    				return;
    			}
    			
    		},
    		
			onFileChange: function(e){
    			
    			const file = e.target.files[0];
    			this.url = URL.createObjectURL(file);
    			alert(this.url);
    			
    		}
    		    		  
    	} // methods	
    });	// Vue
    
    </script>

	<script>
    
//     CKEDITOR.replace( 'editor1', {height: 500}, {filebrowserUploadUrl:'/mine/imageUpload.do'});
//     CKEDITOR.replace( 'editor2', {height: 500});

	$(function(){
		CKEDITOR.replace('editor1',{
			filebrowserUploadUrl: '/goods/ckUpload'
		});
	});
	
	$(function(){
		CKEDITOR.replace('editor2',{
			filebrowserUploadUrl: '/goods/ckUpload'
		});
	});
  
    </script>


</body>
</html>
