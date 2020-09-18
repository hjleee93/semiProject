<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 임시 -->

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

<!-- 임시끝 -->


<div class="container">



</div>

<%@ include file="/views/common/footer.jsp"%>