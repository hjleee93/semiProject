<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List, com.semi.store.model.vo.Store" %>

<%
	List<Store> listStore=(List)request.getAttribute("list");
	
%>
<div class="submenu" style="background-color: cornflowerblue;">
	<!-- 관리자용 서브헤더 색깔 다르게 설정 -->
	<ul>
		<li><a class="subhome"
			href="<%=request.getContextPath()%>/main.jsp">HOME</a></li>
		<li><a class="subhome" href="#">고객예약현황</a></li>
		<li><a class="subhome" href="ptn_review.html">리뷰관리</a></li>
		<li><a class="subhome" href="ptn_qna.html">문의관리</a></li>
	</ul>
</div>
<!-- 서브메뉴 끝 -->

<!-- 본문 시작-->
<div class="cst-status">
	<h1>입점 리스트</h1>
</div>


<div class="container">
	<form id="bbsVO" name="bbsVO" action="partBbs.do" method="post">

		<input type="hidden" id="pageMode" name="pageMode" value="List">
		<input type="hidden" id="pageIndex" name="pageIndex" value="1">
		<input type="hidden" id="nttId" name="nttId" value=""> <input
			type="hidden" id="nttNo" name="nttNo" value="0"> <input
			type="hidden" id="nowNum" name="nowNum">

		<div class="board-header">
			<p class="cnt">
		<!-- 		총 게시물 : <strong>21</strong> -->
			</p>
			<div class="board-search-form">
				<label for="searchCondition" class="hidden">검색 구분</label> <select
					id="searchCondition" name="searchCondition" class="select">
					<option value="sj">제목</option>
					<option value="cn">내용</option>
					<option value="all">제목+내용</option>
				</select> <label for="searchWord" class="hidden">검색어 입력란</label> <input
					type="text" class="inp" name="searchWord" id="searchWord"
					title="검색어 입력" value="">
				<button type="button" onclick="javascript:fn_se();return false;">검색버튼</button>
			</div>
		</div>
		
	<section>
		<div class="tbl-box">
			<table class="tbl-list">

					<tr>
					<th scope="col">NO</th>
						<th scope="col">업체명</th>
						<th scope="col">승인여부</th>
					</tr>
			         <%
			         
			         if(listStore.isEmpty()){ 
			         %>
			            <tr>
							<td colspan="2">
								조회된 게시글이 없습니다!
							</td>
						</tr>
					<%}else{
						for(Store s : listStore){ 
						
					%>
					<tr>
					<td><%=s.getStoreNumber() %></td>
						<td>
							<%=s.getStoreName() %>
						</td>
						<%if(s.getStoreStatus().equals("WAITING")){ %>
						<td>
							<p class="btn btn-warning" ><%=s.getStoreStatus() %></p>
						</td>
						<%}else if(s.getStoreStatus().equals("ACCEPT")){ %>
						<td>
							<p class="btn btn-success"><%=s.getStoreStatus() %></p>
						</td>
						<%}else if(s.getStoreStatus().equals("DECLINE")){ %>
						<td>
							<p class="btn btn-danger"><%=s.getStoreStatus() %></p>
						</td>
						<%}else if(s.getStoreStatus().equals("HOLD")){ %>
						<td>
							<p class="btn btn-secondary"><%=s.getStoreStatus() %> </p>
						</td>
					<%}
						
					}}
						%>	
					 </tr>
         
			           
					   
			       </table>
			   </div>
			 </section>

 		 	<div class="board-bottom board-view-btn">
		     <div class="pageBar" id="pageBar"> 
		      <a href="javascript:void(0)" class="on" title="선택됨"></a>&nbsp;
		      <a href="?cPage=1"onclick="fn_list(1);return false; " title="페이지로 이동">1</a>&nbsp;
		      <a href="?cPage=2"onclick="fn_list(2);return false; " title="페이지로 이동">2</a>&nbsp; 
		       <a href="?cPage=3"onclick="fn_list(3);return false; " title="페이지로 이동">3</a>&nbsp; 
		     </div>
		     
<%-- 		<div id="pageBar">
			<%=request.getAttribute("pageBar") %>
		</div> --%>
		     
		     
		     
	</form>
	<!-- 본문 끝 -->


	<!-- /.container -->
</div>
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
.btn{
margin: 0 auto;

}

p.btn{

width:100px;
color:white;
}
</style>

<%@ include file="/views/common/footer.jsp"%>