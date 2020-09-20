<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/adminmenubar.jsp"%>
<%@ page import="com.semi.admin.store.vo.*,java.util.List"%>
<!-- custom css -->
<link href="<%=request.getContextPath()%>/css/storeApprovalbutton.css"
	rel="stylesheet">

<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<%
	List<Store> list = (List)request.getAttribute("list");
%>
<section>
	<!-- 본문 시작-->
	<!-- 여기에 코드 추가! -->
	<div class="mptitle">
		<h1>입점현황</h1>
	</div>
	<div class="container">

	<div class="select">
		<select id="select" onchange="change();">
			<option value="waiting">입점신청현황</option>
			<option value="accept">입점완료현황</option>
			<option value="hold">입점보류현황</option>
			<option value="decline">입점취소현황</option>
		</select>
	</div>
	<div id="storerequest" class="card margin-table">
		<div class="card-body">
			<h3 class="card-title text-center">입점신청</h3>
			<div class="buttondiv">
				<button type="button" class="btn btn-success" id="approvalbtn"
					name="승인" onclick="acceptBtn();"></button>
				<button type="button" class="btn btn-warning" id="holdbtn"
					name="보류"></button>
				<button type="button" class="btn btn-danger" id="cancelbtn"
					name="취소"></button>
			</div>
			<div class="table-responsive">
			<form name="requestFrm" action="" method="post">
				<table class="table" id="tableup">
					<thead>
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
						<%if(list.isEmpty()){ %>
						<tr>
							<td colspan="9">조회된 게시글이 없습니다.</td>
						</tr>
						<%}else{
                				for(Store s : list) {
                					if(s.getJoinStatus().equals("WAITING")){
              				%>
						<tr>
							<td><input type="checkbox" name="cb1" id="cb1" class="cb1"></td>
							<td><%=s.getStoreName() %></td>
							<td><%=s.getDetailCategory() %></td>
							<td><%=s.getPhone() %></td>
							<td><%=s.getStoreAddr() %></td>
							<td><%=s.getStoreContent() %></td>
							<td><%=s.getHomepage() %></td>
							<td><%=s.getJoinStatus() %></td>
							<td>
								<input type="hidden" name="id" id="id" value="<%=s.getStoreId() %>">
							</td>
							
						</tr>
						<%}
           				 } 
						}%>
					</tbody>
					</table>
					<div id="pageBar">
						<%=request.getAttribute("pageBar") %>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="approval" class="card margin-table approval">
		<div class="card-body">
			<h3 class="card-title text-center">입점완료</h3>
			<div class="table-responsive">
			<form name="acceptFrm" action="" method="post">
				<table class="table" id="tablesuccess">
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
						<%if(list.isEmpty()){ %>
						<tr>
							<td colspan="9">조회된 게시글이 없습니다.</td>
						</tr>
						<%}else{
                				for(Store s : list) {
                					if(s.getJoinStatus().equals("ACCEPT")){
              				%>
						<tr>
							<td><input type="checkbox" name="cb2" class="cb2"></td>
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
				<div id="pageBar">
						<%=request.getAttribute("pageBar") %>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="hold" class="card margin-table">
		<div class="card-body">
			<h3 class="card-title text-center">입점보류</h3>
			<div class="buttondiv">
				<button type="button" class="btn btn-info" id="reason"></button>
			</div>
			<div class="table-responsive">
			<form name="holdFrm" action="" method="post">
				<table class="table" id="tablehold">
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
						<%if(list.isEmpty()){ %>
						<tr>
							<td colspan="9">조회된 게시글이 없습니다.</td>
						</tr>
						<%}else{
                				for(Store s : list) {
                					if(s.getJoinStatus().equals("HOLD")){
              				%>
						<tr>
							<td><input type="checkbox" name="cb3" class="cb3"></td>
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
				<div id="pageBar">
						<%=request.getAttribute("pageBar") %>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="cancel" class="card margin-table">
		<div class="card-body">
			<h3 class="card-title text-center">입점취소</h3>
			<div class="buttondiv">
				<button type="button" class="btn btn-info" id="cancelreason"></button>
			</div>
			<div class="table-responsive">
			<form name="cancelFrm" action="" method="post">
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
						<%if(list.isEmpty()){ %>
						<tr>
							<td colspan="9">조회된 게시글이 없습니다.</td>
						</tr>
						<%}else{
                				for(Store s : list) {
                					if(s.getJoinStatus().equals("DECLINE")){
              				%>
						<tr>
							<td><input type="checkbox" name="cb4" class="cb4"></td>
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
				<div id="pageBar">
						<%=request.getAttribute("pageBar") %>
					</div>
				</form>
			</div>
		</div>
	</div>
		<%-- <div id="pageBar">
			<%=request.getAttribute("pageBar") %>
		</div> --%>
		<!-- 입점현황 end -->
	</div>
	<!-- container end -->


	<script>
      
      function change() {
			if ($("#select").val() == 'accept') {
				$("#storerequest").hide();
				$("#approval").show();
				$("#hold").hide();
				$("#cancel").hide();
			} else if($("#select").val() == 'hold'){ 
				$("#storerequest").hide();
				$("#approval").hide();
				$("#hold").show();
				$("#cancel").hide();
			} else if($("#select").val() == 'decline'){
				$("#storerequest").hide();
				$("#approval").hide();
				$("#hold").hide();
				$("#cancel").show();
			}else{
				$("#storerequest").show();
				$("#approval").hide();
				$("#hold").hide();
				$("#cancel").hide();
			}
		};
       function acceptBtn(){
    	   const frm = $("[name=requestFrm]");
			const url="<%=request.getContextPath()%>/admin/store/accept";
			const check = $("input:checkbox[name=cb1]").is(":checked");
				
			if(check==true){
					frm.attr({
						"action":url,
						"method":"post",
					});
					frm.submit();
			}else{
				alert("asdfasdf");
			}
		};
       
        $(document).ready(function () {
	
        	/* $("#cb1").on("click", function() { 
        		if ($(this).prop("checked",true)) { 
        			$(this).parent().addClass("selected"); 
       			} else { 
       				$(this).parent().removeClass("selected"); 
       			} 
       		}); */

        	
        	
        	
        // 체크박스전체선택
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
        
        });

       

        //사유버튼 prompt?
        $("#reason").click(function(){ 
            prompt("보류사유를 작성해주세요","서류불충분으로 인해 보류되었습니다.");
            // if()
        });
        $("#cancelreason").click(function(){
          prompt("취소사유를 작성해주세요","조건에 해당하지 않습니다. 신청해주셔서 감사합니다.");
        })

       
      </script>
	<!-- container end -->
	</div>
	<style>
#pageBar{
	text-align:center;
}
#approval, #hold, #cancel {
	display: none;
}

.buttondiv {
	float: right;
	margin-right: 5%;
}

.table-responsive {
	position: relative;
	width: 1000px;
	margin: 20px auto;
	padding-top: 43px;
	max-height: 500px;
	/* overflow-x: auto;
	overflow-y: auto; */
	padding: 20px;
}

.margin-table {
	margin-bottom: 7%;
}

.mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
	margin: 50px;
	margin-top: 5%;
	margin-bottom: 5%;
}

.select {
	margin-bottom: 3%;
}

#select {
	height: 30px;
}

table {
	position: relative;
	font-family: futura-pt, sans-serif;
	font-weight: 400;
	font-style: normal;
	font-size: 0.8em;
	border-collapse: collapse;
	width: 90%;
	border-radius: 15px;
	box-shadow: 0px 0px 10px rgba(114, 114, 113, 0.5);
	overflow: auto;
	overflow-x: scroll;
	overflow-y: scroll;
	margin: auto;
}

th {
	font-size: 15px;
	text-align: left;
	padding: 20px 20px 20px 20px;
	background-color: white;
	color: mediumpurple;
}

table, td {
	padding: 8px 8px 8px 20px;
}

tr:nth-child(even) {
	background-color: #eff2f5;
}

tr:hover {
	font-weight: bold;
}
</style>


	<!-- 본문 끝 -->
	</div>
</section>


<!-- /.container -->

<%@ include file="/views/common/footer.jsp"%>