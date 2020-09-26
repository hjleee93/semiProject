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
</style>

<div class="mptitle">
	<h1>업체 상세페이지 및 대표사진 수정하기</h1>
</div>

<div class="container" id="ajaxContainer">

<select id="selectedStore" >
			<% if(storeList != null){
				
				for(Store s: storeList){%>
					
					<option value="<%=s.getStoreId() %>" name="<%=s.getStoreName() %>"> <%=s.getStoreName() %></option>
					<%}%>
					

				</select>
	<div class="row">
	
	
		<div class="4u">
			<section class="special box">
				<i class="icon  major"></i> 
								<h3>
					<a  onclick="acyncMovePage('<%=request.getContextPath()%>/views/store/updateStoreDetailAjax.jsp')">사이트에
						사용할 이미지 업데이트 </a>
				</h3>
				<p>사이트에 사용하고 싶은 이미지 업데이트를 하실 수 있습니다.</p>
			</section>
		</div>
		<div class="4u">
			<section class="special box">
				<i class="icon  major"></i> 
								<h3>
					<a  onclick="acyncMovePage('<%=request.getContextPath()%>/views/store/updateStoreDetailAjax.jsp')">제공할 메뉴/티켓 설정하기 </a>
				</h3>
				<p>사이트에 사용하고 싶은 이미지 업데이트를 하실 수 있습니다.</p>
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
				<p>예약 서비스를 제공하지 않거나 업데이트 하고 싶은 경우 사용하 실 수 있습니다.</p>
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



	
</script>

<%@ include file="/views/common/footer.jsp"%>