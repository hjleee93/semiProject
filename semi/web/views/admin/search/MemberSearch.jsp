<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.semi.member.model.vo.*"%>
<script src="<%=request.getContextPath()%>/js/jquery-1.3.2.min.js"></script>
<%
	List<TotalMember> searchmemlist = (List)request.getAttribute("searchmemlist");
%>
<style>
#member, #partner {
	display: none;
}

table {
	position: relative;
	font-family: futura-pt, sans-serif;
	font-weight: 400;
	font-style: normal;
	font-size: 0.7em;
	border-collapse: collapse;
	width: 95%;
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
	color:tomato;
}

table, td {
	padding: 8px 8px 8px 20px;
}

tr:nth-child(even) {
	background-color: #eff2f5;
}

tr:hover {
	background-color: rgba(114, 114, 113, 0.2);
}

.search-container {
	width: 100%;
	height: 100%;
	overflow: auto;
}
h3{
	font-family: 'S-CoreDream-8Heavy', sans-serif;
      text-align: center;
}
div#base>table tr td{
	font-size:20px;
	font-weight:bold;
	text-align:center;
	padding:10%;
	
}
#keyword{
	margin-bottom:4%;
	height:30px;
	width:200px;
	float:right;
	border-radius: 15px;
	box-shadow: 0px 0px 10px rgba(114, 114, 113, 0.5);
	border:none;
	margin-right:3%;
}
#memberselect{
	float:left;
	height:30px;
	width:80px;
	border-radius: 15px;
	box-shadow: 0px 0px 10px rgba(114, 114, 113, 0.5);
	border:1px white solid;
	margin-left:3%
}
#pageBar{
   	text-align:center;
   	margin:10%;
   	font-size:20px;
} 
#pageBar a{color:#000;}
#pageBar a:link{color:mediumpurple;}

#pageBar>.num:hover{
	color:mediumpurple;
	font-weight:bolder;
	text-decoration:underline;
}	
</style>
<section>
	<!-- 회원조회테이블팝업 -->
	<div class="search-container">
		<h3 class="card-title text-center"><span id="sep"></span>조회</h3>
		<div class="select">
				<select id="memberselect" onchange="change();">
					<option value="">조회</option>
					<option value="member">회원</option>
					<option value="partner">파트너</option>
				</select>
			<form action="">
				<input type="search" name="keyword" id="keyword" list="list" placeholder="아이디로 검색">
				<datalist id="list"></datalist> 
			</form>
		</div>
		
		<!-- </div> -->
		<div class="table-responsive" id="base">
			<table class="table">
				<tbody>
					<tr>
						<td colspan="10">회원구분을 선택해주세요.</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- card-body -->

		<div class="table-responsive" id="member">
			<table class="table" id="tbl-list">
				<colgroup>
					<col width="50px">
					<col width="100px">
					<col width="50px">
					<col width="50px">
					<col width="100px">
					<col width="130px">
					<col width="100px">
					<col width="200px">
					<col width="120px">
					<col width="100px">
				</colgroup>
				<thead>
				<%-- <div id="pageBar">
        			<%=request.getAttribute("pageBar") %>
        		</div> --%>
					<tr>
						<th><input type="checkbox" name="all" class="check-all">
						</th>
						<th>ID</th>
						<th>NAME</th>
						<th>GENDER</th>
						<th>BIRTHDAY</th>
						<th>EMAIL</th>
						<th>PHONE</th>
						<th>ADDRESS</th>
						<th>CATEGORY</th>
						<th>ENROLLDATE</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (searchmemlist.isEmpty()) {
					%>
					<tr>
						<td colspan="10">조회된 회원이 없습니다.</td>
					</tr>
					<%
						} else {
						for (TotalMember t : searchmemlist) {
							if(t.getMemberSep().equals("회원")){
					%>					
					<tr>
						<td><a><input type="checkbox" name="cb" class="cb"></a></td>
						<td><%=t.getMemberId()%></td>
						<td><%=t.getMemberName()%></td>
						<td><%=t.getGender()%></td>
						<td><%=t.getBirthday()%></td>
						<td><%=t.getMemberEmail()%></td>
						<td><%=t.getMemberPhone()%></td>
						<td><%=t.getMemAddress()%></td>
						<td><%=t.getCategory()%></td>
						<td><%=t.getMemberEnrolldate()%></td>
					</tr>
					<%
						}
					  }
					}
					%>
				</tbody>
			</table>
		</div>
		<!-- membersearch end -->
		<!-- 파트너조회테이블팝업 -->
		<div class="table-responsive" id="partner">
			<table class="table" id="tbl-list2">
				<thead>
				<%-- <div id="pageBar">
	        		<%=request.getAttribute("pageBar") %>
	        	</div> --%>
					<tr>
						<th><input type="checkbox" name="all" class="check-all">
						</th>
						<th>ID</th>
						<th>NAME</th>
						<th>EMAIL</th>
						<th>PHONE</th>
						<th>ADDRESS</th>
						<th>ENROLLDATE</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (searchmemlist.isEmpty()) {
					%>
					<tr>
						<td colspan="7">조회된 회원이 없습니다.</td>
					</tr>
					<%
						} else {
						for (TotalMember t : searchmemlist) {
							if(t.getMemberSep().equals("파트너")){
					%>
					
					<tr>
						<td><a><input type="checkbox" name="cb" class="cb"></a></td>
						<td><%=t.getMemberId()%></td>
						<td><%=t.getMemberName()%></td>
						<td><%=t.getMemberEmail()%></td>
						<td><%=t.getMemberPhone()%></td>
						<td><%=t.getMemAddress()%></td>
						<td><%=t.getMemberEnrolldate()%></td>
					</tr>
					<%
						}
					  }
					}
					%>
				</tbody>
			</table>
		</div>
		<!-- 파트너끝 -->
	</div>
	<script>
		function change() {
			if ($("#memberselect").val() == 'member') {
				$("#member").show();
				$("#partner").hide();
				$("#base").hide();
				$("#sep").html("회원");
			} else if ($("#memberselect").val() == 'partner') {
				$("#partner").show();
				$("#member").hide();
				$("#base").hide();
				$("#sep").html("파트너");
			} else {
				alert("조회하실 회원을 선택하세요");
			}
		};

		$(function() {
			$("input[name='keyword']").keyup(function(){
				var temp="";
				var k = $(this).val();
				$("#tbl-list>tbody>tr").hide();
				$("#tbl-list2>tbody>tr").hide();
				if($("#memberselect").val()=='member'){
				temp=$("#tbl-list>tbody>tr>td:nth-child(2):contains('"+k+"')");
				}
				if($("#memberselect").val()=='partner'){
					temp=$("#tbl-list2>tbody>tr>td:nth-child(2):contains('"+k+"')");
				}
				$(temp).parent().show();
				
			})
			
			$("[name=keyword]").keyup(e => {
				$.ajax({
					url:"<%=request.getContextPath()%>/admin/search/member.do",
					data:{"keyword":$(e.target).val()},
					type:"post",
					dateType:"text",
					success:function(data){
						console.log(data);
						let datas=data.split(",");
						$("#list").html("");
						$.each(datas,function(i,v){
							$("#list").append($("<option value="+v+">").html(v));
						});
					}
				});
			});

			//체크박스전체선택
			$("input[type='checkbox']").each(
		function(i) {
			$("input[class='check-all']").click(
		function() {
			var chk = $(this).is(":checked");
			if (chk) {
				console.log($("input[name='cb']").prop("checked", true));
			} else {
				$("input[name='cb']").prop("checked",false);
			}
		});
		});
		});
	</script>
</section>

