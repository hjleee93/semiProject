<%@page import="com.semi.recommand.service.StoreRandomService"%>
<%@page import="com.semi.store.model.vo.Store"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.semi.store.model.vo.Store"%>

<%
	Store randomcafe = new StoreRandomService().selectRandomStore();
	Store randompub = new StoreRandomService().selectRandomPub();
	Store randomres = new StoreRandomService().selectRandomRes();
%>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    
    <div id="top">
	<br>
    	당신의 관심사를 선택하세요
    <br>
    <h2>TODAY'S RANDOM PICK !</h2> 
    <br>
   	<!-- <a class="nav-link active show" -->
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab1"><b>CAFE</b></a>
              </li>
               <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab2"><b>PUB & BAR</b></a>
              </li>
               <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab3"><b>RESTAURANT</b></a>
              </li>            
            </ul>
    </div>
    
    <style>
    #top {
		 width: 100%;
		 text-align: center;
		 display: inline-block;
		 }
	.nav-tabs{
		margin-top:3%;
		margin-left:10%;
		margin-right:10%;
		}
    </style>


    <br>

    <div id="container"> 
    
	<!-- 탭 콘텐츠 영역  -->
		<div class="tab_container">
	<!-- 메인 콘텐츠 영역  -->	
	    <div id="tab0" class="tab_content">

				<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
				<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
				<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>

				<div id="wrapper">
				      <div id="slider-wrap">
				          <ul id="slider">
				             <li>
				                <div>
				                    <h3> </h3>
				                    <span> </span>
				                </div>                
				<img src="https://cdn.eyesmag.com/content/uploads/sliderImages/2020/06/12/blue-bottle-cafe-gwanghwamun-03-82d2ff56-3544-46c1-9fa7-ee5651376f15.jpg?text= ">
				             </li>
				             
				             <li>
				                <div>
				                    <h3> </h3>
				                    <span> </span>
				                </div>
				<img src="https://i0.wp.com/baristanews.co.kr/wp-content/uploads/2017/07/2015-09-22-ParamountCoffeeProject-001.0.0-696x392.jpg?fit=696%2C392?text= ">
				             </li>
				             
				             <li>
				                <div>
				                    <h3> </h3>
				                    <span> </span>
				                </div>
				<img src="https://t1.daumcdn.net/cfile/tistory/245F9C3F5419AB3A32?text= ">
				             </li>
				             
				            <!--  <li>
				                <div>
				                    <h3>Slide #4</h3>
				                    <span>Sub-title #4</span>
				                </div>
				<img src="https://fakeimg.pl/350x200/0A6E0A/000?text= ">
				             </li> -->
				             
				<!--              <li>
				                <div>
				                    <h3>Slide #5</h3>
				                    <span>Sub-title #5</span>
				                </div>
				<img src="https://fakeimg.pl/350x200/0064CD/000?text=55555">
				             </li>
				              -->
				             
				          </ul>
				          
				           <!--controls-->
				          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
				          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
				          <div id="counter"></div>
				          
				          <div id="pagination-wrap">
				            <ul>
				            </ul>
				          </div>
				          <!--controls-->  
				                 
				      </div>
				   </div>
   
   <style>
   /*GLOBALS*/
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:#1bc1a3;}


#wrapper{
	display: inline-block;
    margin:25px auto;
    height:400px;
    position:relative;
    color:#fff;
    left:50%;
    transform:translateX(-50%);
    text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;
}

#slider-wrap{
    width:800px;
    height:400px;
    position:relative;
    overflow:hidden;
}

#slider-wrap ul#slider{
    width:100%;
    height:100%;
    
    position:absolute;
    top:0;
    left:0;     
}

#slider-wrap ul#slider li{
    float:left;
    position:relative;
    width:800px;
    height:400px;   
}

#slider-wrap ul#slider li > div{
    position:absolute;
    top:20px;
    left:35px;  
}

#slider-wrap ul#slider li > div h3{
    font-size:36px;
    text-transform:uppercase;   
}

#slider-wrap ul#slider li > div span{
    font-size:21px;
}

#slider-wrap ul#slider li img{
    display:block;
    width:100%;
  height: 100%;
}


/*btns*/
.btns{
    position:absolute;
    width:50px;
    height:60px;
    top:50%;
    margin-top:-25px;
    line-height:57px;
    text-align:center;
    cursor:pointer; 
    background:rgba(0,0,0,0.1);
    z-index:100;
    
    
    -webkit-user-select: none;  
    -moz-user-select: none; 
    -khtml-user-select: none; 
    -ms-user-select: none;
    
    -webkit-transition: all 0.15s ease;
    -moz-transition: all 0.15s ease;
    -o-transition: all 0.15s ease;
    -ms-transition: all 0.15s ease;
    transition: all 0.15s ease;
}

.btns:hover{
    background:rgba(0,0,0,0.3); 
}

#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
    top: 30px; 
    right:35px; 
    width:auto;
    position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*bar*/
#pagination-wrap{
    min-width:20px;
    margin-top:350px;
    margin-left: auto; 
    margin-right: auto;
    height:15px;
    position:relative;
    text-align:center;
}

#pagination-wrap ul {
    width:100%;
}

#pagination-wrap ul li{
    margin: 0 4px;
    display: inline-block;
    width:5px;
    height:5px;
    border-radius:50%;
    background:#fff;
    opacity:0.5;
    position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
    opacity:1;
    box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}




/*Header*/
h1, h2{text-shadow:none; text-align:center;}
h1{ color: #666; text-transform:uppercase;  font-size:36px;}




/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
    -webkit-transition: all 0.2s cubic-bezier(1,.01,.32,1);
    -moz-transition: all 0.2s cubic-bezier(1,.01,.32,1);
    -o-transition: all 0.2s cubic-bezier(1,.01,.32,1);
    -ms-transition: all 0.2s cubic-bezier(1,.01,.32,1);
    transition: all 0.5s cubic-bezier(1,.01,.32,1); 
}
   
   </style>
   
   <script>
 //current position
   var pos = 0;
   //number of slides
   var totalSlides = $('#slider-wrap ul li').length;
   //get the slide width
   var sliderWidth = $('#slider-wrap').width();


   $(document).ready(function(){
       /*****************
        BUILD THE SLIDER
       *****************/
       //set width to be 'x' times the number of slides
       $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
       
       //next slide    
       $('#next').click(function(){
           slideRight();
       });
       
       //previous slide
       $('#previous').click(function(){
           slideLeft();
       });
       /*************************
        //*> OPTIONAL SETTINGS
       ************************/
       //automatic slider
       var autoSlider = setInterval(slideRight, 3000);
       
       //for each slide 
       $.each($('#slider-wrap ul li'), function() { 

          //create a pagination
          var li = document.createElement('li');
          $('#pagination-wrap ul').append(li);    
       });
       
       //counter
       countSlides();
       
       //pagination
       pagination();
       
       //hide/show controls/btns when hover
       //pause automatic slide when hover
       $('#slider-wrap').hover(
         function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
         function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
       );
   });//DOCUMENT READY
   /***********
    SLIDE LEFT
   ************/
   function slideLeft(){
       pos--;
       if(pos==-1){ pos = totalSlides-1; }
       $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
       
       //*> optional
       countSlides();
       pagination();
   }
   /************
    SLIDE RIGHT
   *************/
   function slideRight(){
       pos++;
       if(pos==totalSlides){ pos = 0; }
       $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
       
       //*> optional 
       countSlides();
       pagination();
   }
   /************************
    //*> OPTIONAL SETTINGS
   ************************/
   function countSlides(){
       $('#counter').html(pos+1 + ' / ' + totalSlides);
   }

   function pagination(){
       $('#pagination-wrap ul li').removeClass('active');
       $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
   }
   </script>
<!-- 메인페이지 끝 -->


		</div>
	    </div>
<!-- 탭 버튼 화면 시작 -->
    <!-- 탭1 콘텐츠 영역  -->
	    <div id="tab1" class="tab_content">
	    	<!-- 상단 해당 스토어 설명 추가 부분-->
	    	<div class="plus_content">
		    	<div class="card-body">
		    	<h6>★★★★☆</h6>
		            <h4 class="card-title">
		            <%=randomcafe.getStoreName()%>&nbsp;&nbsp;
			     	<button class="btn btn-primary">바로 예약하기</button>
		            </h4>
		            <p class="card-text">
		           	커피전문점 카페 <%=randomcafe.getStoreName()%> 에서 잔잔한 음악과 함께 크리미한 커피로 좋은 기운을 느끼고 가세요.
		           	<br><small>홈페이지</small> : <%=randomcafe.getStorePage() %> <small>전화번호 : <%=randomcafe.getStorePhone() %></small> 
		            </p>
	          	</div>
	    	</div>
	    	<!-- 스토어 이미지 영역 시작 -->
	      		<div class="parent">
 			        <div class="first" >
 			        	<img src="https://fastly.4sqi.net/img/general/600x600/213211_WFOC4fCCjnhLe-poxWalcrB3KpBFswHVBkprDLAwkhU.jpg"
 			        		style="width: 150%; heigh:auto; vertical-align: middle" />
 			        </div> 
 			        <div class="second">
							<figure class="snip1384">
							  <img src="https://post-phinf.pstatic.net/MjAxODExMTVfNTMg/MDAxNTQyMjQ1ODk2ODM5.PVIXR7G_y8Q33q3fvGoyeH0XXqfoEp5ENl8isfUbhWQg.ysI1OYX58CepfbHSx-sTMPIoWhROTIrfytP_OIo6Gjsg.JPEG/%EC%BA%90%EC%B9%98%EC%B9%B4%ED%8E%98_%EC%82%AC%EC%A7%84015%2820181029%29.JPG?type=w1200">
							  <figcaption>
							    <h3><%=randomcafe.getStoreContent()%></h3>
							    <p><%=randomcafe.getStoreAddress()%> <%=randomcafe.getStoreDtlAddr()%> <%=randomcafe.getStoreExtraAddr()%></p><i class="ion-ios-arrow-right"></i>
							  </figcaption>
							  <a href="#"></a>
							</figure>
 			        </div>
 			        <div class="third">
 			        	<img src="https://t1.daumcdn.net/cfile/tistory/9918633E5D45467406"
 			        		style="width: 200%; heigh:auto; vertical-align: middle"/>
 			        </div> 
			    </div>
	    </div>
	    
	    
    <!-- 탭2 콘텐츠 영역  -->
	    <div id="tab2" class="tab_content">
	    	<!-- 상단 해당 스토어 설명 추가 부분-->
	    	<div class="plus_content">
		    	<div class="card-body">
		    	<h6>★★★★★</h6>
		            <h4 class="card-title"> 
		             <%=randompub.getStoreName()%>&nbsp;&nbsp;
		             <button class="btn btn-primary">바로 예약하기</button>
		            </h4>
		            <p class="card-text">
		           	분위기를 만끽하면서 술을 마시고 싶다면 <%=randompub.getStoreName() %>를 방문하세요, 합리적인 가격과 맛을 즐길 수 있습니다.
		           	<br><small>홈페이지</small> : <%=randompub.getStorePage() %> <small>전화번호 : <%=randompub.getStorePhone() %></small>
		            </p>
	          	</div>
	    	</div>
	    	<!-- 스토어 이미지 영역 시작 -->
	      		<div class="parent">
 			        <div class="first" >
 			        	<img src="https://fastly.4sqi.net/img/general/600x600/213211_WFOC4fCCjnhLe-poxWalcrB3KpBFswHVBkprDLAwkhU.jpg"
 			        		style="width: 150%; heigh:auto; vertical-align: middle" />
 			        </div> 
 			        <div class="second">
							<figure class="snip1384">
							  <img src="https://post-phinf.pstatic.net/MjAxODExMTVfNTMg/MDAxNTQyMjQ1ODk2ODM5.PVIXR7G_y8Q33q3fvGoyeH0XXqfoEp5ENl8isfUbhWQg.ysI1OYX58CepfbHSx-sTMPIoWhROTIrfytP_OIo6Gjsg.JPEG/%EC%BA%90%EC%B9%98%EC%B9%B4%ED%8E%98_%EC%82%AC%EC%A7%84015%2820181029%29.JPG?type=w1200">
							  <figcaption>
							    <h3><%=randompub.getStoreContent() %></h3>
							    <p><%=randompub.getStoreAddress()%> <%=randompub.getStoreDtlAddr()%> <%=randompub.getStoreExtraAddr()%></p><i class="ion-ios-arrow-right"></i>
							  </figcaption>
							  <a href="#"></a>
							</figure>
 			        </div>
 			        <div class="third">
 			        	<img src="https://t1.daumcdn.net/cfile/tistory/9918633E5D45467406"
 			        		style="width: 200%; heigh:auto; vertical-align: middle"/>
 			        </div> 
			    </div>
	    </div>
	    
	<!-- 탭3 콘텐츠 영역  -->
	    <div id="tab3" class="tab_content">
	    	<!-- 상단 해당 스토어 설명 추가 부분-->
	    	<div class="plus_content">
		    	<div class="card-body">
		    	<h6>★★★★☆</h6>
					<h4 class="card-title"> 
		            <%=randomres.getStoreName()%>&nbsp;&nbsp;
		            <button class="btn btn-primary">바로 예약하기</button>
		            </h4>
		            <p class="card-text">
		           	감각적인 인테리어와 매력적인 외관을 가진 곳 <%=randomres.getStoreName() %>에서 멋진 데이트와 식사를 제공합니다.
		           	<br><small>홈페이지</small> : <%=randomres.getStorePage() %> <small>전화번호 : <%=randomres.getStorePhone() %></small>
		            </p>
	          	</div>
	    	</div>
	    	<!-- 스토어 이미지 영역 시작 -->
	      		<div class="parent">
 			        <div class="first" >
 			        	<img src="https://fastly.4sqi.net/img/general/600x600/213211_WFOC4fCCjnhLe-poxWalcrB3KpBFswHVBkprDLAwkhU.jpg"
 			        		style="width: 150%; heigh:auto; vertical-align: middle" />
 			        </div> 
 			        <div class="second">
							<figure class="snip1384">
							  <img src="https://post-phinf.pstatic.net/MjAxODExMTVfNTMg/MDAxNTQyMjQ1ODk2ODM5.PVIXR7G_y8Q33q3fvGoyeH0XXqfoEp5ENl8isfUbhWQg.ysI1OYX58CepfbHSx-sTMPIoWhROTIrfytP_OIo6Gjsg.JPEG/%EC%BA%90%EC%B9%98%EC%B9%B4%ED%8E%98_%EC%82%AC%EC%A7%84015%2820181029%29.JPG?type=w1200">
							  <figcaption>
							  <h3><%=randomres.getStoreContent() %></h3>
							  <p><%=randomres.getStoreAddress()%> <%=randomres.getStoreDtlAddr()%> <%=randomres.getStoreExtraAddr()%></p><i class="ion-ios-arrow-right"></i>
							  </figcaption>
							  <a href="#"></a>
							</figure>
 			        </div>
 			        <div class="third">
 			        	<img src="https://t1.daumcdn.net/cfile/tistory/9918633E5D45467406"
 			        		style="width: 200%; heigh:auto; vertical-align: middle"/>
 			        </div> 
			    </div>
	    </div>

	
	<style type="text/css">
	
	.tab_content{
	/* border:1px red solid; */
	height:800px;
	}
	.plus_content{
	height:120px;
	width:57%;
	margin:15px;
	margin-left:9.5%;
	text-align:left;
	margin-bottom:3%;
	}
	
	/* 메인페이지 효과 */
	.first_main{
	  background-image: url('https://img.freepik.com/free-vector/abstract-pastel-rainbow-gradient-background-ecology-concept-for-your-graphic-design_29865-1420.jpg?size=626&ext=jpg');
	  background-size: 100%;
	  height: 350px;
	  text-align: center;
	  padding-top: 150px;
	  color: white;
	  font-size:155px;
	  overflow: hidden;
	    	    
	    
	}
	
	.parent{
	    width: 80%;
	    height: 600px;
	    margin: 20px auto;
	}
	.first{
		overflow: hidden;
	    float: left;
	    width:27%;
	    height:60%;
	    box-sizing: border-box;
	    box-shadow: 1px 1px 2px #999;
	}
	.second{
/* 	    border: 1px solid green; */
	    float: left;
	    margin-left: 2%;
	    width:42%;
	    height:60%;
	    box-sizing: border-box;
	    box-shadow: 1px 1px 2px #999;
	}
	.third{
		overflow: hidden;
	    float: right;
	    width:27%;
	    height:60%;
	    box-sizing: border-box;
		box-shadow: 1px 1px 2px #999;
	}
	body {
	   /*  font-family:"Malgun Gothic"; */
	    font-size: 0.8em;
	}
	.nav-link{
	color:dark grey;
	}
	</style>
	
	<!-- 중간 호버 효과 스타일 -->
	<style>
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  width: 100%;
  height: 100%;
  color: white;
  text-align: left;
  font-size: 16px;
  background-color: gray;
}
/* figure.snip1384 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
} */
figure.snip1384 img {
  height:400px;
  width:550px;
  /* max-width: 100%; */
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
}
figure.snip1384 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1384 h3,
figure.snip1384 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1384 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1384 p {
  font-size: 0.8em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1384 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,
figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}
	</style>

	<script>
	/* Demo purposes only */
	$(".hover").mouseleave(
	  function () {
	    $(this).removeClass("hover");
	  }
	);s
	</script>
	
	
	
	
	

    
	</div> <!--탭 콘텐츠 영역 끝  -->
</div> <!-- wrapper div 닫음 -->


    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
        	
            //When page loads...
            $(".tab_content").hide(); //Hide all content
            $("ul.nav-tabs li:first").addClass("active").show(); //Activate first tab
            $(".tab_content:first").show(); //Show first tab content

            //On Click Event
            $("ul.nav-tabs li").click(function() {

                $("ul.nav-tabs li").removeClass("active"); //Remove any "active" class
                $(this).addClass("active"); //Add "active" class to selected tab
                $(".tab_content").hide(); //Hide all tab content

                var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
                $(activeTab).fadeIn(); //Fade in the active ID content
                return false;
            });

        });
    </script>






<%@ include file="/views/common/footer.jsp"%>
