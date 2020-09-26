<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import="com.semi.rsv.model.vo.Reservation"%>
<%@ page import="com.semi.rsv.service.ReservationService"%>


<%
	Member logginedMember = (Member) session.getAttribute("Memberloggined"); //로그인한 멤버 세션
	
	System.out.println("logginedMember: "+ logginedMember);
	
	int cPage;
	
	try {
		cPage=Integer.parseInt(request.getParameter("cPage"));
	}catch(NumberFormatException e) {
		cPage=1;
	}
	int numPerPage=5;
	List<Reservation> rsvList = null;
	
	int totalData = (Integer)request.getAttribute("totalData");
	
	//관리자인 경우
	if(logginedMember.getMemberSep().equals("관리자")){
		rsvList = new ReservationService().selectAllReservation(cPage, numPerPage);
		
		//모든 db출력
	}
	else if(logginedMember.getMemberSep().equals("회원")){
	int ptnNum = logginedMember.getMemberNum();
	
	System.out.println("ptnNum: " + ptnNum);
	
	rsvList = new ReservationService().selectReservation(ptnNum,cPage, numPerPage);
	
	
	}
	
	//TODO:파트너 수정 
// 	else if(logginedMember.getMemberSep().equals("파트너")){
// 		int storeId = logginedMember.getMemberNum();
		
// 		System.out.println("ptnNum: " + ptnNum);
		
// 		rsvList = new ReservationService().selectPtnReservation(storeId,cPage, numPerPage);
		
		
// 		}
	request.setAttribute("reservaiton", rsvList);
	
	System.out.println("menu object: " + rsvList);
	
	
	
	
	System.out.println("rsvList" + rsvList);
	
	String pageBar=request.getParameter("pageBar");
	

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
<script>
function closeLayer(obj) {
	$(obj).parent().parent().hide();
}
</script>

<div class=submenu>
      <ul>
          <li><a class="subhome" href="<%=request.getContextPath()%>/main.jsp">HOME</a></li>
          <li><a class="subhome" href="location.html">고객 예약 현황</a></li>
          <li><a class="subhome" href="customer_service.html">리뷰관리</a></li>
          <li><a class="subhome" href="customer_service.html">문의관리</a></li>
        </ul>
    </div>
<!-- 서브메뉴 끝 -->

<!-- 본문 시작-->
<div class="cst-status">
	<h1>고객 예약 현황</h1>
</div>


<div class="container">
	

		<div class="board-header">
		
			<p class="cnt">
				총 게시물 : <strong><%=totalData %></strong>
			</p>
			
			
		</div>

		<div class="tbl-box">
			<table class="tbl-list">
				<caption>고객 예약 현황 테이블</caption>
				<thead>
					<tr>
						
						<th scope="col">예약업체</th>
						<th scope="col">예약자명</th>
						<th scope="col">예약날짜</th>
						<th scope="col">예약시간</th>
						<th scope="col">연락처</th>
						<th scope="col">예약인원</th>
						<th scope="col">요구사항</th>
					</tr>
				</thead>
				<%
					if(rsvList != null || rsvList.size() ==0){
					for(Reservation r : rsvList){
						
						%>
				<tbody>
					
					
					<tr>
						
						
						
						<td class="al"><span><%=r.getStore().getStoreName()%> </span></a></td>
						<td><span><%=r.getTm().getMemberName() %></span></td>
						<td><%=r.getRsvDate() %></td>
						<td><%=r.getRsvTime() %></td>
						<td><%= r.getTm().getMemberPhone()%></td>
						<td><%=r.getRsvPpl() %></td>
						<%if(r.getRsvRequire() == null ) { %>
						<td>요구사항 없음</td>
						
							
							<%}else{ %>
							<td><a class="Select">클릭하세요</a>
							<div id="divView"></div>
							<div class="popupLayer">
								<div>

									<span onClick="closeLayer(this)"
										style="cursor: pointer; font-size: 1.5em; padding-right: 10px;"
										title="닫기">X</span>
								</div>
								<%=r.getRsvRequire() %>
							</div></td>
							<%} %>

	</tr>
					
<%}}else{ %>

<tr >
<td colspan="7"><p>예약한 내역이 없습니다</p></td>
</tr>


<%} %>
</tbody>
			</table>
						
		</div>
		
	
			<div class="paging" id="pageBar">
				<%=request.getAttribute("pageBar") %>
			</div>

		


	<!-- 본문 끝 -->


	<!-- /.container -->
</div>

<style>
.cst-status {
	margin: 50px;
}

.cst-status h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
}

.imgSelect {
	cursor: pointer;
}

.popupLayer {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 350px;
	height: 150px;
	padding: 10px;
}

.popupLayer div {
	position: absolute;
	top: 5px;
	right: 5px
}

td a.Select {
	justify-content: center;
}

a.Select:hover {
	cursor: pointer;
}

#divView {
	position: absolute;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 350px;
	height: 150px;
	padding: 10px;
}
</style>

<script>
	$(function() {

		

		$('.Select').click(function(e) {
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;

			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();

			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.clientX + 10;
			var divTop = e.clientY + 5;

			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if (divLeft + oWidth > sWidth)
				divLeft -= oWidth;
			if (divTop + oHeight > sHeight)
				divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			if (divLeft < 0)
				divLeft = 0;
			if (divTop < 0)
				divTop = 0;

			$('.popupLayer').css({
				"top" : divTop,
				"left" : divLeft,
				"position" : "absolute"
			}).show();

		});

	});
</script>
<%@ include file="/views/common/footer.jsp"%>