<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi.storeservice.model.vo.StoreService"%>
<%@ page import="com.semi.storeservice.service.StoreServiceService"%>
<%@ page import="com.semi.store.model.vo.*"%>
<%@ page import="com.semi.store.service.*"%>
<%


	Store s = (Store) request.getAttribute("store");

int storeId = s.getStoreId();
int ptnNum =s.getPtnNum();

StoreMenu sm =(StoreMenu)request.getAttribute("StoreMenu");
List<StoreMenu> menuList = new StoreMenuService().selectStoreMenu(storeId);

System.out.println("menu object: " + sm);

System.out.println("menu list: " + menuList);


String addr = s.getStoreAddress();
Member logginedMember =  new Member();

// Member logginedMember= (Member) session.getAttribute("Memberloggined");
if(session.getAttribute("Memberloggined") != null){
	logginedMember=(Member) session.getAttribute("Memberloggined");
// 	System.out.println("logginedMember: " + logginedMember);
	System.out.println("객체o");
}
else{

System.out.println("객체x");
	 logginedMember=new Member();
}



List<StoreService> serviceList = new StoreServiceService().selectService(storeId, ptnNum);


request.setAttribute("serviceList", serviceList);




System.out.println("logginedMember: " + logginedMember);





%>
<%@ include file="/views/common/header.jsp"%>
<script>
	$(function() {
		var swiper = new Swiper('.swiper-container', {
			loop : true,
			cssMode : true,
			slidesPerView : 5,
			observer : true,
			observeParents : true,
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			//  pagination: {
			//    el: '.swiper-pagination'
			// },
			mousewheel : true,
			keyboard : true,
			breakpoints : {
				1 : {
					slidesPerView : 1,
					spaceBetween : 20,
				},
				320 : {
					slidesPerView : 2,
					spaceBetween : 20,
				},
				640 : {
					slidesPerView : 2,
					spaceBetween : 20,
				},
				768 : {
					slidesPerView : 3,
					spaceBetween : 20,
				},
				1024 : {
					slidesPerView : 5,
					spaceBetween : 20,
				},
				1980 : {
					slidesPerView : 5,
					spaceBetween : 20,
				}
			}

		});

	});
</script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/swiper-bundle.css">

<script src="<%=request.getContextPath()%>/js/swiper-bundle.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/review.css">


<script src="<%=request.getContextPath()%>/js/jquery-1.12.1-ui.js"></script>



<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>

.inactive-date{
text-decoration:line-through

}

.active-date{
 cursor:pointer;
}

#calendar {
	border: none;
	outline: 1px solid;
}

.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
	margin: 50px;
}

#bottom-nav {
	background-color: white !important;
	margin-top: 30px;
	margin-bottom: 10px
}

.bottom {
	width: 100%;
	text-align: center;
	border-bottom: 1px solid #d5d5d5;
}

li.nav-item.bottom:not (:last-child ){
	border-right: 1px solid #d5d5d5;
}

a.nav-link.bottom {
	color: black;
}

a.nav-link.bottom:hover {
	text-decoration: underline;
}

#navbarColor02 {
	border-top: 1px solid #d5d5d5;
}

.row {
	margin-bottom: 50px;
}

#qnaTextarea {
	width: 83%;
	height: 100px;
	display: inline-block;
}

#caution {
	color: #a8a3a3;
	font-size: smaller;
}

h2 {
	margin-top: 10px;
	display: inline-block;
	font-size: 20px;
	font-weight: bold;
}

.btn_reply.add {
	min-width: 92.5px !important;
	height: 100px;
	display: inline-block;
	vertical-align: top;
	font-size: 14px;
}

textarea {
	flex: 1;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	margin: 0 auto;
}

.menu-img, .dtl-map {
	margin-top: 50px;
	text-align: center;
}

#detailView {
	text-align: center;
}
</style>

<div class="mptitle">
	<h1>
		<%=s.getStoreName()%></h1>
</div>




<div class="container">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="main.html">Home</a></li>
		<li class="breadcrumb-item active"><%=s.getStoreName()%></li>
	</ol>

	<!-- Portfolio Item Row -->
	<div class="row">

		<div class="col-md-6">
			<img class="img-fluid" src="http://placehold.it/750x500" alt="">
		</div>

		<div class="col-md-6 d-flex flex-column">
			<h3 class="my-3"><%=s.getStoreName()%></h3>
			<p style="flex: 1"><%=s.getStoreContent()%></p>
			<table>
			<tr>
			<p>오픈시간</p>
			</tr>
			
			
<%
if(serviceList.size() != 0){
	
		for(StoreService ss : serviceList){
		
			String closeArr =String.valueOf(ss.getCloseTime());
			String openArr = String.valueOf(ss.getOpenTime());
			String startArr =String.valueOf(ss.getBreakStart());
			String endArr = String.valueOf(ss.getBreakEnd());
			
			if(closeArr.length() ==3){
				closeArr = "0" + closeArr;
			}
			if(openArr.length() ==3){
				openArr = "0" + openArr;
				
			}
			if(startArr.length() ==3){
				startArr = "0" + startArr;
				
			}
			if(endArr.length() ==3){
				endArr = "0" + endArr;
				
			}
			
		%>
		<tr>
			<td><%=ss.getStoreDay()%> : </td>
			<% if(ss.getOpenTime() == 0){%>
			<td>Closed</td>
			<%}else{ %>
			<td><%=openArr.substring(0, 2)%>:<%=openArr.substring(2, 4)%>~<%=closeArr.substring(0, 2)%>:<%=closeArr.substring(2, 4)%></td>
			<%} %>
			</tr>
			<%if(ss.getBreakStart() != 0){ %>
			<tr>
			
			<td>브레이크타임</td>
			<td><%=startArr.substring(0, 2)%>:<%=startArr.substring(2, 4)%>~<%=endArr.substring(0, 2)%>:<%=endArr.substring(2, 4)%></td>
			</tr>
			<%} %>
		<%}
	
}
	
%>
			
		
			</table>


			<div style="display: flex;">
			<%if(logginedMember.getMemberId()!= null) {
			if(logginedMember.getMemberSep().equals("회원")){
			%>
				<div style="width: 50%">
					<h5 align="center">예약할 날짜를 선택하세요</h5>
					<p>오늘 날짜 이후로 선택해주세요</p>

					<table id="calendar" border="3" align="center">
						<tr>
							
							<td><label onclick="prevCalendar()"><</label></td>

							<td align="center" id="tbCalendarYM" colspan="5" >yyyy년 m월</td>
							<td><label onclick="nextCalendar()">> </label></td>
						</tr>
						<tr>
							<td align="center"><font color="#E91E63">일</td>
							<td align="center">월</td>
							<td align="center">화</td>
							<td align="center">수</td>
							<td align="center">목</td>
							<td align="center">금</td>
							<td align="center"><font color="blue">토</td>
						</tr>
					</table>
				</div>
				
				
				<table>
					<tr>
						<td>선택한 날짜:</td>
						<td id="selectedDate">
							<!-- 						<input id="" type="text" readonly> -->
						</td>
					</tr>
				</table>	
					<div id="bookingTime">
					
					
					</div>
				
					
				<%}}
			if(logginedMember.getMemberId() != null){
				if((logginedMember.getMemberSep().equals("파트너"))){
				%>
				<div style="width: 50%">
				<p>파트너로 가입하신 회원님들은 예약 시스템을 이용할 수 없습니다. <a class="nav-link " data-toggle="modal"
						href="javascript:void(0)" onclick="openRegisterModal();"style="display:inline-block">회원으로 가입</a>해주세요</p>
				
				</div>
				<%}}if(logginedMember.getMemberId() != null){ 
				if((logginedMember.getMemberSep().equals("관리자"))){
				%>
					
				
				<%}}else if(logginedMember.getMemberId() ==null){%>
					<div style="width: 50%">
					<p><a class="nav-link " data-toggle="modal"
							href="javascript:void(0)" onclick="openLoginModal();"style="display:inline-block">로그인</a> 후 예약 가능 합니다.</p>
					
					</div>
			<%}		
					%>
				
		</div>
		</div>

	</div>

	<!-- /.row -->



	<ul class="nav nav-tabs">
		<li class="nav-item "><a class="nav-link bottom active"
			data-toggle="tab" href="#location">위치</a></li>
		<li class="nav-item"><a class="nav-link bottom" data-toggle="tab"
			href="#detailView">메뉴보기</a></li>
		<li class="nav-item"><a class="nav-link bottom" data-toggle="tab"
			href="#qna">문의</a></li>
		<li class="nav-item"><a class="nav-link bottom" data-toggle="tab"
			href="#review">리뷰</a></li>

	</ul>

	<div class="tab-content">

		<div class="tab-pane fade show active" id="location">
			<div id="map" style="width: 100%; height: 350px;"></div>
			<div class="information">
				<div class="address">
					업체주소<br>
					<div class="phone d-flex align-items-center">
						<img src="https://image.flaticon.com/icons/svg/725/725606.svg"
							alt="전화걸기" height="20" width="auto">
						<button onclick="document.location.href='tel:010-1234-5678'">
							업체번호</button>
					</div>
				</div>


			</div>


		</div>


		<div class="tab-pane fade" id="qna">
			<div class="review_tit" id="_wrapQna">
				<div class="title-bot">
					<h2>상품문의</h2>
					<span class="count">총 <em id="qnaUserViewCount"></em>개
					</span>
				</div>


				<div class="reply_notice">

					<p id="caution">상품과 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고없이
						삭제됩니다.</p>

				</div>

				<div id="wrtieQnaArea" class="reply_write write">
					<form data-role="writeQnaForm" action="#tab=review">
						<div class="wrt_area">
							<ul id="qnaWriting">
								<li class="d-flex"><textarea class="" cols="100" rows="10"
										id="qnaTextarea" style="resize: none"
										placeholder="상품에 대해 궁금한 점을 물어보세요."></textarea>
									<button type="submit" class="btn_reply add">등록하기</button></li>

							</ul>
						</div>
						<div class="chk_area">
							<label class="chk_box"> <input data-tlarea="PCI6"
								data-tlord="1" type="checkbox" data-role="chkSecretQnaAdd">
								<i class="ico"></i> <em>비밀글로 문의하기</em>
							</label>
						</div>
					</form>
				</div>
			</div>
		</div>
				
		
		
		
		<div class="tab-pane fade" id="review">
			<section class="warp_deals_detail">
				<section class="deals_container">
					<div class="deals_content">
						<div class="inner">
							<section data-role="content-rely-tab" data-name="review"
								id="review" class="content-rely-tab tab_content"
								style="min-height: 486px;">
								<article class="review_wrp">
									<div id="_reviewWrap" class="review_user">
										<%if(logginedMember != null){ %>
											<button type="button" onclick="location.assign('<%=request.getContextPath()%>/review/reviewWrite')">리뷰쓰기</button>
										<%} %>
										<div class="review_tit title_review_info"></div>
										<!-- 사진이 포함된 리뷰만 업로드 -->
										<section id="_photoArea" class="photo_review_warp">
											<div class="title-bot">
												<h2>포토리뷰</h2>
											</div>
											<div class="swiper-container">
												<div class="swiper-wrapper">
													<div class="swiper-slide">
														<img
															src="https://img1.tmon.kr/cdn3/viewAdmin/image/16922/10806/PC_leftbanner_30day_fb835.jpg"
															alt="">
													</div>
													<div class="swiper-slide">
														<img
															src="data:image/jpeg;base64,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"
															alt="">
													</div>
													<div class="swiper-slide">
														<img
															src="https://img1.tmon.kr/cdn3/viewAdmin/image/16922/10806/PC_leftbanner_30day_fb835.jpg"
															alt="">
													</div>
													<div class="swiper-slide">
														<img
															src="https://img1.tmon.kr/cdn3/viewAdmin/image/16922/10806/PC_leftbanner_30day_fb835.jpg"
															alt="">
													</div>
													<div class="swiper-slide">
														<img
															src="data:image/jpeg;base64,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"
															alt="">
													</div>

												</div>
												<!-- Add Arrows -->
												<div class="swiper-button-next"></div>
												<div class="swiper-button-prev"></div>
												<!-- Add Pagination -->
												<div class="swiper-pagination"></div>
											</div>
										</section>
										
										<section class="review_user_wrap">
											<div class="review_tit title_review_all">
												<h2>리뷰 전체</h2>
											</div>
											<div id="_reviewContents">
												<ul id="_reviewList" class="review_block_list">
													<li class="review_block_item" data-reviewsrl="리뷰번호들어가는곳">
														<div class="review_block">
															<div class="review_block_rete">

																<!-- 별점! -->
																<span class="text">평점</span>
																<div class="review_block_star">
																	<div class="starRev">
																		<span class="starR1 on" id="0.5"
																			onClick="reply_click(this)">별1_왼쪽</span> <span
																			class="starR2 on" id="1" onClick="reply_click(this)">별1_오른쪽</span>
																		<span class="starR1" id="1.5"
																			onClick="reply_click(this)">별2_왼쪽</span> <span
																			class="starR2" id="2" onClick="reply_click(this)">별2_오른쪽</span>
																		<span class="starR1" id="2.5"
																			onClick="reply_click(this)">별3_왼쪽</span> <span
																			class="starR2" id="3" onClick="reply_click(this)">별3_오른쪽</span>
																		<span class="starR1" id="3.5"
																			onClick="reply_click(this)">별4_왼쪽</span> <span
																			class="starR2" id="4" onClick="reply_click(this)">별4_오른쪽</span>
																		<span class="starR1" id="4.5"
																			onClick="reply_click(this)">별5_왼쪽</span> <span
																			class="starR2" id="5" onClick="reply_click(this)">별5_오른쪽</span>
																	</div>

																	<span class="star_tate"> <span
																		class="star_progress_bar" style="width: 100%;">
																			<span class="blind">만족도 평점5점</span>
																	</span>
																	</span>
																</div>
															</div>
															<div class="review_tag"></div>
															<div class="button_list_box close">
																<span class="blind">상품옵션</span>
																<p class="button_list">
																	<span class="text">상품이름</span>
																</p>
															</div>
															<div class="review_block_text">
																<div class="review_text">리뷰내용하고 잘샀고 괜찮네요 또 블랙딜했으면
																	많이사둘걸 .. whd***** 2020-08-30 작성 상품 상품 평점 5 배송 배송 평점 5점
																	#포장 - 꼼꼼해요,#유통기한 - 아주 넉넉해요 상품 옵션 001_(행사) 콜라겐 채움 1병 /
																	저분자 피쉬 콜라겐 (850mg X45) 좋은 가격에 잘 샀습니다</div>
															</div>
														</div>
													</li>
												</ul>
												
											</div>
										</section>
									</div>
							</section>
						</div>
					</div>
				</section>

			</section>
		</div>

		<div class="tab-pane fade" id="detailView">
		<% for(int i = 0; i<menuList.size();i++) {%>

<%-- 			<img class="menu-img" src="<%=sm.getMenuImg()%>" alt=""> --%>
			<p><%=menuList.get(i).getMenuName()%></p>
			<p><%=menuList.get(i).getMenuPrice() %></p>
			<p><%=menuList.get(i).getMenuDetail() %></p>
<%-- 			<p><%=menuList.get(i).getMenuPrice() %></p> --%>
			<%} %>
		</div>
	</div>
</div>




<script>


	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	
	geocoder.addressSearch(
			'<%=s.getStoreAddress()%>',
					function(result, status) {

						// 정상적으로 검색이 완료됐으면 
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow(
									{
										content : '<div style="width:150px;text-align:center;padding:6px 0;"><%=s.getStoreName()%></div>'
									});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});

	var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date();//today의 Date를 세어주는 역할
	function prevCalendar() {//이전 달
		
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate());
		buildCalendar(); //달력 cell 만들어 출력 
	}

	function nextCalendar() {//다음 달
		
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		buildCalendar();//달력 cell 만들어 출력
	}
	function buildCalendar() {//현재 달 달력 만들기
		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
	
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		var tbCalendar = document.getElementById("calendar");
	
		var tbCalendarYM = document.getElementById("tbCalendarYM");
		tbCalendarYM.innerHTML = today.getFullYear() + "년 "
				+ (today.getMonth() + 1) + "월";

	
		while (tbCalendar.rows.length > 2) {
			//열을 지워줌
			//기본 열 크기는 body 부분에서 2로 고정되어 있다.
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
	}
		var row = null;
		row = tbCalendar.insertRow();

		var cnt = 0;// count, 셀의 갯수를 세어주는 역할

		for (i = 0; i < doMonth.getDay(); i++) {

			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
		}

		for (i = 1; i <= lastDate.getDate(); i++) {

			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
			cell.setAttribute("id", "day" + i);
			cell.setAttribute("value", i);
			cell.setAttribute("class", "row-day");

			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
			if (cnt % 7 == 1) {//일욜
				cell.innerHTML = "<font color=#E91E63>" + i

			}
			if (cnt % 7 == 0) {//토욜
				cell.innerHTML = "<font color=blue>" + i
				
				row = calendar.insertRow();
				
			}
			
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) { //오늘날짜 
				
				
				cell.bgColor = "violet";
				}
			
				console.log( date.getFullYear());
// 				cell.bgColor = "#FAF58C";
				cell.setAttribute("onclick", "getDate(this);");
				cell.setAttribute("class","active-date");
				
				var logginedMember = '<%=logginedMember.getMemberId()%>';
				
				if(logginedMember!=null){
					cell.setAttribute("onclick", "getDate(this); acyncMovePage('<%=request.getContextPath()%>/views/store/storeDetailAjax.jsp');");
				}else{
					
					
				}
				
			
			
		}
	};
	$(document).ready(function(){
		$('.active-date').click(function(e){
			var day = $(this).attr('value');
			
			  
			console.log(day);
		});
	});
	buildCalendar();
	var inputDate;
	var dateValue
	//선택한 날짜 출력
	function getDate(e) {
		$("tr td#selectedDate input").remove();
		var selectedDay = $(e).attr('value');
		var selectedMonth = (today.getMonth() + 1);
		var selectedYear = today.getFullYear();
		
		dateValue=selectedYear+'/'+selectedMonth+'/'+ selectedDay;
	
		var input = document.createElement("input");//날짜 출력 창

		input.setAttribute("id", "selectedDt");
		input.setAttribute("type", "text");
		input.setAttribute("name", "selectedDate");
		input.setAttribute("readonly", "readonly");
		

		if ((selectedDay + "").length < 2) {
			selectedDay = "0" + selectedDay;
		}
		if ((selectedMonth + "").length < 2) {
			selectedMonth = "0" + selectedMonth;
		}

		var today1 = new Date();

		var currentD = today1.getDate() + (today1.getMonth() + 1)
				+ today1.getFullYear();
		var selectDt = selectedYear + "" + selectedMonth + "" + selectedDay;
		var compareDt = new Date(selectDt.substring(0, 4), selectDt.substring(
				4, 6) - 1, selectDt.substring(6, 8)); //클릭한 날짜 출력
		inputDate = new Date(selectedYear + "/" + selectedMonth + "/" + selectedDay);
		console.log(currentD);
		console.log(compareDt);
		console.log(+today1.getDate());
		
		console.log("compareDt: " + compareDt);
		console.log("today1: " + today1);
		if (compareDt.setHours(0,0,0,0) < today1.setHours(0,0,0,0)) {
			console.log("compareDt: " + compareDt);
			console.log("today1: " + today1);
			alert("오늘 날짜 이후를 선택해주세요");
		} else {
			input.setAttribute("value", (selectedYear + "/" + selectedMonth
					+ "/" + selectedDay));

			document.querySelector("tr td#selectedDate").appendChild(input);
		}

	};
	$("#selectedDt").on("propertychange change keyup paste input ", function() {
		alert("change");
	});
	
	var selectedDate = $('#selectedDate').val();

	var loggedin;
	
<%-- 	if(<%=logginedMember%> == null || <%=logginedMember.equals(null)%>){ --%>
// 		loggedIn = 0 ;
// 	}else{
<%-- 		loggedin = <%=logginedMember.getMemberNum()%>; --%>
		
// 	}

	function acyncMovePage(url) {
		var week = new Array('Sun', 'Mon', 'Tue', 'Wed','Thur','Fri','Sat');
		var getDay = new Date(dateValue).getDay();
		
		console.log("요일: " + week[getDay]); //선택한 날짜의 요일 출력
			var ajaxOption = {
			url : url,
			
			type : "POST",
			dataType : "html",
			
			data:{
				"selectedDay":week[getDay],
				"selectedDate":dateValue,
				"ptnNum":"<%=s.getPtnNum()%>",
				"storeId":"<%=s.getStoreId()%>",
				
				"customerId": "<%=logginedMember.getMemberNum()%>"
<%-- 				,"serviceList":"<%=serviceList%>" --%>
				
				},
			success:function(data){
				console.log("pass data to ptnRequest4.jsp");}
			}

		$.ajax(ajaxOption).done(function(data) {
			
			$('#bookingTime').children().remove();
			
			$('#bookingTime').html(data);
		});
		
	}
	
</script>





<%@ include file="/views/common/footer.jsp"%>