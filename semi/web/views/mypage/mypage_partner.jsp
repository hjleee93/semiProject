<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.semi.member.model.vo.*"%>


<%

int cnt1 = (Integer)request.getAttribute("mypageCount");
int cnt2 = (Integer)request.getAttribute("mypageCount2");


	TotalMember t = (TotalMember)request.getAttribute("customer");
 	Member MemLoggined = (Member)session.getAttribute("Memberloggined");

	Cookie[] cookies = request.getCookies();
	String saveId = null;
	if(cookies!=null){
		for(Cookie c : cookies){
			if(c.getName().equals("saveId")){
				saveId=c.getValue();
				break;
			}
		}
	}
	
	  int ptnNum = MemLoggined.getMemberNum(); 
%>

  <style>
  

    @media (max-width: 991px) {
          .child2{display: flex; height: auto !important;justify-content: center;padding-bottom: 7%; }
          .child2 table tbody tr, .child2 table tbody tr td{display: block; width: 100%;}
          .box1{margin-top: 15% !important; margin-left: 0 !important; }
          .box2, .box3{width:100% !important; margin-top: 5% !important;margin-left: 0 !important;}
        }
  </style>
  
</head>

<body>

  <!-- 서브메뉴 -->
  <div class=submenu>
     <ul>
      <!-- <li><img src="https://image.flaticon.com/icons/svg/60/60775.svg" alt="뒤로가기" height="30px" width="auto" ></li> -->

      <!-- <li class="backbtn"><</li> -->
      <li><a class="subhome" href="<%=request.getContextPath()%>/main.jsp">HOME</a></li>
      <li><a class="subhome" href="<%=request.getContextPath()%>/notice">NOTICE</a></li>
      <li><a class="subhome" href="<%=request.getContextPath()%>/location.jsp">LOCATION</a></li>

      <li> <a
								class="subhome" href="<%=request.getContextPath()%>/qna">Q&A</a></li>

    </ul>
   </div> 
    <!-- Page Heading/Breadcrumbs -->
    <div class="mptitle"><h1>M Y P A G E</h1></div>                                                  
                                                    
    <!-- Page Content -->
    <div class="container">

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="<%=request.getContextPath()%>/main.jsp">Home</a>
        </li>
        <li class="breadcrumb-item active">mypage</li>
      </ol>
      
<%if(MemLoggined.getMemberSep().equals("파트너")){ %>
    <div class="parent" style="width: 100%;">
      <div class="child1" style="background-color:rgba(189, 189, 189, 0.119)">
        <img src="${pageContext.request.contextPath}/img/partner.png" height="200px" width="200px" class="mong" >
        <p class="profile1">Hello! Partner <b><%=MemLoggined.getMemberId()%></b></p> 
          <table class="profilebox">
            <tr>
              <td class="profilebox1"><a href="<%=request.getContextPath()%>/views/partner/ptnRequest1.jsp">입점등록하기</a></td>
              <td class="profilebox2"><a href="<%=request.getContextPath()%>/ptnstorelist?no=<%=ptnNum %>">입점리스트 조회</a></td>
            </tr>
            <tr>
              <td class="profilebox1"><a href="<%=request.getContextPath()%>/partner/memberView?id=<%=MemLoggined.getMemberId()%>">파트너 정보수정</a></td>
              <td class="profilebox2"><a href="<%=request.getContextPath()%>/movewith">파트너 탈퇴</a></td>
            </tr>
            <tr>
              <td class="profilebox3"><a href="">입점취소 및 해지</a></td>
              <td><a href="">업체 정보 수정</a></td>
            </tr>
          </table>
        </div>
      <div class="child2" style="background-color: rgba(189, 189, 189, 0.119)">

         <table>
          <tr>
	           <td rowspan="3">
	            <div class="box1" style="width: 300px; height: 500px;">
		              <p class="text3">고객 예약 현황</p>
		                  <span class="mar2">신규예약</span>
		                  <marquee class="mar1" scrollamount="2" width="50px" height="5px"
										direction="up" behavior="alternate">0</marquee>
		                  <span class="mar3">건</span>
		                <img src="${pageContext.request.contextPath}/img/quick.png" class="img01" width="240px" height="45px">
			              <div class="quick_box_white">
			                <ul>
				                 <li><a href="<%=request.getContextPath()%>/notice" class="quick1">공지사항 ✓</a></li>
				                <li><a href="<%=request.getContextPath()%>/review"class="quick2">매장 리뷰 게시판 ✓</a></li>
				                <li><a href="<%=request.getContextPath()%>/qna" class="quick3">문의 내역 게시판 ✓</a></li>
			                </ul>
			              </div>
	                   </div>
	           </td>
	           
	           <td>
	              <div class="box2" class="line"><p class="text3">ALL PARTNERS</p>
	                <div class="minibox1_cnt"><%=cnt1 %></div>
	                <div class="minibox22">파트너 입점 수</div>
	              </div>
	           </td>
         </tr>
          
         <tr>
		            <td>
		            	<div class="box3" class="line"><p class="text3">MY GRADE</p>
			              <div class="minibox3"><small>★</small></div>
			              <div class="minibox2">고객 선호도
			              <a href="" data-toggle="modal" data-target="#myModal">
							<img class="togimg" src="https://w7.pngwing.com/pngs/273/858/png-transparent-question-mark-computer-icons-exclamation-mark-desktop-question-mark-emoji-angle-text-logo.png" width="7%" height=""/></a>
		              		</div>
		              	</div>
		              	
		              	
		      <!--파트너 랭킹 모달창 -->
              <!-- Trigger the modal with a button -->
 				<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal"
				data-target="#myModal">?</button> -->
				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog"> // fade는 투명 효과
				  <div class="modal-dialog">
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">x</button>
				        <h4 class="modal-title">Partner Rank</h4>
				      </div>
				      <div class="modal-body">
				      
				        <p class="card-text">
			                          최근 1개월간의 이용 내역을 반영하여 단계가 결정되면<br>
			                          매월 1일 새로운 회원등급이 부여됩니다. (결제완료일자기준)<br>향후 단계별 및 선정기준은 변경될 수 있습니다.<br>
                      </p>
                      <br>
                      <table class="gradetable">
                        <tr>
                          <td class="">Family_Partner</td>
                          <td class="tb1">Gold_Partner</td>
                          <td class="">VIP_Partner</td>
                        </tr>
                        <tr>
                          <td class="tb2">★</td>
                          <td class="tb2-1"><small>★★  ~ ★★★★</small></td>
                          <td class="tb2">★★★★★</td>
                        </tr>
                        <tr>
                          <td class="">신규입점<br>파트너</td>
                          <td class="tb3">평균 별점<br>및 고객선호도</td>
                          <td class="">Top5 랭킹<br>파트너</td>
                        </tr>
                      </table>
                      <br>
                    </div>
                    <div class="card-footer">
                      <p class="pw_text"><small>* 1만원 미만의 구매 내역은 주문횟수로 계산되는 선정기준에 제외됩니다.</small></p>
                    </div>
				      </div>
				  </div>
				</div>
            </td>
         
		 </tr>

	          <tr>
		            <td>
		            	<div class="box3" class="line"><p class="text3">MY TOTAL</p>
			              <div class="minibox4">0</div>
			              <div class="minibox2">누적 판매수량</div>
			             </div>
		            </td>
	          </tr>
	</table>
      </div>
      </div>
      
      
      <%}else if(MemLoggined.getMemberSep().equals("회원")){ %>

      
<!--       일반회원인경우 -->
<div class="parent" style="width: 100%;">
      <div class="child1" style="background-color:rgba(189, 189, 189, 0.119)">
        <img src="${pageContext.request.contextPath}/img/customer.png" width="200px" width="200px" class="mong">
        <p class="profile1">Hello! Members <b><%=MemLoggined.getMemberId()%></b></p>
          <table class="profilebox">
            <tr>
              <td class="profilebox1"><a href="<%=request.getContextPath()%>/partner/memberView?id=<%=MemLoggined.getMemberId()%>">회원정보수정</a></td>
              <td class="profilebox2"><a href="<%=request.getContextPath()%>/policy">환불 규정 안내</a></td>
            </tr>
            <tr>
              <td class="profilebox3">
              	<a href="<%=request.getContextPath()%>/movewith">회원 탈퇴</a></td>
              <td>
                <a href="<%=request.getContextPath()%>/notice">공지사항 확인</a>
          </table>
        </div>
      <div class="child2" style="background-color: rgba(189, 189, 189, 0.119)">

        <table>
          <tr>
	           <td rowspan="3">
	            <div class="box1" style="width: 300px; height: 500px;">
		              <p class="text3">예약 현황</p>
		                  <span class="mar2">PLACE</span>
		                  <marquee class="mar1" scrollamount="2" width="50px" height="5px"
										direction="up" behavior="alternate">0</marquee>
		                  <span class="mar4">건</span>
		                <img src="${pageContext.request.contextPath}/img/quick.png" class="img01" width="240px" height="45px">
			              <div class="quick_box_white">
			                <ul>
				                <li><a href="<%=request.getContextPath()%>/views/store/storeCategory.jsp" class="quick1">스토어 예약하기  ✓</a></li>
				                <li><a href="<%=request.getContextPath()%>/qna" class="quick2">문의 게시판  ✓</a></li>
				                <li><a href="<%=request.getContextPath()%>/board" class="quick3">리뷰 게시판  ✓</a></li>
			                </ul>			                
			              </div>
	              </div>
	           </td>
	           
	           <td>
	              <div class="box2" class="line"><p class="text3">AVAILABLE MENU</p>
	                <div class="minibox1"><small><%=cnt2%></small></div>
	                <div class="minibox2">예약가능 메뉴</div>
	              </div>
	           </td>
         </tr>
          
         <tr>
		            <td>
		            	<div class="box3" class="line"><p class="text3">MY GRADE</p>
			              <div class="minibox3"><small>Family</small></div>
			              <div class="minibox2">나의 등급
			              <a href="" data-toggle="modal" data-target="#myModal">
							<img class="togimg" src="https://w7.pngwing.com/pngs/273/858/png-transparent-question-mark-computer-icons-exclamation-mark-desktop-question-mark-emoji-angle-text-logo.png" width="7%" height=""/></a>
		              		</div>
		              	</div>
				<!--회원등급 모달창 (회원 마이페이지) -->
					<!-- Modal -->
					<div id="myModal" class="modal fade" role="dialog"> // fade는 투명 효과
					  <div class="modal-dialog">
					    <!-- Modal content-->
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal">x</button>
					        <h4 class="modal-title">회원 등급 기준</h4>
					      </div>
					      <div class="modal-body">
					        <p class="card-text">
				                          최근 1개월간의 이용 내역을 반영하여 단계가 결정되면<br>
				                          매월 1일 새로운 회원등급이 부여됩니다. (결제완료일자기준)<br>향후 단계별 및 선정기준은 변경될 수 있습니다.<br>
	                      </p>
	                      <br>
	                      <table class="gradetable">
	                        <tr>
	                          <td class="">Family</td>
	                          <td class="tb1">Gold</td>
	                          <td class="">Vip</td>
	                        </tr>
	                        <tr>
	                          <td class="tb2">☻</td>
	                          <td class="tb2-1">☻☻</td>
	                          <td class="tb2">☻☻☻</td>
	                        </tr>
	                        <tr>
	                          <td class="">신규가입<br>회원</td>
	                          <td class="tb3">월 통합 2회이상<br>구매 회원</td>
	                          <td class="">월 통합 10회이상<br>구매 회원</td>
	                        </tr>
	                      </table>
	                      <br>
	                    </div>
	                    <div class="card-footer">
	                      <p class="pw_text">* 1만원 미만의 구매 내역은 주문횟수로 계산되는 선정기준에 제외됩니다.</p>
	                    </div>
					      </div>
					  </div>
					</div>
		 </tr>

	          <tr>
	            <td>
	            	<div class="box3" class="line"><p class="text3">SIGN UP DATE</p>
		              <div class="minibox4_date">20/03/11</div>
		              <div class="minibox2">회원 가입일</div>
		             </div>
	            </td>
	            <td></td>
	          </tr>
	        </table>
          
        </div>


      </div>
    <%} %> 
    </div>
    </body>
      
      <%@ include file="/views/common/footer.jsp" %>
      
      
      
      <style>
      
 	 .minibox1{
        color: rgb(96, 114, 133);
        font-size: 240%;
        margin-left: 80%;
      }
      .minibox1_cnt{
        color: rgb(96, 114, 133);
        font-size: 220%;
        margin-left: 71%;
      }
      .minibox2{
        margin-left: 8%;
        color: gray;
        padding-bottom:10%;
      }
      .minibox22{
        margin-left: 8%;
        color: gray;
        padding-bottom:10%;
      } 
      .minibox3_star{
        color: rgb(96, 114, 133);
        font-size: 220%;
        margin-left: 75%;
      }
      .minibox3{
        color: rgb(96, 114, 133);
        font-size: 220%;
        margin-left: 58%;
      }
      .minibox4{
        color: rgb(96, 114, 133);
        font-size: 240%;
        margin-left:75%;
      }
      .minibox4_date{
        color: rgb(96, 114, 133);
        font-size: 190%;
        margin-left: 41%;
        margin-bottom: 3%;
      }
      .mar1{
      	height: 100px;
        font-size: 80px;
        color: rgb(75, 75, 75);
        margin-left: 30%;
      }
      .mar2{
        margin-left: 11%;
        font-size: 100%;
        color: gray;
      }
      .mar3{
        font-size: 100%;
        color: gray;
      }
      .mar4{
      	margin-left: 7%;
        font-size: 100%;
        color: gray;
      }
      .profilebox3{
        border-right : 1px dashed gray;
      }
      .profilebox2{
        border-bottom : 1px dashed gray;
      }
      .profilebox1{
        border-right : 1px dashed gray;
        border-bottom : 1px dashed gray;
      }
      .profilebox{
        text-align:center;
        color: rgb(87, 87, 87);
        margin-left: 10%;
        margin-top: 20%;
        width: 80%;
        height: 30%;
        border-top : 1px dashed gray;
        border-bottom : 1px dashed gray;
      }
      .img01{
        margin-top: 10%;
        margin-left: 10%;
      }
      
       .togimg{
      	margin-left:2%;
      	margin-bottom:3%;
      }
      
      .box1{
        margin-top: 20%;
        background-color: rgba(138, 138, 138, 0.119);
        margin-left: 18%;
        border-bottom-right-radius: 10px;
        box-shadow: 2px 2px 2px #aaa;
        border-top:1px  #107bb3 solid;
        border-top-width: 10px;
      }
      
      .box2{
        background-color: rgba(138, 138, 138, 0.119);
        margin-top: 22%;
        width: 250px;
        height: 150px;
        margin-left: 45%;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        border-top:1px  #107bb3 solid;
        border-top-width: 10px;        
        box-shadow: 2px 2px 2px #aaa;
      }
      .box3{
        background-color: rgba(138, 138, 138, 0.119);
        margin-top: 7%;
        margin-left: 45%;
        width: 250px;
        height: 150px;
        border-bottom-left-radius: 10px;
        border-bottom-right-radius: 10px;
        box-shadow: 2px 2px 2px #aaa;
        border-top:1px  #107bb3 solid;
        border-top-width: 10px;
      }
       .line{
        border:1px  #107bb3 solid;
        border-top-width: 5px;
      }
      .quick_box_white{
        margin-left: 11%;
        width: 79%;
        height: 220px;
        background-color: rgba(255, 255, 255, 0.372);
      }

      .quick_box ul li{
        padding-top:10%;
        margin-bottom: 11%;
      }
      .text2{
        color:  #107bb3;
        margin-top: 20px;
        margin-left: 6%;
      }
      .text3{
        margin-top: 5%;
        margin-left: 7%;
        color: rgb(77, 77, 77);
      }
      .text3-2{
        margin-top: 5%;
        margin-left: 10%;
        color: rgb(77, 77, 77);
      }
      
      .quick1,.quick2,.quick3{
        display: inline-block;
        padding-top:10%;
        padding-right:5%;
        margin: 2%;
        width:100%; 
        color: gray;
        text-align: center;
      }
      .profile1{
        margin-top: 10%;
        text-align: center;
        font-size: 20px;
      }
      .mong{
        box-shadow: 3px 3px grey ;
        border-radius: 70%;
        display: block;
        margin : auto;
        margin-top: 15%;
      }
      .parent {
          margin-top: 3%;
          margin-bottom: 10%;
          display: flex;
      }
      .child1 {
          flex: 1.5;
          height: 630px;
          margin-right: 3%;
          border-radius: 5px;
          border-left: 2px rgb(215, 215, 215) solid;
          border-right: 2px rgb(215, 215, 215) solid;
      }
      .child2 {
          height: 630px;
          flex: 3;
          border-radius: 5px;
          border-left: 2px rgb(215, 215, 215) solid;
          border-right: 2px rgb(215, 215, 215) solid;
      }

      .mptitle h1 {
        font-family: 'S-CoreDream-8Heavy', sans-serif;
        text-align: center;
        margin:70px;
        }
        
      .grade_info{
          border: none;
          background: none;
        }

      .tb3{
        border-right: 1px gray solid;
        border-left: 1px gray solid;
        width: 150px;
        height: 100px;
      }
      .tb2-1{
        background-color: rgba(149, 84, 175, 0.274);
        border-right: 1px gray solid;
        border-left: 1px gray solid;
        width: 150px;
        height: 50px;
      }
      .tb2{
        background-color:rgba(149, 84, 175, 0.274);
        width: 150px;
        height: 50px;
      }
      .tb1{
        border-right: 1px gray solid;
        border-left: 1px gray solid;
        width: 150px;
        height: 70px;
      }
       .gradetable{
          background-color : rgb(243, 243, 243) ;
          border-radius: 20px;
          margin-top:10%;
          text-align-last: center;
          margin : auto;
        }
       .pw_text{
       color : red;
       font-size : 12px;
       }
       
       p,input,button,tr,th,a,td{
			 font-family: 'JSDongkang-Regular';
			}
       
       </style>
       