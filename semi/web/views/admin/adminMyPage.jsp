<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.semi.common.listener.LoginCheckCountListener,
	com.semi.member.model.vo.*,
	com.semi.partner.model.vo.*,
	java.util.List,
	com.semi.admin.store.vo.*"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/adminmenubar.jsp"%>
<!-- 전용css -->
<link href="<%=request.getContextPath()%>/css/adminpage.css" rel="stylesheet">

<%
	int connectCount = LoginCheckCountListener.getConnectCount();
	List<Store> list = (List) request.getAttribute("list");
	int count = (Integer)request.getAttribute("waitingCount");

%>
<section>
	<div class="mptitle">
		<h1>A d m i n p a g e</h1>
	</div>

	<!-- Page Content -->
	<div class="container">

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main.html">Home</a></li>
			<li class="breadcrumb-item active">adminpage</li>
		</ol>

		<div class="parent" style="width: 100%;">
			<div class="child1"
				style="background-color: rgba(189, 189, 189, 0.119)">
				<img src="http://placehold.it/200x200" height="200px" width="200px"
					class="mong">
				<!-- <img src="https://cdn.onlinewebfonts.com/svg/img_239979.png" height="200px" width="300px" class="mong"> -->
				<p class="profile1">ADMIN</p>
				<table class="profilebox">
					<tr>
						<td id="reservationstate" class="profilebox1 menuchoice"
							onclick="location.href='rsvstatus.html'">회원예약현황</td>
						<td id="searchmember" class="profilebox2 menuchoice"
							onclick="searchMembers();">회원조회</td>
					</tr>
					<tr>
						<td id="storestate" class="profilebox1 menuchoice"
							onclick="location.replace('<%=request.getContextPath()%>/admin/StoreRequestStatus');">입점현황</a></td>
						<td id="searchpartner" class="profilebox2 menuchoice"
							onclick="location.href='usr_qna.html'">Q&A</td>
					</tr>
					<tr>
						<td id="qna" class="profilebox3 menuchoice"
							onclick="location.replace('<%=request.getContextPath()%>/notice');">공지사항</a></td>
						<td id="searchboard" class="menuchoice"
							onclick="location.replace('<%=request.getContextPath()%>/admin/reviewPick');">리뷰PICK!</td>
						<!-- 관리자가 게시글 삭제할 수 있게 권한 /아니면 qna게시판->에서 댓글작성하는걸로 -->
					</tr>
				</table>
			</div>
			<div class="child2"
				style="background-color: rgba(189, 189, 189, 0.119)">

				<table>
					<tr>
						<td rowspan="3">
							<div class="box1" style="width: 300px; height: 500px;">
								<div class="line"></div>
								<p class="text3">입점 신청현황</p>
								<div>
									<span class="mar2">신규신청</span>
									<marquee class="mar1" scrollamount="1" width="50" height="110"
										direction="up" behavior="alternate"><%=count %> </marquee>
									<span class="mar3">건</span>
								</div>
								<img src="<%=request.getContextPath()%>/images/quick.png"
									class="img01" width="240px" height="40px">
								<div class="quick_box">
									<ul>
										<li class="quick1">입점 승인 완료 ✓</li>
										<li class="quick2">입점 승인 보류 ✓</li>
										<li class="quick3">입점 승인 취소 ✓</li>

									</ul>
								</div>
						</td>
						<td>
							<div class="box2">
								<p class="text3">TOTAL</p>
								<a href="<%=request.getContextPath()%>/adminpage">
									<div class="minibox1"><%=connectCount%></div>
								</a>
								<div class="minibox2">접속자 수</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="box3">
								<p class="text3">RESERVATION</p>
								<a href="rsvstatus.html">
									<div class="minibox3">75</div>
								</a>
								<div class="minibox2">예약율(%)</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="box3">
								<p class="text3">Q&A</p>
								<a href="usr_qna.html"> <!-- 문의삭제/댓글달 수있게 관리자권한 -->
									<div class="minibox4">0</div>
								</a>
								<div class="minibox2">신규 등록</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="container1" id="container1" class="margin-table">
			<p></p>

			<div id="storerequest" class="card margin-table">
				<div class="card-body">
					<a href="javascript:;" class="close">X</a>
					<h3 class="card-title text-center">입점신청</h3>
					<div class="table-responsive">
						<table class="table" id="tableup">
							<thead>
							<!-- <colgroup>
								<col style="width:30%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
							</colgroup> -->
								<tr>
									<th><input type="checkbox" name="all" class="check-all1">
									</th>
									<th>STORENAME</th>
									<th>CATEGORY</th>
									<th>PHONE</th>
									<th>ADDRESS</th>
									<th>CONCEPT</th>
									<th>HOMEPAGE</th>
									<th>STATUS</th>
								</tr>
							</thead>
							<tbody>
								<%if (list.isEmpty()) {%>
								<tr>
									<td colspan="7">조회된 게시글이 없습니다.</td>
								</tr>
								<%} else {
									  for (Store s : list) {
									    if (s.getJoinStatus().equals("WAITING")) {
								%>
								<tr>
									<td>
										<a class="movestatus">
										<marquee scrollamount="5" direction="down" behavior="alternate"
										width="50" height="50">
											<small><i>NEW</i></small>
										</marquee>
										</a>
									</td>
									<td><%=s.getStoreName() %></td>
									<td><%=s.getDetailCategory() %></td>
									<td><%=s.getPhone() %></td>
									<td><%=s.getStoreAddr() %></td>
									<td><%=s.getStoreContent() %></td>
									<td><%=s.getHomepage() %></td>
									<td><%=s.getJoinStatus() %></td>
								</tr>
								<%}
								 }
								}%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="approval" class="card margin-table">
				<div class="card-body">
					<a href="javascript:;" class="close">X</a>
					<h3 class="card-title text-center">입점완료</h3>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th><input type="checkbox" name="all" class="check-all2">
									</th>
									<th>STORENAME</th>
									<th>CATEGORY</th>
									<th>PHONE</th>
									<th>ADDRESS</th>
									<th>CONCEPT</th>
									<th>HOMEPAGE</th>
									<th>STATUS</th>
								</tr>
							</thead>
							<tbody>
							<%if (list.isEmpty()) {%>
								<tr>
									<td colspan="7">조회된 게시글이 없습니다.</td>
								</tr>
								<%} else {
									  for (Store s : list) {
									    if (s.getJoinStatus().equals("ACCEPT")) {
								%>
								<tr>
									<td><a class="movestatus_1">✔</a></td>
									<td><%=s.getStoreName() %></td>
									<td><%=s.getDetailCategory() %></td>
									<td><%=s.getPhone() %></td>
									<td><%=s.getStoreAddr() %></td>
									<td><%=s.getStoreContent() %></td>
									<td><%=s.getHomepage() %></td>
									<td><%=s.getJoinStatus() %></td>
								</tr>
								<%}
								 }
								}%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- </div> -->
			<div id="postpone" class="card margin-table">
				<div class="card-body">
					<a href="javascript:;" class="close">X</a>
					<h3 class="card-title text-center">입점보류</h3>
					<div class="buttondiv">
						<!-- <button type="button" class="btn btn-success" id="reason">사유</button> -->
					</div>
					<div class="table-responsive">
						<table class="table" id="tablepostpone">
							<thead>
								<tr>
									<th><input type="checkbox" name="all" class="check-all3">
									</th>
									<th>STORENAME</th>
									<th>CATEGORY</th>
									<th>PHONE</th>
									<th>ADDRESS</th>
									<th>CONCEPT</th>
									<th>HOMEPAGE</th>
									<th>STATUS</th>
								</tr>
							</thead>
							<tbody>
							<%if (list.isEmpty()) {%>
								<tr>
									<td colspan="7">조회된 게시글이 없습니다.</td>
								</tr>
								<%} else {
									  for (Store s : list) {
									    if (s.getJoinStatus().equals("HOLD")) {
								%>
								<tr>
									<td><a class="movestatus_2">↩</a></td>
									<td><%=s.getStoreName() %></td>
									<td><%=s.getDetailCategory() %></td>
									<td><%=s.getPhone() %></td>
									<td><%=s.getStoreAddr() %></td>
									<td><%=s.getStoreContent() %></td>
									<td><%=s.getHomepage() %></td>
									<td><%=s.getJoinStatus() %></td>
								</tr>
								<%}
								 }
								}%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div id="cancel" class="card margin-table">
				<div class="card-body">
					<a href="javascript:;" class="close">X</a>
					<h3 class="card-title text-center">입점취소</h3>
					<div class="buttondiv">
						<!-- <button type="button" class="btn btn-success" id="cancelreason">사유</button> -->
					</div>
					<div class="table-responsive">
						<table class="table" id="tablecancel">
							<thead>
								<tr>
									<th><input type="checkbox" name="all" class="check-all4">
									</th>
									<th>STORENAME</th>
									<th>CATEGORY</th>
									<th>PHONE</th>
									<th>ADDRESS</th>
									<th>CONCEPT</th>
									<th>HOMEPAGE</th>
									<th>STATUS</th>
								</tr>
							</thead>
							<tbody>
							<%if (list.isEmpty()) {%>
								<tr>
									<td colspan="7">조회된 게시글이 없습니다.</td>
								</tr>
								<%} else {
									  for (Store s : list) {
									    if (s.getJoinStatus().equals("DECLINE")) {
								%>
								<tr>
									<td><a class="movestatus_3">✖</a></td>
									<td><%=s.getStoreName() %></td>
									<td><%=s.getDetailCategory() %></td>
									<td><%=s.getPhone() %></td>
									<td><%=s.getStoreAddr() %></td>
									<td><%=s.getStoreContent() %></td>
									<td><%=s.getHomepage() %></td>
									<td><%=s.getJoinStatus() %></td>
								</tr>
								<%}
								 }
								}%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 회원조회테이블팝업 -->

			<!-- 파트너끝 -->
		</div>
		<!-- container end -->
	</div>

	<script>
      
   	  function searchMembers(){
 			const url = "<%=request.getContextPath()%>/admin/search/member";
 			var popupWidth = 1000;
 			var popupHeight = 400;
 			var popupX = (window.screen.width/2)-(popupWidth/2);
 			// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

 			var popupY= (window.screen.height/2) - (popupHeight/2);
 			// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
 			window.open(url, '', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
 		}
      $(document).ready(function () {
       
        $("a.movestatus").parent().parent().on("click", function () {
        	location.href = "<%=request.getContextPath()%>/admin/StoreRequestStatus"
        });
        $("a.movestatus_1").parent().parent().on("click", function () {
        	location.href = "<%=request.getContextPath()%>/admin/StoreRequestStatus"
        });
        $("a.movestatus_2").parent().parent().on("click", function () {
        	location.href = "<%=request.getContextPath()%>/admin/StoreRequestStatus"
        });
        $("a.movestatus_3").parent().parent().on("click", function () {
        	location.href = "<%=request.getContextPath()%>/admin/StoreRequestStatus"
        });

        $(".close").on('click', function () {
          $("#membersearch").fadeOut(300);
          $("#storerequest").fadeOut(300);
          $("#approval").fadeOut(300);
          $("#postpone").fadeOut(300);
          $("#cancel").fadeOut(300);
        });
        //div toggle
          $("#membersearch").toggle();
        });
 
        $(".mar1").click(function () {
          $("#storerequest").toggle();
        });
        $(".quick1").click(function () {
          $("#approval").toggle();
        });
        $(".quick2").click(function () {
          $("#postpone").toggle();
        });
        $(".quick3").click(function () {
          $("#cancel").toggle();
        });


        //회원/파트너 구분

        // 체크박스전체선택
        // $(document).ready(function () {

        $("input[type='checkbox']").each(function (i) {
          $("input[class='check-all" + i + "']").click(function () {
            // $("input[class^='check-all']").push(this.value);
            var chk = $(this).is(":checked");
            if (chk) {
              console.log($("input[name='cb" + i + "']").prop("checked", true));
            } else {
              $("input[name='cb" + i + "']").prop("checked", false);
            }
          });
        });

</script>
	</div>
</section>
<%@ include file="/views/common/footer.jsp"%>