<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<style>
.mptitle {
	margin: 50px;
}

    .mptitle h1 {
	font-family: 'S-CoreDream-8Heavy', sans-serif;
	text-align: center;
	    margin: 50px;
    padding-top: 35px;
}
    h3, p, a{
     font-family: 'JSDongkang-Regular';
    }
.row:last-child{
margin-bottom: 30px;}
</style>

<div class="container">

    <div class="mptitle">
    <h1 class="mt-4 mb-3">HYOLO에 등록된 업체 카테고리</h1>
</div>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="<%=request.getContextPath()%>/main.jsp">Home</a>
      </li>
      <li class="breadcrumb-item active">ALL</li>
      
    </ol>

    <!-- Project One -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="https://cdn.pixabay.com/photo/2016/02/19/11/40/coffee-shop-1209863_1280.jpg" alt="cafe">
        </a>
      </div>
      <div class="col-md-5">
        <h3>CAFE</h3>
        <p>HYOLO에 등록된 다양한 분위기의 카페를 둘러보고 예약하세요</p>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=cafe">둘러보기
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Project Two -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="https://cdn.pixabay.com/photo/2013/11/12/01/29/bar-209148_1280.jpg" alt="pub">
        </a>
      </div>
      <div class="col-md-5">
        <h3>PUB/BAR</h3>
        <p>HYOLO에 등록된 다양한 술집을 둘러보고 예약하세요</p>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=pub">둘러보기
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Project Three -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="https://cdn.pixabay.com/photo/2017/01/26/02/06/platter-2009590_1280.jpg" alt="restaurant">
        </a>
      </div>
      <div class="col-md-5">
        <h3>RESTAURANT</h3>
        <p>HYOLO에 등록된 다양하고 맛있는 식당을 둘러보고 예약하세요</p>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/store/storeCtgry?storeDtlCtgry=restaurant">둘러보기
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    </div>
    <!-- /.row -->

    <hr>

    <!-- Project Four -->
<!--     <div class="row"> -->

<!--       <div class="col-md-7"> -->
<!--         <a href="#"> -->
<!--           <img class="img-fluid rounded mb-3 mb-md-0" src="http://placehold.it/700x300" alt=""> -->
<!--         </a> -->
<!--       </div> -->
<!--       <div class="col-md-5"> -->
<!--         <h3>Project Four</h3> -->
<!--         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, quidem, consectetur, officia rem -->
<!--           officiis illum aliquam perspiciatis aspernatur quod modi hic nemo qui soluta aut eius fugit quam in suscipit? -->
<!--         </p> -->
<!--         <a class="btn btn-primary" href="#">View Project -->
<!--           <span class="glyphicon glyphicon-chevron-right"></span> -->
<!--         </a> -->
<!--       </div> -->
<!--     </div> -->
    <!-- /.row -->

   </div>


<%@ include file="/views/common/footer.jsp"%>