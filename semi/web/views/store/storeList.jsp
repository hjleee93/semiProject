<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	List<Store> lists = (List) request.getAttribute("stores");
%>

<div class="container">

	<!-- Page Heading/Breadcrumbs -->
	<%
		if (lists.get(0).getStoreDtlCtgry().equals("카페")) {
	%>
	<h1 class="mt-4 mb-3">
		<small>CAFE</small>
	</h1>
	<%
		} else if (lists.get(0).getStoreDtlCtgry().equals("술집")) {
	%>
	<h1 class="mt-4 mb-3">
		<small>PUB/BAR</small>
	</h1>
	<%
		} else if (lists.get(0).getStoreDtlCtgry().equals("음식점")) {
	%>
	<h1 class="mt-4 mb-3">
		<small>RESTAURANT</small>
	</h1>
	<%
		} else {
	%>
	<h1 class="mt-4 mb-3">
		<small>PUB/BAR</small>
	</h1>
	<%
		}
	%>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a
			href="<%=request.getContextPath()%>/main.jsp">Home</a></li>
		<li class="breadcrumb-item active">ALL</li>
	</ol>

	<div class="row">
		<%
			for (Store s : list) {
		%>

		<div class="col-lg-6 portfolio-item">
			<div class="card h-100">
				<a href="#"><img class="card-img-top"
					src="http://placehold.it/700x400" alt=""></a>
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
			}
		%>
	</div>
	<!-- /.row -->

	<!-- Pagination -->
	<div id="pageBar">
     	<%=request.getAttribute("pageBar") %>
    </div>
	
<!-- 	<ul class="pagination justify-content-center"> -->
<!-- 		<li class="page-item"><a class="page-link" href="#" -->
<!-- 			aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span -->
<!-- 				class="sr-only">Previous</span> -->
<!-- 		</a></li> -->
<!-- 		<li class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 		<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 		<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 		<li class="page-item"><a class="page-link" href="#" -->
<!-- 			aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span -->
<!-- 				class="sr-only">Next</span> -->
<!-- 		</a></li> -->
<!-- 	</ul> -->

</div>

<%@ include file="/views/common/footer.jsp"%>