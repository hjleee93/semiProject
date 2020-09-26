<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>



<style>

p {
font-family: 'JSDongkang-Regular';
}
.rsvlayout {
	width: 49%;
	border: 1px solid #d5d5d5;
	border-radius: 5px
}

.rsvlayout div {
	padding: 0 2% 2%;
}

.stepmenu {
	height: 70px;
	width: 100%;
	border-radius: 5px;
	margin-bottom: 20px;
}
input{
font-family: 'JSDongkang-Regular';
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

.foods,.activity,.theater {
	margin-right: 5px;
	margin-bottom: 0px;
}

.rsvdetail {
	padding-left: 18px;
	margin-top: 10px;
	margin-bottom: 10px;
}

.rsvheader {
	padding-top: 5px;
	margin-bottom: 20px;
}

/* hr태그 대신 margin-bottom */
.border-bottom {
	border-bottom: 1px solid;
	margin-bottom: 10px;
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

.board-view-btn.ac {
	justify-content: center;
}

.board-view-btn a {
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

.board-view-btn a:hover {
	text-decoration: underline;
}

.board-view-btn a.gray {
	background: #666666;
	border-color: #666666;
	color: #fff;
}

.board-view-btn a.blue {
	background: #107bb3;
	border-color: #107bb3;
	color: #fff;
}

#td1 {
	border: 1px white;
	text-align: center;
	background-color: royalblue;
	color: white;
	margin-left: 20px;
	
}

.stepmenu td {
	text-align: center;
	background-color: #e4e4e4;
	margin-left: 20px;
}

.rsvheader ~p:not (.rsvdetail ) {
	margin-bottom: 0;
}

.div_wrap {
	justify-content: space-between;
}

#td2 {
	border: 1px white;
	text-align: center;
	background-color: royalblue;
	color: white;
	margin-left: 20px;
}

#sz {
	width: 220px;
	height: 30px
}

.tb-row:not(:last-child) {
	width: 100%;
	height: 50px;
	margin-left: 2%;
	border-bottom: 1px solid #d5d5d5;
}

.tb-title {
	width: 30%;
}

.tb {
	margin-left: 2%;
}
.td-content{

    font-size: smaller;
    color: #E91E63;
    text-align: center;
    margin: 0;
}

.mptitle {
	margin: 50px;
}

.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
	    margin: 50px;
    padding-top: 35px;
}


#datepicker {
	border: none;
	margin-left: -2%;
}

.datepicker {
	border: 1px solid #d5d5d5;
}

td.day a:hover {
	color: red;
}

.table-condensed td.day {
	position: relative;
	height: 70px;
	overflow-wrap: anywhere;
	padding: 0px 2px 40px;
}

.table-condensed td.day p {
	font-size: 10px;
	margin-bottom: 0 !important;
}

.table-condensed td.day p#active {
	overflow: hidden;
	margin: 0 !important;
}

.table-condensed td.day p#active h2 {
	position: absolute;
	font-size: 12px;
}

.activeClicked {
	background-color: red;
}

td.active.day p#active {
	color: red;
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
#right{font-size: 12px;
margin-left: 10px;
margin-bottom: 0;
font-family: 'JSDongkang-Regular';
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

.tbl_h3 {
	margin-left: 16%;
}

.spot2 {
	margin-left: 16%;
	margin-bottom: 3%;
	border-bottom: 1px solid black;
}

.title {
	margin-left: 16%;
	margin-bottom: 2%;
	border-bottom: 1px solid black;
}

th {

	border-style: groove;
	text-align: center;
}

.comm, .dot {
	width: 260px;
	margin-left: 2%;
}

#myCategory1 {
	width: 31%;
	margin-left: 2%;
}

.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
	margin: 50px;
}

#abc {
	color: red;
}

.tbl-list.tb2 th {
	background-color: #fff;
}

.tbl-list.tb2 th {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid #ededed;
	text-align: left;
	padding-left: 20px;
}

.tbl-list.tb2 tr:first-child {
	border-top: 2px solid #000;
}

.tbl-list.tb2 td {
	text-align: left;
}

label {
	margin-bottom: 0;
}
#storeTitle{width:221px;}

#mem_postcode{background-color: white;
border: 1px solid black;
margin-bottom: 10px;
margin-top: 10px;
    margin-left: 0;
    padding: 0;
    font-family: 'JSDongkang-Regular';
}

#mem_findAddress{
	height:26px ;
	float:unset;
margin-top: 10px;

    padding: 0;
    font-size: 0.85rem;
    text-align: center;
    vertical-align: top;
    margin-top: 10px;}

#mem_address,#mem_detailAddress,#mem_extraAddress,#storePhone{background-color: white;
border: 1px solid black;
margin-bottom: 10px;
width: 221px;
    padding: 0;
    width: 98%;
}

tr{
font-family: 'JSDongkang-Regular';
}

@media (max-width:768px){
  .rsvlayout{width:100% !important;
  }
  
}

td{padding: 2% 0;}

.form-group{padding: 0 !important;
    margin: 0;}
#source{display: block;
    width: 98%;}
    #storePage{width:98%;}
h4{
font-family: 'JSDongkang-Regular';
text-align:center;}

</style>




<div class="mptitle">
	<h1>입점 신청서</h1>
</div>

<div class="container">

<form name="storeEnrollForm" action="<%=request.getContextPath() %>/ptn/storeEnrollEnd" method="post" id="StoreEnrollForm">
	<div class="div_wrap col-12 row d-flex m-0 p-0">
		<div class="rsvlayout">
			<p class="rsvtype">운영하고자 하는 서비스에 적합한 예약유형을 선택해주세요.</p>

			<div class="border-bottom" >
			
				<h4 class="rsvheader">먹을거리</h4>
				
				<label for="rsvradio1">
				<input type="radio" name="ra"
					class="foods" id="rsvradio1" value="restaurant" required>식당
					<p class="rsvdetail">일반예약, 단체예약, 테이블예약등 다양한 예약상품을 만들어 시간 대 별과
						인원으로 예약을 받는 식당에 적합한 예약유형입니다.</p></label>
						
				<label for="rsvradio6">
				<input type="radio" name="ra"
					class="foods" id="rsvradio6" value="pub" onclick="ctgry_fn();">술집
					<p class="rsvdetail">일반예약, 단체예약, 테이블예약등 다양한 예약상품을 만들어 시간 대 별과
						인원으로 예약을 받는 술집에 적합한 예약유형입니다.</p></label>
						
				<label for="rsvradio7">
				<input type="radio" name="ra"
					class="foods" id="rsvradio7" value="cafe" onclick="ctgry_fn();">카페
					<p class="rsvdetail">일반예약, 단체예약, 테이블예약등 다양한 예약상품을 만들어 시간 대 별과
						인원으로 예약을 받는 카페에 적합한 예약유형입니다.</p></label>
			</div>

		

			<div >
			
				<h4 class="rsvheader">놀거리</h4>
				<label for="rsvradio4"><input type="radio" name="ra"
					class="activity" id="rsvradio4" value="leisure" onclick="ctgry_fn();">레저
					<p class="rsvdetail">계절별로 즐길 수 있는 일반적인 스포츠 액티비티에 적합한 예약 유형입니다.</p></label>

				<label for="rsvradio5"><input type="radio" name="ra"
					class="activity" id="rsvradio5" value="ticket" onclick="ctgry_fn();">티켓
					<p class="rsvdetail">놀이공원, 아쿠아리움등 일별 티켓을 판매하는 업체에 적합한 유형입니다.</p></label>

			</div>

		</div>
		<div class="rsvlayout">
			<p class="rsvtype">예약 서비스를 제공할 업체의 정보를 입력해 주세요.</p>

<p id="right">
                    <span id="abc">*</span>
                    필수입력사항
                </p>
			<table class="tb">
				<tbody>
					<tr class="tb-row">
						<td class="tb-title"><label for="storeTitle"><span id="abc">*</span>업체명 </td>
						<td>
						<input class="store-title" type="text" name="storeName"
							id="storeTitle" onkeyup="counter()" maxlength="30" required></label> <span
							id="counting">0</span>자/30자</td>
					</tr>
					
					
					
					<tr class="tb-row">
						<td class="tb-title"><label for="storePhone"><span id="abc">*</span>업체 연락처 </td>
						<td>
						<input class="store-phone" type="tel" name="storePhone"
							id="storePhone" maxlength="11" placeholder="-빼고 숫자만 입력해주세요" required></label>
							</td>
					</tr>
					
					<tr class="tb-row">
						<td class="tb-title"><span id="abc">*</span>업체 주소</td>
						<td>
							<div class="form-group col-12">
								
								<input class="col-6" type="text" id="mem_postcode"
								 placeholder="우편번호" onclick="Postcode();" name="storePost" required onkeypress="return false;" > 
								<input type="button" class="col-6"
									id="mem_findAddress" onclick="Postcode();" value="우편번호 찾기" >
								<input type="text" required onkeypress="return false;"  id="mem_address" required placeholder="주소" name="storeAddr"  >
								<input type="text" id="mem_detailAddress" placeholder="상세주소" name="storeDtlAddr"> 
									<input type="text" id="mem_extraAddress" name="storeExtraAddr"
								placeholder="참고항목" readonly>
							</div>
							 <script>
								function Postcode() {
									new daum.Postcode(
											{
												oncomplete : function(data) {
													var addr = ''; // 주소 변수
													var extraAddr = ''; // 참고항목 변수

													//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
													if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
														addr = data.roadAddress;
													} else { // 사용자가 지번 주소를 선택했을 경우(J)
														addr = data.jibunAddress;
													}

													// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
													if (data.userSelectedType === 'R') {
														// 법정동명이 있을 경우 추가한다. (법정리는 제외)
														// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
														if (data.bname !== ''
																&& /[동|로|가]$/g
																		.test(data.bname)) {
															extraAddr += data.bname;
														}
														// 건물명이 있고, 공동주택일 경우 추가한다.
														if (data.buildingName !== ''
																&& data.apartment === 'Y') {
															extraAddr += (extraAddr !== '' ? ', '
																	+ data.buildingName
																	: data.buildingName);
														}
														// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
														if (extraAddr !== '') {
															extraAddr = ' ('
																	+ extraAddr
																	+ ')';
														}
														// 조합된 참고항목을 해당 필드에 넣는다.
														document
																.getElementById("mem_extraAddress").value = extraAddr;

													} else {
														document
																.getElementById("mem_extraAddress").value = '';
													}

													// 우편번호와 주소 정보를 해당 필드에 넣는다.
													document
															.getElementById('mem_postcode').value = data.zonecode;
													document
															.getElementById("mem_address").value = addr;
													// 커서를 상세주소 필드로 이동한다.
													document
															.getElementById(
																	"mem_detailAddress")
															.focus();
												}
											}).open();
								}
							</script>

						</td>
					</tr>
					<tr class="tb-row">
					<td class="tb-title">
					<label for="source"><span id="abc">*</span>업체 설명</td>
						<td>
							<p>

								<textarea id="source" cols="210" rows="7"
									onkeyup="counter1()" minlength="20" name="storeContent" required style="resize:none;"></textarea>
								<span id="counting1" for="source">0</span>/1000자(최소20자)

							</p>
					</tr>
					
					<tr class="tb-row">
						<td class="tb-title"><label for="storePage">업체 사이트 </td>
						<td><input class="store-page" type="text" name="storePage"
							id="storePage"></label></td>
					</tr>
					
					<tr><td colspan="2"><p class="td-content">핫플레이스 등록의 기준이 됩니다.미 응답시 등록기준에 미달 될 수 있습니다.</p></td></tr>
					<tr class="tb-row">
					
						<td class="tb-title"><span id="abc">*</span>월 매출
						</td>
						<td><select size="1" id="sz"name="storeProfit" required>
								<option value="0">미 응답</option>
								<option value="1">3000만원이하</option>
								<option value="2">3000만원 - 6000만원</option>
								<option value="3">6000만원 - 1억미만</option>
								<option value="4">1억 이상</option>
						</select></td>
					</tr>
					<tr class="tb-row">
					
						<td class="tb-title"><span id="abc">*</span>타겟 층</td>
						
						<td><select size="1" id="target" name="storeTarget" required>
								<option value="0">전 연령</option>
								<option value="1">10대</option>
								<option value="2">20대</option>
								<option value="3">30대</option>
								<option value="4">40대 이상</option>
						</select></td>
					</tr>
				</tbody>
			</table>


	<input type="hidden" name="ptnId" value="<%=Memberloggined.getMemberNum()%>">
	<%
	System.out.println("Memberloggined in request: " + Memberloggined.getMemberNum());
	
	%>
		</div>

	</div>

	<div class="board-view-btn">
	
        <input type="reset" value="취소" class="gray" title="cancel" onclick="cancel_event();">
	<input type="submit" value="신청" class="blue" title="submit" onclick="radio_event();">	
	 
	</div>
	</form>
</div>
<script>


	function cancel_event() {
		if (confirm("변경사항이 저장되지 않을 수도 있습니다.") == true) {
			//TODO: 삭제 코드 추가 
			//location.href="이전페이지html";
		} else {
			location.href = "03front3.html"; //현재페이지 유지
		}
	}

	//라디오 버튼 필수체크 : jQuery
	function radio_event() {
		var radio_check = $('input[name=ra]:checked').val();
		if (radio_check == undefined) {
			alert("서비스 항목을 선택해주세요.");
			return;
		}
		if ($("#storeTitle").val() == "") {
			alert("업체명은 필수 입력값입니다.");
			$("#storeTitle").focus();
			return;
		}
		if ($("#storePhone").val() == "") {
			alert("업체연락처는 필수 입력값입니다.");
			$("#storePhone").focus();
			return;
		}
		if ($("#mem_postcode").val() == "") {
			alert("업체 우편번호는 필수 입력값입니다.");
			$("#mem_postcode").focus();
			return;
		}
		if ($("#source").val() == "") {
			alert("업체 설명은 필수 입력값입니다.");
			$("#source").focus();
			return;
		}
		
		if ($("#source").val() == "") {
			alert("업체 설명은 필수 입력값입니다.");
			$("#source").focus();
			return;
		}
		
	}

	function counter() {
		document.getElementById("counting").innerHTML = document
				.getElementById("storeTitle").value.length;
	}
	

	function counter1() {
		document.getElementById("counting1").innerHTML = document
				.getElementById("source").value.length;
	}

</script>

<%@ include file="/views/common/footer.jsp"%>