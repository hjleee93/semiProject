<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.store.model.vo.Store"%>
<%@ page import="com.semi.member.model.vo.Member"%>
<%@ page import="com.semi.store.service.*"%>
<%@ page import="com.semi.storeservice.service.*"%>
<%@ page import="com.semi.storeservice.model.vo.*"%>
<%@ page import="com.semi.store.model.dao.StoreDao"%>
<%@ page import="java.util.List"%>

<%
	//메인시작! 
List<Store> list = new StoreService().selectStoreList();
List<Store> mainImgList = new StoreService().selectStoreMainImg();
request.setAttribute("store", list);

Member logginedMember = (Member) session.getAttribute("Memberloggined"); //로그인한 멤버 세션

Cookie[] cookies = request.getCookies();
String saveId = null;
if (cookies != null) {
	for (Cookie c : cookies) {
		if (c.getName().equals("saveId")) {
	saveId = c.getValue();
	break;
		}
	}
}
%>


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

<style>


p, input, button, a, h4{
font-family: 'JSDongkang-Regular';
}
#category, #datepicker {
	width: 30%;
	height: 45px;
	margin-top: 5px;
	border: 1px solid #d5d5d5;
	border-radius: 5px;
	padding-left: 10px;
}
</style>

</head>

<body id="mainbody">
	<!-- 메인바디 -->
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top header">
		<div class="container" id="mainheader">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/main.jsp">HYOLO</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation" style="border-color: #d5d5d5;">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">ABOUT</a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/location.jsp">LOCATION</a>
								 <a
								class="dropdown-item" href="<%=request.getContextPath()%>/qna">Q&A</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> RECOMMENDATION </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">

							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/views/recommand/ageStore.jsp">연령별 추천</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/random">랜덤 추천</a>
						</div></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> RESERVATION </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/views/store/storeCategory.jsp">ALL</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=cafe">CAFE</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=restaurant">RESTAURANT</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=pub">PUB/BAR</a>
						</div></li>

					<%
						if (logginedMember == null) {
					%>
					<li class="nav-item"><a class="nav-link " data-toggle="modal"
						href="javascript:void(0)" onclick="openLoginModal();">LOG IN</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="modal"
						href="javascript:void(0)" onclick="openRegisterModal();">REGISTER</a>
					</li>

					<%
						} else if (logginedMember != null && logginedMember.getMemberSep().equals("파트너")) {
						//파트너인 경우
						System.out.println("logginedMember: " + logginedMember.getMemberSep());
					%>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							MY PAGE </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/partnerpage?no=<%=logginedMember.getMemberNum()%>">MY
								PAGE</a> <a class="dropdown-item" href="purchase_history.html">MY
								BOOKING</a>  <a class="dropdown-item" href="<%=request.getContextPath()%>/qna">QNA</a>
						</div></li>
					<li class="nav-item"><a class="nav-link " data-toggle="modal"
						href="javascript:void(0)"
						onclick="location.replace('<%=request.getContextPath()%>/logout');">LOG
							OUT</a></li>
					<%
						} else if (logginedMember != null && logginedMember.getMemberSep().equals("회원")) {
						//회원인 경우
					%>

						<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							MY PAGE </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/partnerpage?no=<%=logginedMember.getMemberNum()%>">MY
								PAGE</a> <a class="dropdown-item" href="purchase_history.html">MY
								BOOKING</a>  <a class="dropdown-item" href="<%=request.getContextPath()%>/qna">QNA</a>
						</div></li>
					<li class="nav-item"><a class="nav-link " data-toggle="modal"
						href="javascript:void(0)"
						onclick="location.replace('<%=request.getContextPath()%>/logout');">LOG
							OUT</a></li>
					<%
						} else if (logginedMember != null && logginedMember.getMemberSep().equals("관리자")) {
						//관리자인경우
					%>



					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							MY PAGE </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/admin/adminpage">MY PAGE</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/admin/search/member">회원조회</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/admin/StoreRequestStatus">입점현황</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/notice">공지사항</a>
							<a class="dropdown-item" href="<%=request.getContextPath() %>/admin/order">주문현황</a>
						</div></li>
					<li class="nav-item"><a class="nav-link " data-toggle="modal"
						href="javascript:void(0)"
						onclick="location.replace('<%=request.getContextPath()%>/logout');">LOG
							OUT</a></li>
					<%
						}
					%>
				</ul>

			</div>

		</div>
	</nav>

	<header>
	
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner" role="listbox">
<!-- 				슬라이드 첫번째 사진 통일 -->
				<div class="carousel-item active" 
					style="height: 768px;background-image: url('https://cdn.pixabay.com/photo/2016/01/19/15/05/coffee-shop-1149155_1280.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>HYOLO</h3>
						<p>HYOLO에 방문하신 걸 환영합니다.</p> 
					</div>
				</div>

				
				
				
				<%for(int i = 0; i < 3; i++){//메인이미지 3개 출력
					if(list != null){
						//메인이미지가 null이 아닌경우
					if( mainImgList.get(i).getStoreMainImg() != null ){
				%>
				<div class="carousel-item"
					style="height: 768px;background-image: url('<%=request.getContextPath()%>/img/store/<%= mainImgList.get(i).getStoreMainImg()%>')">
					<div class="carousel-caption d-none d-md-block">
						<a style=" color: white;"
							 href="<%=request.getContextPath()%>/store/storeDetail?storeId=<%= mainImgList.get(i).getStoreId()%>"><h3><%= mainImgList.get(i).getStoreName() %></h3></a>
						<p><%= mainImgList.get(i).getStoreContent() %></p>
					</div>
				</div>
				
				<%}}} %>


			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<!-- 예약선택창 -->
		<div id="formselection">
			<form action="<%=request.getContextPath()%>/reco" method="POST">
			
			<input type="hidden" name="storeId" value=>
				<label id="datelabel" for="datepicker">날짜</label> <input
					name="datepicker" id="datepicker" placeholder="DATE" required autocomplete="off">
				<select id="category" name="category">
					<option value="cafe" selected>카페</option>
					<option value="pub">술집</option>
					<option value="restaurant">음식점</option>
				</select>
				<button type="submit" id="submitbtn">SEARCH</button>

			</form>
		</div>

		<h1 style="text-align:center; margin-top:40px; margin-bottom:40px; 
font-family: 'S-CoreDream-8Heavy', sans-serif;">HYOLO에 가장 최근에 등록된 PLACE를 둘러보세요!</h1>

		<!-- Marketing Icons Section -->
		<div class="row">
			<%
				if (list.size() != 0) {
				System.out.println("list in main : " + list);
				for (int i = 0; i < list.size(); i++) {
					if (i == 3) {
				break;
					} else {
			%>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header"><%=(list.get(i)).getStoreName()%></h4>
					<div class="card-body">
						<p class="card-text"><%=(list.get(i)).getStoreContent()%>
						</p>
					</div>
					<div class="card-footer">
						<a
							href="<%=request.getContextPath()%>/store/storeDetail?storeId=<%=(list.get(i)).getStoreId()%>"
							class="btn btn-primary">둘러보기</a>
					</div>
				</div>
			</div>
			<%
				}
			}
			} else {
			%>

			<div>
				<p>hyolo에 등록된 업체가 없습니다.</p>
			</div>

			<%
				}
			%>
		</div>
		<!-- /.row -->

<!-- 		<!-- Portfolio Section --> 
<!-- 		<h2>위치 기반 추천</h2> -->








	<script>
		//캘린더 띄우기
		$('#datepicker').datepicker({
			format : 'yyyy/mm/dd', //날짜 format
			startDate : new Date(), //현재 날짜 이전에는 선택 불가능 
			todayHighlight : true
		//오늘 날짜 hightlight
		});

		//새로고침 했을 때 양식 다시 제출 방지
		if (window.history.replaceState) { //current history 조작
			window.history.replaceState(null, null, window.location.href); //window.location.href : 현재 페이지 return
			//window.history.replaceState(date, title, url)
		}

		//캘린더 클릭하면 스크롤 다운
		$(document).ready(function() {
			$('#datepicker').click(function() {
				var offset = $('#datepicker').offset(); //선택한 태그의 위치를 반환        
				$('html').animate({
					scrollTop : offset.top - 200
				}, 500);
			});
		});

		//카테고리 선택하면 스크롤 다운
		$(document).ready(function() {
			$('#category').click(function() {
				var offset = $('#category').offset(); //선택한 태그의 위치를 반환        
				$('html').animate({
					scrollTop : offset.top - 200
				}, 500);
			});
		});
	</script>

	</div>
	<%@ include file="views/common/login.jsp"%>
	</div>
	</div>
	<%@ include file="views/common/footer.jsp"%>