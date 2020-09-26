<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.semi.store.model.vo.StoreMenu"%>
<%@ page import="com.semi.store.service.StoreMenuService"%>
<%@ page import="com.semi.member.model.vo.Member"%>
<%@ page import="com.semi.partner.model.vo.PartnerMember"%>

<%@ page import="com.semi.store.model.vo.*"%>
<%@ page import="com.semi.store.service.*"%>

<%


int storeId = Integer.parseInt(request.getParameter("storeId"));
// int storeId = (Integer)request.getAttribute("storeId");
System.out.println("storeId: " + storeId);
 	
Store s = new StoreService().selectStoreDtl(storeId);

Member sessionMember = (Member) session.getAttribute("Memberloggined"); //로그인한 멤버 세션 저장
int ptnNum = sessionMember.getMemberNum();
%>

<style>
.mptitle {
	margin: 50px;
}

.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
}

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
	height: 300px;
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
</style>
<!-- TODO:css 정리해야됨 -->

<div class="container">

	<form action="<%=request.getContextPath()%>/store/menuUploadEnd"
		name="uploadFile" method="post" enctype="multipart/form-data">
		<input type="hidden" name="storeId" value="<%=storeId%>">
		<input type="hidden" name="ptnId" value="<%=ptnNum%>">
		<table id="tbl" class="tbl-list tb2">
			<thead>
			
				<tr>
					<td colspan="4">
						<p style="text-align: center;">
						<%=s.getStoreName()%>
						의 메뉴를 등록해주세요
						</p>
					</td>

				</tr>
				</thead>
			
				<tbody>
				
				<tr>
				<td colspan="2" style="width:21%">등록할 메뉴 이름을 적어주세요 예시 1)A SET 예시 2) 산채 비빔밥</td>
				<td><input type="text" name="menuName" placeholder="메뉴이름" required></td>
				</tr>
				
				<tr>
				<td colspan="2" style="width:21%">메뉴 가격을 입력해주세요 </td>
				<td><input type="number" name="menuPrice" min="0" placeholder="숫자만입력하세요" required></td>
				</tr>
				
				<tr>
				<td colspan="2" style="width:21%">수량을 선택해주세요 </td>
				<td><input type="number" name="menuAmount" min="0" placeholder="숫자만입력하세요" required></td>
				</tr>
				
				<tr>
				<td colspan="2" style="width:21%">메뉴 설명을 적어주세요 예시 1)아메리카노 2잔 + 치즈케이크 2) 비건이신 분들도 드실 수 있는 산채나물이 들어간 비빔밥 입니다.</td>
				<td>
				<textarea name="menuDetail" cols="100" rows="10"
										id="menuDetail" style="resize: none"
										placeholder="메뉴설명을 입력해주세요"></textarea>

				</tr>
				
				<tr>
				<td colspan="2" style="width:21%">메뉴 사진을 업로드해주세요</td>
				<td><input type="file" id="menuImg" name="menuImg" accept="image/*" onchange="setMenuImg(event);" required></td>
				<td><div>
								<div id="image_container">
									<img class="pre-img" src="http://placehold.it/700x400">
								</div>

							</div></td>
				</tr>
				
				
		
		</tbody>
		</table>
		<div class="board-view-btn">
			<input type="reset" class="gray" value="취소" title="previous"
				onclick="cancel_event()"> 
				<input type="submit" class="blue"
				value="확인" title="next" id="nextBtn">
		</div>
		</form>
		
		</div>
		
		<script>
		function setMenuImg(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				$("#image_container img").remove();
				img.setAttribute("width", "400");
				img.setAttribute("height", "300");
				document.querySelector("div#image_container").appendChild(img);
			};
			reader.readAsDataURL(event.target.files[0]);
		}
		</script>
		