<%@page import="com.semi.store.service.StoreService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.Member"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.semi.store.model.vo.*"%>
<%@ page import="com.semi.store.service.*"%>


<%
Member logginedMember = (Member) session.getAttribute("Memberloggined");

int selectedStore = Integer.parseInt(request.getParameter("selectedStoreId")); //스토어 id
Store s = new StoreService().selectStoreDtl(selectedStore);

System.out.println("ajax: " + selectedStore);

%>

<form action="<%=request.getContextPath()%>/store/storeDtlSelectUpdate"
		name="uploadFile" method="post" enctype="multipart/form-data">


		<input type="hidden" name="storeId" value="<%=selectedStore%>">
		<div class="rsvlayout">
			<p class="rsvtype"><%=s.getStoreName()%>의 메인페이지에 수정 할 사진을 선택
				해주세요.
			</p>
			<!-- 			TODO:메인페이지 슬라이드 사진  -->
			<!-- 			<p>*사용자 선호 카테고리 위주로 선택되기때문에 </p> -->

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
							<button class="pre-btn">preview</button></td>

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
									value="<%=logginedMember.getMemberNum()%>">
								<div id="image_container1">
									<img class="pre-img" src="http://placehold.it/1900x1080">
								</div>

							</div></td>
					</tr>
					<tr>
						<td>홍보 문구<br>
						<small>메인페이지 슬라이드에 홍보 문구로 들어갑니다.</small></td>
						<td><textarea name="promoText" id="promoText" cols="40"
								rows="5" style="resize: none;"></textarea></td>
					</tr>
					<tr>
						<td class="rsvtitle">예약상품 카드 이미지<span id="abc">*</span>
							<p class="imgdtl">최대(20MB,700*400권장)</p>

						</td>


						<td><input type="file" id="image2" name="postImg"
							accept="image/*" onchange="setThumbnail2(event);" required />
							<button class="pre-btn">preview</button></td>

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

							<button class="pre-btn">preview</button></td>
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
