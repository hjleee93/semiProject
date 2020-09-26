<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Store> lists = (List) request.getAttribute("stores");
%>

<div class="container">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a
			href="<%=request.getContextPath()%>/main.jsp">Home</a></li>
		<li class="breadcrumb-item active">ALL</li>
	</ol>

	<div class="row">
		<%
		if(list != null){
			for (Store s : list) {
				
				
		%>

		<div class="col-lg-6 portfolio-item">
			<div class="card h-100">
				<a href="#"><img class="card-img-top"
					src="<%=request.getContextPath()%>/img/store/<%=s.getStoreMainImg()%>" alt=""></a>
				<div class="card-body">
					<h4 class="card-title">
						<a 
							href="<%=request.getContextPath()%>/store/storeDetail?storeId=<%=s.getStoreId()%>">
							<%
								System.out.println("s.getStoreId(): " + s.getStoreId());
							%> <%=s.getStoreName()%>
						</a>
					</h4>
					<p class="card-text"><%=s.getStoreContent()%></p>
				</div>
			</div>
		</div>

		<%
			}}else{%>
				
				<p>선택 하신 날짜와 카테고리에 예약 가능 한 업체가 없습니다. 다른 날짜를 선택해주세요 </p>
		<%	}%>
		
	</div>
	<!-- /.row -->

	
</div>

<%@ include file="/views/common/footer.jsp"%>