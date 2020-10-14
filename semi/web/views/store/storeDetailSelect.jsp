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

List<Store> storeList = new StoreService().selectStoreListByPartner(ptnId);

System.out.println("storeList : " + storeList);




%>

<style>

section a:hover{
cursor: pointer;
}
.selectStore{
 font-family: 'JSDongkang-Regular';
height: 50px;
    text-align: center;
    font-size: 20px;
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

.box {
	border-radius: 6px;
	border: solid 1px rgba(144, 144, 144, 0.25);
	margin-bottom: 2em;
	padding: 3em 2em;
}

section.special, article.special {
  font-family: 'JSDongkang-Regular';
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
	width: 33.3%;
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

table tr:not(:last-child){
border-bottom: 1px solid #ededed;
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

.tbl-list.tb2 tr td:first-child{
	text-align:left;
	vertical-align:top;

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
	<h1>업체 상세페이지 및 대표사진 수정하기</h1>
</div>

<div class="container" id="ajaxContainer">

<div class="selectStore">
<span>수정할 업체 선택 : </span>
		<select id="selectedStore" >
			<% if(storeList != null){
				
				for(Store s: storeList){%>
					
					<option value="<%=s.getStoreId() %>" name="<%=s.getStoreName() %>"> <%=s.getStoreName() %></option>
					<%}%>
					

		</select>
		</div>
	<div class="row">
	
	
		<div class="4u">
			<section class="special box">
				<i class="icon  major"></i> 
								<h3>
					<a  onclick="acyncMovePage('<%=request.getContextPath()%>/views/store/updateStoreDetailAjax.jsp')">이미지 업데이트 </a>
				</h3>
				<p>사이트에 사용하고 싶은 이미지를 업데이트 하실 수 있습니다.</p>
			</section>
		</div>
		<div class="4u">
			<section class="special box">
				<i class="icon  major"></i> 
								<h3>
					<a  onclick="acyncMovePage2('<%=request.getContextPath()%>/store/menuUpload')">판매 메뉴/티켓 설정하기 </a>
				</h3>
				<p>판매할 메뉴 혹은 티켓을 설정하실 수 있습니다.</p>
			</section>
		</div>
		
		
		<div class="4u">
			<section class="special box">
				<i class="icon  major"></i>
				<h3>
					<a
						onclick="acyncMovePage1('<%=request.getContextPath()%>/storeService/updateStoreRsvSetting')">예약
						서비스 제공 업데이트</a>
				</h3>
				<p>예약 서비스를 설정하실 수 있습니다.</p>
			</section>
		</div>
		
		<%}else{ %>
		<div>등록된 업체가 업습니다. 입점 등록을 해주시거나, 입점 현황을 확인해주세요</div>
<%} %>
	</div>
</div>

<script>



var selectedStore;
function acyncMovePage(url) {
	selectedStore= $("#selectedStore option:selected").val();
	console.log(selectedStore);

		var ajaxOption = {
		url : url,
		
		type : "POST",
		dataType : "html",
		
		data:{
			"selectedStoreId":selectedStore
			
			
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
	selectedStore= $("#selectedStore option:selected").val();
	console.log(selectedStore);

		var ajaxOption = {
		url : url,
		
		type : "POST",
		dataType : "html",
		
		data:{
			"selectedStoreId":selectedStore
			
			
			},
		success:function(data){
			console.log("pass data to ptnRequest4.jsp");}
		}

	$.ajax(ajaxOption).done(function(data) {
		
		$('#ajaxContainer').children().remove();
		
		$('#ajaxContainer').html(data);
	});
	
}


function acyncMovePage2(url) {
	selectedStore= $("#selectedStore option:selected").val();
	console.log(selectedStore);

		var ajaxOption = {
		url : url,
		
		type : "POST",
		dataType : "html",
		
		data:{
			"selectedStoreId":selectedStore
			
			
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