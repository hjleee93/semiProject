<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp"%> --%>
<%
	String storeName = (String) request.getAttribute("storeName");
	String storeContent = (String) request.getAttribute("storeContent");
%>

<!-- 임시 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>HYOLO</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 	카카오맵API추가 20/09/09 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f450544bd9053c96d7b9a97ececcb59a&libraries=services,clusterer,drawing"></script>


<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/modern-business.css"
	type="text/css">



<!-- 커스텀 css 추가 -->
<link href="<%=request.getContextPath()%>/css/mainCustom.css"
	rel="stylesheet">

<!-- 폰트 -->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">

<!-- datepicker -->

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />


<!-- 로그인, 회원가입  -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/login-register.js"></script>
<link href="<%=request.getContextPath()%>/css/login-register.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<script src="<%=request.getContextPath()%>/js/bootstrap.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/login-register.js"
	type="text/javascript"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap"
	rel="stylesheet">


<!-- 다음 주소 api  -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 임시끝 -->

<style>
li[id="information"] {
	list-style: none;
	display: inline;
	margin-right: 10%;
	font-size: 20px;
	background-color: royalblue;
	color: white;
}

span[id="counting"] {
	color: royalblue;
	margin: 5px;
}

span[id="counting1"] {
	color: royalblue;
	margin: 5px;
}

span[id="counting3"] {
	color: royalblue;
	margin: 5px;
}

textarea[id="source"] {
	width: 100%;
	resize: none;
}

#apply, #cancel {
	border: 0;
	background-color: unset;
	color: white;
}

input[id="cancel"] {
	margin-left: 1700px;
}

input[id="minbook"] {
	height: 30px;
}

input[id="maxbook"] {
	height: 30px;
}

.board-view-btn {
	margin: 40px 0 80px 0;
	-ms-display: flexbox;
	display: flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	justify-content: flex-end;
	align-items: center;
	width: 100%;
	height: auto;
}

.board-view-btn input {
	margin-left: 5px;
	-ms-display: flexbox;
	display: flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	cursor: pointer;
	justify-content: center;
	align-items: center;
	width: 60px;
	height: 30px;
	overflow: hidden;
	font-size: 16px;
	color: #000;
	border: 1px solid #ddd;
}

.board-view-btn input:hover {
	text-decoration: underline;
}

.board-view-btn input.gray {
	background: #666666;
	border-color: #666666;
	color: #fff;
}

.board-view-btn input.blue {
	background: #107bb3;
	border-color: #107bb3;
	color: #fff;
}

.rsvtitle {
	width: 150px;
}

.imgdtl {
	font-size: 12px;
}

.stepmenu {
	height: 70px;
	width: 100%;
	border-radius: 5px;
	margin-bottom: 20px;
}

.stepmenu td {
	text-align: center;
	background-color: #e4e4e4;
	margin-left: 20px;
}

.rsvtype {
	margin-bottom: 20px;
	padding-top: 20px;
	padding-bottom: 20px;
	background-color: #d5d5d5;
	text-align: center;
	font-weight: bold;
	border-radius: 5px;
}

.rsvlayout {
	border: 1px solid #d5d5d5;
	border-radius: 5px
}

.rsvlayout div {
	padding: 0 0;
}

#abc {
	color: red;
}

table tr:not (:last-child ){
	border-bottom: 1px solid #ededed;
}

table tr td {
	padding: 10px 5px;
}

p {
	margin-bottom: 0;
}

#right {
	font-size: 12px;
}

#td2 {
	border: 1px white;
	text-align: center;
	background-color: royalblue;
	color: white;
	margin-left: 20px;
}

.preview-img {
	width: 100%;
	margin-left: 0px;
}
</style>

<!-- TODO:css 정리해야됨 -->
<div class="container">

	<form action="<%=request.getContextPath()%>/store/storeInfoUpdate"
		name="uploadFile" method="post" enctype="multipart/form-data">

		<div class="rsvlayout">
			<p class="rsvtype">서비스 할 업체 상세 이미지를 업로드 해주세요.</p>

			<div>

				<table>
					 <tr>
                        <td>
                           <p>서비스를 제공할 업체를 선택하세요</p>
                        </td>
                        <td>
                            <select id="selectedStore" name="selectedStore" >
                                <option>등록된 업체이름1</option>
                                <option>등록된 업체이름2</option>
                        </select>
                        </td>
                    </tr>
				
				
					<colgroup>
						<col style="width: 20%;">
						<col style="width: auto;">
						<col style="width: 13%;">
					</colgroup>

					<tr id="secondRow">
						<td class="rsvtitle">대표이미지<span id="abc">*</span>
							<p class="imgdtl">(최대50MB,1900*1080권장)</p>
						</td>
						<td><input type="file" name="mainImg" id="image"
							accept="image/*" onchange="setThumbnail(event);" />
							<div>
								<div id="image_container1">
									<img class="card-img-top" src="http://placehold.it/1900x1080" style="width:50% !important;">
								</div>
								
							</div>
							
							</td>

						<td>미리보기</td>
					</tr>
					<tr>
					<td>홍보문구<br>메인페이지에 홍보 문구로 들어갑니다.</td>
					<td><input type="text"></td>
					</tr>
					<tr>
						<td class="rsvtitle">예약상품 이미지
							<p class="imgdtl">최대(20MB,700*400권장)</p>
						</td>


						<td><input type="file" id="image2" name="postImg" accept="image/*"
							onchange="setThumbnail2(event);" />
						

							<div>
								<div id="image_container2">
									<img class="card-img-top" src="http://placehold.it/700x400" style="width:50% !important;">
								</div>
								
							</div>
						</td>
						<td>미리보기</td>
					</tr>
					<tr>
						<td class="rsvtitle">상세페이지 이미지
							<p class="imgdtl">(최대 20MB,750*500권장)</p>
						</td>
						<td><input type="file" id="image3" name="detailImg" accept="image/*"
							onchange="setThumbnail3(event);" />
							
							<div>
								<div id="image_container3">
									<img class="card-img-top" src="http://placehold.it/750x500" style="width:50% !important;">
								</div>
								
							</div>
							</td>
							<td><a href="">미리보기</a></td>
					</tr>

				</table>
			</div>



		</div>
		<div class="board-view-btn">
			<input type="reset" class="gray" value="이전" title="previous"
				onclick="cancel_event()">
			<input type="submit" class="blue" value="다음" title="next" id="nextBtn">
		</div>
	</form>
</div>

<script type="text/javascript">


$('#nextBtn').click(function(){
	$.ajax({
		url:"<%=request.getContextPath()%>/store/storeInfoUpdate",
		type:"post",
		dataType:"html",
		success: data => {
			console.log("ajax 서버 연결"); 
			//$("#secondRow").html(data);
		}
	});
	
	
});

// 		$.ajax({
<%-- 			url:"<%=request.getContextPath()%>/store/storeInfoUpdate", --%>
// 			type:"post",
// 			dataType:"html",
// 			success: data => {
// 				console.log("ajax 서버 연결"); //TODO:데이터는 controller에서 받아오기
// 				//$("#secondRow").html(data);
// 			}
// 		});




	function counter() {
		document.getElementById("counting").innerHTML = document
				.getElementById("naming").value.length;
	}

	function counter1() {
		document.getElementById("counting1").innerHTML = document
				.getElementById("source").value.length;
	}

	function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			$("#image_container1 img").remove();
			img.setAttribute("width", "1900");
			img.setAttribute("height", "1080");
			document.querySelector("div#image_container1").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	function setThumbnail2(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			$("#image_container2 img").remove();
			img.setAttribute("width", "700");
			img.setAttribute("height", "400");
			document.querySelector("div#image_container2").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}

	function setThumbnail3(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			$("#image_container3 img").remove();
			img.setAttribute("width", "750");
			img.setAttribute("height", "500");
			document.querySelector("div#image_container3")
					.appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<%@ include file="/views/common/footer.jsp"%>