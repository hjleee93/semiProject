<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 헤더부분 스크롤이벤트 / 푸터  -->
	
    
    <script>
      //header 스크롤 이벤트 
      //스크롤 내려가면 로고랑 메뉴바 작아지게 jQuery 사용
      //상단 스크립트에 합치면 안돼요!
      $(function () {
        var lnb = $(".header").offset().top;
        $(window).scroll(function () {
          var window = $(this).scrollTop();

          if (lnb < window) {
            $(".header").addClass("on");
            $(".header .navbar-brand").addClass("on");
            $(".header .navbar-toggler").addClass("on");
            $(".header .navbar-toggler-icon").addClass("on");
          } else {
            $(".header").removeClass("on");
            $(".header .navbar-brand").removeClass("on");
            $(".header .navbar-toggler").removeClass("on");
            $(".header .navbar-toggler-icon").removeClass("on");
          }
        })
      })

    </script>
<footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  
  <script src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 
</body>
</html>