<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<div class=submenu>
	<ul>
		<li><a class="subhome" href="<%=request.getContextPath()%>/main.jsp">HOME</a></li>
		<li><a class="subhome" href="location.html">LOCATION</a></li>
		<li><a class="subhome" href="customer_service.html">CUSTOMER
				SERVICE</a></li>

	</ul>
</div>
<div class="mptitle">
	<h1>입점 취소 및 해지</h1>
</div>


	<div class="container">
		<div class="card">
			<h4 class="card-header title">입점 취소하기</h4>
			<div class="card-body">
				<p class="card-text content">
					- 'HYOLO'에 등록된 {아이디}님의 {가게이름} 입점을 해지합니다.<br> - 입점 해지 신청 후
					{가게이름}은 더 이상 고객들에게 추천되지 않으며 예약이 불가능합니다.<br> - 업체는 7일뒤에 영구적으로
					삭제되며 7일 안으로 관리자에게 문의시 재입점이 가능합니다. <br> - 영구 삭제된 업체의 관련 데이터는 모두
					사라지며 복구는 불가능합니다.
				</p>
			</div>
			<div class="box22 d-flex">
				<p class="mt-0 mb-0">
					{가게이름}의 평점은 <u>{평점}</u>이며,<br>리뷰는 <u>{리뷰갯수}</u>개가 등록되어 있습니다.<br>
					<b>정말로 삭제하시겠습니까?</b>
				</p>
			</div>
			<div class="card-footer bot">
				<p class="pw_text">* 안전한 정보 보호를 위해 비밀번호를 확인합니다.</p>
				<table class="pwd-chk">
					<tr>
						<td>아이디:</td>
						<td><p>로그인 한 아이디</p></td>
					</tr>
					<tr>
						<td>패스워드 확인:</td>
						<td><input class="pw_client" type="password"></td>
					</tr>
				</table>

		</div>
		
		
	</div>
<div class="out-btn">
			<a href="#" class="btn btn-primary"
				style="background-color: gray; border-color: gray;">입점 해지하기</a> </span><a
				href="#" class="btn btn-primary" onclick="window.close()">취소</a>
				
		
	</div>
	</div>




<style>

.box22 p, h4.title, p.content, div.bot {
	text-align: center;
}

.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
	margin: 50px;
}

.pwd-chk {
	margin: 0 auto;
}

.pwd-chk tr td:first-child {
	float: right;
}

.out-btn {
    margin-top: 20px;
    margin-bottom: 20px;
    text-align: right;
}
}

.pw_text {
	font-size: 13px;
	color: gray;
}

.pw_client {
	margin-left: 2%;
	border: 1px solid #d5d5d5;
}

.box22 {
	margin: 0 auto 25px auto;
	display: inline-block;
	align-items: center;
	justify-content: center;
	border: 1px rgb(203, 201, 201) solid;
	box-shadow: rgb(184, 184, 184) 1px 1px 1px;
	border-radius: 10px;
	height: 80px;
	width: 450px;
}

.spam {
	display: inline-block;
	width: 230px;
	height: 40px;
	border: 1px white solid;
}
</style>
<%@ include file="/views/common/footer.jsp"%>