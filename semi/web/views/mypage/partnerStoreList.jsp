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
	<h1>입점 리스트 현황</h1>
</div>


<div class="container">
	

		
	<section>
		<div class="tbl-box">
			<table class="tbl-list">

					<tr>
					<th scope="col">분류</th>
						<th scope="col">업체명</th>
						<th scope="col" style="width:30%">승인여부</th>
					</tr>
			         <%
			         
			         if(listStore == null){ 
			         %>
			            <tr>
							<td colspan="2">
								등록된 입점 리스트가 없습니다!
							</td>
						</tr>
					<%}else{
						for(Store s : listStore){ 
							
							System.out.println("s in list jsp: " + s);
					%>
					<tr>
					<td><%=s.getStoreDtlCtgry()%></td>
						<td >
							<a  style="display: inline-block;"><%=s.getStoreName() %></a>
						</td>
						<%if(s.getStoreStatus().equals("WAITING")){ %>
						<td>
							<p class="btn btn-warning" ><%=s.getStoreStatus() %></p>
						</td>
						<%}else if(s.getStoreStatus().equals("ACCEPT")){ %>
						<td>
							<p class="btn btn-success" onclick="location='<%=request.getContextPath()%>/store/storeInfoUpdate?storeId=<%=s.getStoreId()%>'" ><%=s.getStoreStatus() %></p>
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
			       <div class="mm"></div>
			       
			   </div>
			 </section>

		     
<!-- 	 		<div id="pageBar" class="paging"> -->
<%-- 				<%=request.getAttribute("pageBar") %> --%>
<!-- 			</div> -->
		     
		   
	<!-- 본문 끝 -->


	<!-- /.container -->
</div>

<style>

.mm{
	margin:20%;
}


#pageBar{
	       text-align:center;
	       margin:10%;
	       font-size:20px;
		}	
		    
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
p,input,button,tr,th,a,td{
 font-family: 'JSDongkang-Regular';
}
</style>

<%@ include file="/views/common/footer.jsp"%>