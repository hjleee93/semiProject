<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.store.model.vo.Store"%>
<%@ page import="java.util.List"%>
<%@ page import="com.semi.member.model.vo.Member"%>
<%@ page import="com.semi.partner.model.vo.PartnerMember"%>
<%
	System.out.println("header 실행");

// List<Store> list = (List) request.getAttribute("stores");

Store s = (Store) request.getAttribute("store");

System.out.println("store in 2: " + s);

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
<!-- 업체 입점 등록 페이지 -->
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>입점 신청서</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery-ui.multidatespicker.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<!-- datepicker Range -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="<%=request.getContextPath()%>/css/custome-datepicker.css"
	rel="stylesheet">
<!-- multiDate -->
<link
	href="<%=request.getContextPath()%>/css/jquery-ui.multidatespicker.css"
	rel="stylesheet">



<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/modern-business.css"
	rel="stylesheet">

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



<style>
.tbl-title {
	width: 300px;
}

.show {
	display: block;
}

.hide {
	display: none;
}

table td.breakTime {
	background-color: yellow;
}

.timeSelector td {
	width: 60px;
	height: 40px;
	border: 1px solid #ededed;
}

.ui-datepicker-calendar>tbody td.ui-datepicker-week-end:first-child a {
	color: red;
}

.ui-datepicker-calendar>tbody td.ui-datepicker-week-end:last-child a {
	color: blue;
}

#datepicker {
	border: none;
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
	padding: 0px 5px 40px;
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
	/* margin-right: 30%; */
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
	background-color: gray;
	color: white;
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
</style>



</head>

<body>
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
								href="<%=request.getContextPath()%>/location.jsp">LOCATION</a> <a
								class="dropdown-item" href="<%=request.getContextPath()%>/qna">Q&A</a>
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
								href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=cafe">CAFE</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=<restaurant">RESTAURANT</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=<pub">PUB/BAR</a>
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
						} else if (Memberloggined != null && Memberloggined.getMemberSep().equals("파트너")) {
						//파트너인 경우
						System.out.println("logginedMember: " + Memberloggined.getMemberSep());
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
					<li class="nav-item"><a class="nav-link " data-toggle="modal"
						href="javascript:void(0)"
						onclick="location.replace('<%=request.getContextPath()%>/logout');">LOG
							OUT</a></li>
					<%
						} else if (Memberloggined != null && Memberloggined.getMemberSep().equals("회원")) {
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
					<li class="nav-item"><a class="nav-link " data-toggle="modal"
						href="javascript:void(0)"
						onclick="location.replace('<%=request.getContextPath()%>/logout');">LOG
							OUT</a></li>
					<%
						} else if (Memberloggined != null && Memberloggined.getMemberSep().equals("관리자")) {
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
	<div class="mptitle">
		<h1>서비스 제작하기</h1>
	</div>

	<div class="container" id="container">


		<table id="tbl" class="tbl-list tb2">



			<tbody>
				<tr>
					<td colspan="3">
						<p style="text-align: center;"><%=s.getStoreName()%>의 운영시간 및
							상세예약 사항을 설정해주세요
						</p>
					</td>

				</tr>



				<tr>
					<td scope="row" class="tbl-title"><label for="phone1"
						class="store">1. 영업시간을 선택해주세요</label></td>
					<td>
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#mon">월</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tue">화</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#wed">수</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#thur">목</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#fri">금</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#sat">토</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#sun">일</a></li>


						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="mon">
								<table>
									<tr>
										<td colspan="3"><label for="monClosed"><input
												type="checkbox" name="monClosed" class="closed"
												id="monClosed" value="1" onclick="clicked()">Closed</label></td>
									</tr>

									<tbody id="layer">
										<tr>
											<td>오픈 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Open time" required></td>
										</tr>
										<tr>
											<td>마감 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Close time" required></td>
										</tr>
										<tr>
											<td>브레이크타임</td>
											<td><input type="text" class="timepicker2"
												placeholder="Start"> ~ <input type="text"
												class="timepicker3" placeholder="Finish"></td>
										</tr>
										<tr>
										<td>예약 인원수</td>
										<td><input type="number" min="1" placeholder="최소 인원수"> ~ <input type="number" min="1" placeholder="최대 인원수"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="tue">
								<table>
									<tr>
										<td><label for="tueClosed"><input type="checkbox"
												name="tueClosed" class="closed" id="tueClosed" value="1"
												onclick="clicked2()">Closed</label></td>
									</tr>
									<tbody id="layer2">
										<tr>
											<td>오픈 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Open time" required></td>
										</tr>
										<tr>
											<td>마감 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Close time" required></td>
										</tr>

										<tr>
											<td>브레이크타임</td>
											<td colspan="2"><input type="text" class="timepicker2"
												placeholder="Start"> ~ <input type="text"
												class="timepicker3" placeholder="Finish"></td>
										</tr>
										<tr>
										<td>예약 인원수</td>
										<td><input type="number" min="1" placeholder="최소 인원수"> ~ <input type="number" min="1" placeholder="최대 인원수"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="wed">
								<table>
									<tr>
										<td><label for="wedClosed"><input type="checkbox"
												name="wedClosed" class="closed" id="wedClosed" value="1"
												onclick="clicked3()">Closed</label></td>
									</tr>
									<tbody id="layer3">
										<tr>
											<td>오픈 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Open time" required></td>
										</tr>
										<tr>
											<td>마감 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Close time" required></td>
										</tr>
										<tr>
											<td>브레이크타임</td>
											<td colspan="2"><input type="text" class="timepicker2"
												placeholder="Start"> ~ <input type="text"
												class="timepicker3" placeholder="Finish"></td>
										</tr>
										<tr>
										<td>예약 인원수</td>
										<td><input type="number" min="1" placeholder="최소 인원수"> ~ <input type="number" min="1" placeholder="최대 인원수"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="thur">
								<table>
									<tr>
										<td><label for="thurClosed"><input
												type="checkbox" name="thurClosed" class="closed"
												id="thurClosed" value="1" onclick="clicked4()">Closed</label></td>
									</tr>
									<tbody id="layer4">
										<tr>
											<td>오픈 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Open time" required></td>
										</tr>
										<tr>
											<td>마감 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Close time" required></td>
										</tr>
										<tr>
											<td>브레이크타임</td>
											<td colspan="2"><input type="text" class="timepicker2"
												placeholder="Start"> ~ <input type="text"
												class="timepicker3" placeholder="Finish"></td>
										</tr>
										<tr>
										<td>예약 인원수</td>
										<td><input type="number" min="1" placeholder="최소 인원수"> ~ <input type="number" min="1" placeholder="최대 인원수"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="fri">
								<table>
									<tr>
										<td><label for="friClosed"><input type="checkbox"
												name="friClosed" class="closed" id="friClosed" value="1"
												onclick="clicked5()">Closed</label></td>
									</tr>
									<tbody id="layer5">
										<tr>
											<td>오픈 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Open time" required></td>
										</tr>
										<tr>
											<td>마감 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Close time" required></td>
										</tr>
										<tr>
											<td>브레이크타임</td>
											<td colspan="2"><input type="text" class="timepicker2"
												placeholder="Start"> ~ <input type="text"
												class="timepicker3" placeholder="Finish"></td>
										</tr>
										<tr>
										<td>예약 인원수</td>
										<td><input type="number" min="1" placeholder="최소 인원수"> ~ <input type="number" min="1" placeholder="최대 인원수"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="sat">
								<table>
									<tr>
										<td><label for="satClosed"><input type="checkbox"
												name="satClosed" class="closed" id="satClosed" value="1"
												onclick="clicked6()">Closed</label></td>
									</tr>
									<tbody id="layer6">
										<tr>
											<td>오픈 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Open time" required></td>
										</tr>
										<tr>
											<td>마감 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Close time" required></td>
										</tr>
										<tr>
											<td>브레이크타임</td>
											<td colspan="2"><input type="text" class="timepicker2"
												placeholder="Start"> ~ <input type="text"
												class="timepicker3" placeholder="Finish"></td>
										</tr>
										<tr>
										<td>예약 인원수</td>
										<td><input type="number" min="1" placeholder="최소 인원수"> ~ <input type="number" min="1" placeholder="최대 인원수"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="sun">
								<table>
									<tr>
										<td><label for="sunClosed"><input type="checkbox"
												name="sunClosed" class="closed" id="sunClosed" value="1"
												onclick="clicked7()">Closed</label></td>
									</tr>
									<tbody id="layer7">
										<tr>
											<td>오픈 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Open time" required></td>
										</tr>
										<tr>
											<td>마감 시간</td>
											<td><input type="text" class="timepicker2"
												placeholder="Close time" required></td>
										</tr>
										<tr>
											<td>브레이크타임</td>
											<td><input type="text" class="timepicker2"
												placeholder="Start"> ~ <input type="text"
												class="timepicker3" placeholder="Finish"></td>
										</tr>
										<tr>
										<td>예약 인원수</td>
										<td><input type="number" min="1" placeholder="최소 인원수"> ~ <input type="number" min="1" placeholder="최대 인원수"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</td>
				</tr>


				<tr>
					<td scope="row" class="tbl-title"><label for="locate1"
						class="store">2. 휴무일을 지정해주세요</label></td>
					<td>
						<div id="mdp-demo"></div>

					</td>
					<td><textarea id="altField" value=""></textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="board-view-btn">
			<a class="gray" title="previous" onclick="cancel_event()">취소</a> <a
				class="blue" title="complete"
				onclick="acyncMovePage('<%=request.getContextPath()%>/views/partner/ptnRequest4.jsp');">다음</a>
		</div>
	</div>




	<script>
		function acyncMovePage(url) {
			// ajax option
			var ajaxOption = {
				url : url,
				async : true,
				type : "POST",
				dataType : "html",
				cache : false
			};

			$.ajax(ajaxOption).done(function(data) {
				// Contents 영역 삭제
				$('#container').children().remove();
				// Contents 영역 교체
				$('#container').html(data);
			});
		}

		function clicked() {

			btn = $('#monClosed'); //버튼 아이디 변수 선언

			layer = $('#layer'); //레이어 아이디 변수 선언

			layer.toggle(

			function() {
				layer.addClass('show')
			}, //클릭하면 show클래스 적용되서 보이기

			function() {
				layer.addClass('hide')
			} //한 번 더 클릭하면 hide클래스가 숨기기

			);

		}

		function clicked2() {
			btn = $('#tueClosed');
			layer = $('#layer2');

			layer.toggle(function() {
				layer.addClass('show')
			},

			function() {
				layer.addClass('hide')
			});
		}
		function clicked3() {
			btn = $('#wedClosed');
			layer = $('#layer3');

			layer.toggle(function() {
				layer.addClass('show')
			},

			function() {
				layer.addClass('hide')
			});
		}
		function clicked4() {
			btn = $('#thurClosed');
			layer = $('#layer4');

			layer.toggle(function() {
				layer.addClass('show')
			},

			function() {
				layer.addClass('hide')
			});
		}
		function clicked5() {
			btn = $('#friClosed');
			layer = $('#layer5');

			layer.toggle(function() {
				layer.addClass('show')
			},

			function() {
				layer.addClass('hide')
			});
		}
		function clicked6() {
			btn = $('#satClosed');
			layer = $('#layer6');

			layer.toggle(function() {
				layer.addClass('show')
			},

			function() {
				layer.addClass('hide')
			});
		}
		function clicked7() {
			btn = $('#sunClosed');
			layer = $('#layer7');

			layer.toggle(function() {
				layer.addClass('show')
			},

			function() {
				layer.addClass('hide')
			});
		}

		$('.timepicker').timepicker({
			timeFormat : 'h:mm p',
			interval : 60,
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('.timepicker1').timepicker({
			timeFormat : 'h:mm p',
			interval : 60,
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('.timepicker2').timepicker({
			timeFormat : 'h:mm p',
			interval : 60,
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('.timepicker3').timepicker({
			timeFormat : 'h:mm p',
			interval : 60,
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$('#mdp-demo').multiDatesPicker({
			altField : '#altField',
			minDate : 0, // today
			maxDate : 30
		// +30 days from today
		});

		var jq = jQuery.noConflict();

		jq(document).on('click', '#our_table', function() {
			var isMouseDown = false, isHighlighted;
			jq("#our_table td").mousedown(function() {
				isMouseDown = true;
				jq(this).toggleClass("highlighted");
				isHighlighted = jq(this).hasClass("highlighted");
				return false; // prevent text selection
			}).mouseover(function() {
				if (isMouseDown) {
					$(this).toggleClass("highlighted", isHighlighted);
				}
			}).bind("selectstart", function() {
				return false;
			})

			jq(document).mouseup(function() {
				isMouseDown = false;
			});
		});

		//클릭한 td의 tr값 가져오기

		jq("#our_table td").click(function() {
			var checkBtn = jq(this);
			var tr = checkBtn.parent().find('th'); //클릭한 th가져옴

			console.log("가져오나? " + tr.text()); //가져옴 시간을 가져옴 요일은 어케가져옴?

		});

		var tr = document.getElementsByClassName("time");

		for (var tr_i = 0; tr_i < tr.length; tr_i++) {
			var td = tr[tr_i].getElementsByTagName("td");
			for (var i = 0; i < td.length; i++) {

				(function() {
					td[i].index = i;
					td[i].onclick = function() {
						if (this.index == 0) {
							console.log("월");
						} else if (this.index == 1) {
							console.log("화");
						} else if (this.index == 2) {
							console.log("수");
						} else if (this.index == 3) {
							console.log("목");
						} else if (this.index == 4) {
							console.log("금");
						} else if (this.index == 5) {
							console.log("토");
						} else if (this.index == 6) {
							console.log("일");
						}
						console.log("??????" + this.index); //요일 출력
					}
				})();
			}
		}

		//selectable 구현
		jq(function() {
			jq("#tBody").selectable({
				filter : "td",
				selected : function(e, ui) {
					jq(ui.selected).toggleClass("ui-chosen")
					jq(this).find(".ui.chosen").addClass("ui-selected")
				}
			});
			jq("#empty").selectable({
				filter : "td",
				selected : function(e, ui) {
					jq(ui.selected).toggleClass("ui-chosen1")
					jq(this).find(".ui.chosen1").addClass("ui-selected2")
				}
			});
		});

		//공휴일 배열
		//일단 나중에 추가...
		var holidays = [ "2020-01-01", "03-01", "05-05", "06-06", "07-17",
				"08-15", "10-03", "12-25" ];

		//운영기간 설정용 datepicker
		jq(function() {

			jq('input[name="datefilter"]').daterangepicker({
				autoUpdateInput : false,
				minDate : new Date(),
				locale : {
					format : 'YYYY/MM/DD'
				}
			});

			jq('input[name="datefilter"]').on(
					'apply.daterangepicker',
					function(ev, picker) {
						jq(this).val(
								picker.startDate.format('YYYY/MM/DD') + ' - '
										+ picker.endDate.format('YYYY/MM/DD'));
					});

			jq('input[name="datefilter"]').on('cancel.daterangepicker',
					function(ev, picker) {
						jq(this).val('');
					});

		});
		var $ = jQuery.noConflict();
	</script>

	<%@ include file="/views/common/footer.jsp"%>