<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.semi.store.model.vo.Store"%>
<%@ page import="com.semi.member.model.vo.Member"%>
<%@ page import="com.semi.store.service.StoreService"%>
<%@ page import="com.semi.store.model.dao.StoreDao"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List"%>

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

<%
	Member logginedMember = (Member) session.getAttribute("Memberloggined");

int ptnId = logginedMember.getMemberNum();

System.out.println("ptnId : " + ptnId);
Store s = (Store) request.getAttribute("store");

int storeId = s.getStoreId();

 System.out.println("가져오나 : " + s);




%>

<style>
.mptitle {
	margin: 50px;
}

.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
}

.box {
	border-radius: 6px;
	border: solid 1px rgba(144, 144, 144, 0.25);
	margin-bottom: 2em;
	padding: 3em 2em;
}

section.special, article.special {
	text-align: center;
}



h3 {
	font-size: 1.25em;
	line-height: 1.5em;
}

h1, h2, h3, h4, h5, h6 {
	color: #666f77;
	font-weight: 300;
	line-height: 1em;
	margin: 0 0 1em 0;
	text-transform: uppercase;
	letter-spacing: 0.125em;
	 font-family: 'JSDongkang-Regular';
	
}

.icon.major {
	display: inline-block;
	margin: 0 0 1.25em 0;
	color: #ffffff;
	background: #629DD1;
	width: 3em;
	height: 3em;
	font-size: 2em;
	text-align: center;
	line-height: 3em;
	border-radius: 100%;
	box-shadow: 0 0 0 10px #fff, 0 0 0 11px rgba(144, 144, 144, 0.25);
}

.icon {
	text-decoration: none;
	border-bottom: none;
	position: relative;
}

*, *:before, *:after {
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	/* box-sizing: border-box; */
}

.row>* {
	padding-left: 4em;
}

.\34 u {
	width: 50%;
}
.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
	    margin: 50px;
    padding-top: 35px;
}
p, td{
 font-family: 'JSDongkang-Regular';
}
#mdp-demo{
width:400px;
}
.menu-select:hover{
cursor: pointer;
}

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

.tbl-list.tb2>tbody>tr:first-child {
	border-top: 2px solid #000;
}

.tbl-list.tb2 td {
	text-align: left;
}
/* .tbl-list tr:last-child td{ 
	border:none;
} */
.ui-datepicker-calendar tr:last-child td, .tab-content tr:last-child td{
	border:none;
}
label {
	margin-bottom: 0;
}
.ui-datepicker-header{
	display:flex;
	position:relative;
}
.ui-datepicker-title{
	position:absolute;
	left:43.5%;
}
.ui-datepicker-next{
	position:absolute;
	left:95%;
}
table.ui-datepicker-calendar{
	width:100%;
}
.nav-tabs, .nav-tabs .nav-link.active, .nav-tabs .nav-link:focus, .nav-tabs .nav-link:hover{border-color:transparent}
td {width:21%;}

/* .ui-datepicker-prev span:before{
content:"<"
} */

.tbl-list.tb2>tbody>tr>td{
	padding:2% 0;
}
.ui-datepicker-calendar tr td, .ui-datepicker-calendar tr th, .ui-datepicker-calendar tr:last-child td, .tab-content tr:last-child td{
	padding:20px 0;
	padding-left:0 !important;
	/* text-align:center !important; */
}
/* .ui-datepicker-calendar tr td a{justify-content:center;} */
</style>

<div class="mptitle">
	<h1>판매 방식 선택하기</h1>
</div>

<div class="container" id="ajaxContainer">

	<div class="row">
	
	
		<div class="4u">
			<section class="special box">
				<i class="icon  major"></i> 
								<h3>
					<a class="menu-select" onclick="acyncMovePage('<%=request.getContextPath()%>/views/store/menuUploadAjax.jsp')">티켓 /바우처 판매하기</a>
				</h3>
				<p>시간대 별로 예약을 받는 것이 아닌 바우처 형식의 쿠폰을 판매하여 고객이 방문시 바로 사용할 수 있는 티켓입니다. 티켓판매를 원하시는 경우 클릭해 주세요.
				클릭하시면 메뉴 등록 페이지로 이동합니다.</p>
			</section>
		</div>
		<div class="4u">
			<section class="special box">
				<i class="icon  major"></i> 
								<h3>
					<a class="menu-select" onclick="acyncMovePage1('<%=request.getContextPath()%>/storeService/storeRsvAjaxSetting')">업체 예약 시간 설정하기</a>
				</h3>
				<p>요일별로 예약을 받을 수 있는 형식으로 요일별로 오픈시간, 마감시간, 브레이크 타임, 휴무일을 설정할 수 있으며 예약을 받을 최소인원 최대인원 설정이 가능합니다. </p>
			</section>
		</div>
		
		

	</div>
</div>

<script>



var storeId;

function acyncMovePage(url) {
	storeId =<%=storeId%>;
	console.log(storeId);
		var ajaxOption = {
		url : url,
		
		type : "POST",
		dataType : "html",
		
		data:{
			"storeId":storeId
			
			
			},
		success:function(data){
			console.log("pass data to ptnRequest4.jsp");}
		}

	$.ajax(ajaxOption).done(function(data) {
		
		$('#ajaxContainer').children().remove();
		
		$('#ajaxContainer').html(data);
	});
	
}

function acyncMovePage1(url) {
	
	storeId =<%=storeId%>;

		var ajaxOption = {
		url : url,
		
		type : "POST",
		dataType : "html",
		
		data:{
			"storeId":storeId
			
			
			},
		success:function(data){
			console.log("pass data to ptnRequest4.jsp");}
		}

	$.ajax(ajaxOption).done(function(data) {
		
		$('#ajaxContainer').children().remove();
		
		$('#ajaxContainer').html(data);
	});
	
}



	
</script>

<%@ include file="/views/common/footer.jsp"%>