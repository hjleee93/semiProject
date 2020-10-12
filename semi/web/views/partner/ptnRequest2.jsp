<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	Store s = (Store) request.getAttribute("store");

System.out.println("s in jsp: " + s);
%>



<style>
.mptitle {
	margin: 50px;
}

.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
	margin: 50px;
}
p{
 font-family: 'JSDongkang-Regular';}
#image_container2, #image_container1, #image_container3 {
	text-align: center;
}

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
	/* width: 150px; */
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

table
 
tr
:not
 
(
:last-child
 
){
border-bottom
:
 
1
px
 
solid
 
#ededed
;


}


table tr td {
	padding: 10px 5px;
	/* height: 300px; */
	vertical-align:top;
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

.pre-img {
	width: 400px;
	height: 300px;
}

.pre-btn {
	margin-top: 20px;
	width: 84.39px;
	height: 30px;
	border: 1px solid #747272;
	border-radius: 2px;
}

@media (max-width:991px){

	table{display:block; width:100%; padding:0 2%;}
	table tr{display:block;}
	table tr td{display:block; width:100%;}
	textarea{width:100% !important;}
}
td{
 font-family: 'JSDongkang-Regular';
}

</style>


<div class="mptitle">
	<h1>업체 상세페이지 및 대표사진 등록하기</h1>
</div>
<div class="container">
<!-- 매핑값ok -->
	<form action="<%=request.getContextPath()%>/store/storeDetailUpdate"
		name="uploadFile" method="post" enctype="multipart/form-data">


		<input type="hidden" name="storeId" value="<%=s.getStoreId()%>">
		<div class="rsvlayout">
			<p class="rsvtype"><%=s.getStoreName()%>의 메인페이지에 업로드할 사진을 선택
				해주세요.
			</p>
			<div>

				<table>



					<colgroup>
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: auto;">
					</colgroup>

					<tr id="secondRow">
						<td class="rsvtitle">메인 페이지 이미지
							<p class="imgdtl">(최대50MB,1900*1080권장)</p>
						</td>
						<td><input type="file" name="mainImg" id="image"
							accept="image/*" onchange="setThumbnail(event);" />
							

						<td><div>
								<input type="hidden" name="storeName"
									value="<%=s.getStoreName()%>" /> <input type="hidden"
									name="storePhone" value="<%=s.getStorePhone()%>"> <input
									type="hidden" name="storePost" value="<%=s.getStorePost()%>">
								<input type="hidden" name="storeAddr"
									value="<%=s.getStoreAddress()%>"> <input type="hidden"
									name="storeDtlAddr" value="<%=s.getStoreDtlAddr()%>"> <input
									type="hidden" name="storeExtraAddr"
									value="<%=s.getStoreExtraAddr()%>"> <input
									type="hidden" name="storeContent" value="<%=s.getPtnNum()%>">
								<input type="hidden" name="ptnNum"
									value="<%=Memberloggined.getMemberNum()%>">
								<div id="image_container1">
									<img class="pre-img" src="http://placehold.it/1900x1080">
								</div>

							</div></td>
					</tr>
					<tr>
						<td>홍보 문구<br>
						<small>메인페이지 슬라이드에 홍보 문구로 들어갑니다.</small></td>
						<td colspan="2"><textarea name="promoText" id="promoText" cols="40"
								rows="5" style="width:90%; resize: none;"></textarea></td>
					</tr>
					<tr>
						<td class="rsvtitle">예약상품 카드 이미지<span id="abc">*</span>
							<p class="imgdtl">최대(20MB,700*400권장)</p>

						</td>


						<td><input type="file" id="image2" name="postImg"
							accept="image/*" onchange="setThumbnail2(event);" required />
							

						<td><div>
								<div id="image_container2">
									<img class="pre-img" src="http://placehold.it/700x400">
								</div>

							</div></td>
					</tr>
					<tr>
						<td class="rsvtitle">상세페이지 이미지
							<p class="imgdtl">(최대 20MB,750*500권장)</p>
						</td>
						<td><input type="file" id="image3" name="detailImg"
							accept="image/*" onchange="setThumbnail3(event);" />

							
						<td><div>
								<div id="image_container3">
									<img class="pre-img" src="http://placehold.it/750x500">
								</div>

							</div></td>
					</tr>



				</table>
			</div>
			<%
				System.out.println("s.getStoreId() : " + s.getStoreId());
			%>



		</div>
		<div class="board-view-btn">
			<input type="reset" class="gray" value="취소" title="previous"
				onclick="cancel_event()"> <input type="submit" class="blue"
				value="확인" title="next" id="nextBtn">
		</div>
	</form>
</div>

<script>
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
			img.setAttribute("width", "400");
			img.setAttribute("height", "300");
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
			img.setAttribute("width", "400");
			img.setAttribute("height", "300");
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
			img.setAttribute("width", "400");
			img.setAttribute("height", "300");
			document.querySelector("div#image_container3").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
<%@ include file="/views/common/footer.jsp"%>


