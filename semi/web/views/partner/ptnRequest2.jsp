<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	String storeName = (String) request.getAttribute("storeName");
	String storeContent = (String) request.getAttribute("storeContent");
%>
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


<div class="container">

	<form action="<%=request.getContextPath()%>/storeInputImg"
		name="uploadFile" method="post" enctype="multipart/form-data">

		<div class="rsvlayout">
			<p class="rsvtype">서비스 할 업체 상세 이미지를 업로드 해주세요.</p>

			<div>
				<p id="right">
					<span id="abc">*</span> 필수입력사항
				</p>

				<table>
					<colgroup>
						<col style="width: 20%;">
						<col style="width: auto;">
						<col style="width: 13%;">
					</colgroup>

					<tr>
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
					</tr>

				</table>
			</div>



		</div>
		<div class="board-view-btn">
			<input type="reset" class="gray" value="이전" title="previous"
				onclick="cancel_event()"> <input type="submit" class="blue"
				value="신청" title="complete">
		</div>
	</form>
</div>

<script type="text/javascript">
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