<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Store> lists = (List) request.getAttribute("stores");

%>

<style>
  
    h3, p, a{
     font-family: 'JSDongkang-Regular';
    }
</style>
<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	
	<%if(lists != null || lists.size() != 0){
		if (lists.get(0).getStoreDtlCtgry().equals("cafe")) {
	%>
	<h1 class="mt-4 mb-3">
		CAFE
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a
			href="<%=request.getContextPath()%>/main.jsp">Home</a></li>
		<li class="breadcrumb-item active">CAFE</li>
	</ol>
	<%
		} else if (lists.get(0).getStoreDtlCtgry().equals("pub")) {
	%>
	<h1 class="mt-4 mb-3">
		PUB/BAR
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a
			href="<%=request.getContextPath()%>/main.jsp">Home</a></li>
		<li class="breadcrumb-item active">PUB</li>
	</ol>
	<%
		} else if (lists.get(0).getStoreDtlCtgry().equals("restaurant")) {
	%>
	<h1 class="mt-4 mb-3">
		RESTAURANT
	</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a
			href="<%=request.getContextPath()%>/main.jsp">Home</a></li>
		<li class="breadcrumb-item active">RESTAURANT</li>
	</ol>
	<%
		}
		}else{
			%>
			<p>HYOLO에 등록된 업체가 없습니다</p>
			<%
		}
	%>
	

	<div class="row">
		<%
		if(list != null){
			for (Store s : list) {
		%>

		<div class="col-lg-6 portfolio-item">
			<div class="card h-100">
				<a href="<%=request.getContextPath()%>/store/storeDetail?storeId=<%=s.getStoreId()%>"><img class="card-img-top"
					src="<%=request.getContextPath()%>/img/store/<%=s.getStoreDtlImg()%>" alt=""></a>
				<div class="card-body">
					<h4 class="card-title">
						<a style="text-decoration:none; color:black;"
							href="<%=request.getContextPath()%>/store/storeDetail?storeId=<%=s.getStoreId()%>">
							<%=s.getStoreName()%>
						</a>
					</h4>
					<p class="card-text"><%=s.getStoreContent()%></p>
				</div>
			</div>
		</div>

		<%
			}}else{%>
				
				<p>HYOLO에 등록된 업체가 없습니다.</p>
		<%	}%>
		
	</div>

	
</div>

<%@ include file="/views/common/footer.jsp"%>