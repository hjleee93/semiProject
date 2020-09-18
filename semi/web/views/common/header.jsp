<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.store.model.vo.Store"%>
<%@ page import="java.util.List"%>
<%@ page import="com.semi.member.model.vo.Member"%>
<%@ page import="com.semi.partner.model.vo.PartnerMember"%>
<%
	System.out.println("header 실행");

List<Store> list = (List) request.getAttribute("stores");

String cafe = "카페";
String restaurant = "식당";
String pub = "술집";

Member Memberloggined = (Member) session.getAttribute("Memberloggined"); //로그인한 멤버 세션 저장 

Cookie[] cookie = request.getCookies();
String savedId = null;
if (cookie != null) {
	for (Cookie c : cookie) {
		if (c.getName().equals("saveId")) {
	savedId = c.getValue();
	break;
		}
	}
}
%>
<!-- 	헤더 네비게이션(서브헤더 포함 x), cdn, script/css import -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>HYOLO</title>

<!-- 제이쿼리   -->
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

</head>

<body>

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
							<!--       TODO:링크수정 -->
							<a class="dropdown-item" href=""<%=request.getContextPath()%>">Q&A</a>
						</div></li>


					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> RECOMMENDATION </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<!--       TODO:링크수정 -->
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeList">연령별 추천</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeList">지역별 추천</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeList">랜덤 추천</a>
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
								href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=<%=cafe%>">CAFE</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=<%=restaurant%>">RESTAURANT</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=<%=pub%>">PUB/BAR</a>
						</div></li>
					<%
						if (Memberloggined == null) {
							
					%>
					<li class="nav-item"><a class="nav-link " data-toggle="modal"
						href="javascript:void(0)" onclick="openLoginModal();">LOG IN</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="modal"
						href="javascript:void(0)" onclick="openRegisterModal();">REGISTER</a>
					</li>
					<%
						} else if(Memberloggined != null && Memberloggined.getMemberSep().equals("파트너")){
							//파트너인 경우
							System.out.println("logginedMember: " + Memberloggined.getMemberSep());
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							MY PAGE </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item" href="<%=request.getContextPath()%>/views/mypage/mypage_partner.jsp">MY PAGE</a> 
							<a class="dropdown-item" href="purchase_history.html">MY BOOKING</a> 
							<a class="dropdown-item" href="./usr_review.html">MY REVIEW</a> 
							<a class="dropdown-item" href="./usr_review.html">FAQ</a>
						</div></li>
						<li class="nav-item">
						<a class="nav-link " data-toggle="modal"
						href="javascript:void(0)" onclick="location.replace('<%=request.getContextPath()%>/logout');">LOG OUT</a>
						</li>
					<%
						}else if(Memberloggined != null && Memberloggined.getMemberSep().equals("회원")){
							//회원인 경우
					%>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							MY PAGE </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/views/mypage/mypage_partner.jsp">MY
								PAGE</a> <a class="dropdown-item" href="purchase_history.html">MY
								BOOKING</a> <a class="dropdown-item" href="./usr_review.html">MY
								REVIEW</a> <a class="dropdown-item" href="./usr_review.html">FAQ</a>
						</div></li>
						<li class="nav-item">
						<a class="nav-link " data-toggle="modal"
						href="javascript:void(0)" onclick="location.replace('<%=request.getContextPath()%>/logout');">LOG OUT</a>
						</li>
						<%
						}else if(Memberloggined != null && Memberloggined.getMemberSep().equals("관리자")){
							//관리자인경우
						%>
						
						<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							MY PAGE </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/views/mypage/mypage_partner.jsp">MY
								PAGE</a> <a class="dropdown-item" href="purchase_history.html">MY
								BOOKING</a> <a class="dropdown-item" href="./usr_review.html">MY
								REVIEW</a> <a class="dropdown-item" href="./usr_review.html">FAQ</a>
						</div></li>
						<li class="nav-item">
						<a class="nav-link " data-toggle="modal"
						href="javascript:void(0)" onclick="location.replace('<%=request.getContextPath()%>/logout');">LOG OUT</a>
						</li>
						<%} %>
				</ul>

			</div>

		</div>
	</nav>