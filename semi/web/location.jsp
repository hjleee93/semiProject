<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="views/common/header.jsp" %>
 <!-- 서브메뉴 -->
  <div class=submenu>
    <ul>
      <!-- <li><img src="https://image.flaticon.com/icons/svg/60/60775.svg" alt="뒤로가기" height="30px" width="auto" ></li> -->

      <!-- <li class="backbtn"><</li> -->
      <li><a class="subhome" href="<%=request.getContextPath()%>/main.jsp">HOME</a></li>
      <li><a class="subhome" href="<%=request.getContextPath()%>/location.jsp">LOCATION</a></li>
<!--       TODO:링크수정 -->
      <li><a class="subhome" href="<%=request.getContextPath()%>">CUSTOMER SERVICE</a></li>

    </ul>
  </div>
  <!-- 서브메뉴 끝 -->

  <div class="location">
    <h1>찾아오시는 길</h1>
  </div>
  <div class="container">
    <!-- Map Column -->
    <div>
      <!-- Embedded Google Map -->
      <iframe style="width: 100%; height: 500px; border: 0;"
        src="https://maps.google.com/maps?width=520&amp;height=400&amp;hl=en&amp;q=gangnam-gu,%20teheran-ro%2014,%206%20Seoul+(HYOLO%20Inc.)&amp;t=&amp;z=15&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe>
    </div>
    <!-- Contact Details Column -->

    <div class="information">
      <div class="address">
        서울특별시 강남구 역삼동 테헤란로 14길 6
        <br>
        <div class="phone d-flex align-items-center">
          <img src="https://image.flaticon.com/icons/svg/725/725606.svg" alt="전화걸기" height="20" width="auto">
          <button onclick="document.location.href='tel:010-1234-5678'">
            <a href="tel:010-1234-5678">010-1234-5678</a></button>
        </div>
      </div>


      <div class="kakaobtn" id="kakao-talk-channel-chat-button" data-channel-public-id="_FmPqK" data-title="question"
        data-size="small" data-color="mono" data-shape="pc" data-support-multiple-densities="true"></div>
    </div>
  </div>
  <div class="col-lg-1 mb-4 list_wrap" id="list-group" style="position:absolute;">
    <div class="list-group">
      <section class="cart">
        <a href="#" class="list-group-item">장바구니</a>
      </section>
      <section class="my_rsv">
        <a href="#" class="list-group-item">나의 예약</a>
      </section>
      <section class="viewed">
        <a href="#" class="list-group-item">최근 본 상품</a>
        <div class="lst">
          <ul>

            <li>
              <a href="https://www.tmon.co.kr/deal/4137848642" tl:area="SKCO" tl:ord="1051" target="_blank">
                <img src="https://th3.tmon.kr/thumbs/image/fd9/75e/ac6/7abdf9a08_320x320_95_FIT.jpg" width="56"
                  height="55" alt="" onerror="this.style.display='none'">
                <div class="frame"></div>
              </a>
            </li>

          </ul>

        </div>
      </section>
    </div>
  </div>
  <%@ include file="views/common/login.jsp" %>
</div>
  <!-- 카카오톡 문의 -->
  
  <style>
   /* 카카오톡 문의하기 아이콘 css */
    #kakao-talk-channel-chat-button {
      width: 270px;
      border-radius: 10px;
    }

    #kakao-talk-channel-chat-button a img {
      width: 100%;
      border-radius: 10px;
    }


    /*회사 상세 정보 css  */
    .location {
      margin: 50px;
    }

    .location h1 {
      font-family: 'S-CoreDream-8Heavy', sans-serif;
      text-align: center;
    }

    .address {
      float: left;
      font-family: 'S-CoreDream-8Heavy', sans-serif;
    }

    .phone {
      float: left;
      left: 100%;
    }

    .phone button {
      border: none;
      background: none;
    }

    .phone button a {
      color: #000;
    }

    .kakaobtn {

      float: right;

    }

    .information {
      height: 100px;
      width: 100%;
      margin-top: 30px;
    }
    .viewed{width: 98px;height: auto;}
    @media (max-width: 1460px) {
      #list-group{display: none;}
    }

  </style>
  <script>
  $(function () {

      $("#kakao-talk-channel-chat-button a img").attr("src", "https://mblogthumb-phinf.pstatic.net/MjAxOTAxMjNfMTY4/MDAxNTQ4MjE2NTEzMjQ0.yQF_NFXx9qo14jAIlPlrIexBOlFQwJ0YCdqNviDEFjkg.YoOlda4LU9D9UzL7A1FP54aukEL2YD-1XFOmWSsHm-Qg.PNG.bigseo/image.png?type=w800")

    });
    window.kakaoAsyncInit = function () {
      Kakao.Channel.createChatButton({
        container: '#kakao-talk-channel-chat-button',
      });
    };

    (function (d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      //TODO:이미지변경해야됨
      js.src = 'https://developers.kakao.com/sdk/js/kakao.plusfriend.min.js';
      fjs.parentNode.insertBefore(js, fjs);
    })(document, 'script', 'kakao-js-sdk');


  $(document).ready(function(){  
var $doc           = $(document);  
var position       = 0;  
var top = $doc.scrollTop(); //현재 스크롤바 위치  
var screenSize     = 0;        // 화면크기  
var halfScreenSize = 0;    // 화면의 반  

/*사용자 설정 값 시작*/  
var pageWidth      = 1000; // 페이지 폭, 단위:px  
var leftOffet      = 600;  // 중앙에서의 폭(왼쪽 -, 오른쪽 +), 단위:px  
var leftMargin     = 909; // 페이지 폭보다 화면이 작을때 옵셋, 단위:px, leftOffet과 pageWidth의 반만큼 차이가 난다.  
var speed          = 1500;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)  
var easing         = 'swing'; // 따라다니는 방법 기본 두가지 linear, swing  
var $layer         = $('#list-group'); // 레이어 셀렉팅  
var layerTopOffset = 188;   // 레이어 높이 상한선, 단위:px  
$layer.css('z-index', 10);   // 레이어 z-인덱스  
/*사용자 설정 값 끝*/  

//좌우 값을 설정하기 위한 함수  
function resetXPosition()  
{  
  $screenSize = $('body').width();// 화면크기  
  halfScreenSize = $screenSize/2;// 화면의 반  
  xPosition = halfScreenSize + leftOffet;  
  if ($screenSize < pageWidth)  
    xPosition = leftMargin;  
  $layer.css('left', xPosition);  
}  

// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해  
if (top > 0 )  
  $doc.scrollTop(layerTopOffset+top);  
else  
  $doc.scrollTop(0);  

// 최초 레이어가 있을 자리 세팅  
$layer.css('top',layerTopOffset);  
resetXPosition();  

//윈도우 크기 변경 이벤트가 발생하면  
$(window).resize(resetXPosition);  

//스크롤이벤트가 발생하면  
$(window).scroll(function(){  
  yPosition = $doc.scrollTop()+layerTopOffset;  
  $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});  
});  
});  

  </script>

<%@ include file="views/common/footer.jsp" %>