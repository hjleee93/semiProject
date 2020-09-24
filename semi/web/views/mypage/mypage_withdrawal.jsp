<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%@ page import="com.semi.partner.model.vo.PartnerMember"%>
<%@ page import="com.semi.member.model.vo.Member"%>

<%
	PartnerMember logginedMember = (PartnerMember)session.getAttribute("logginedMember");
	Member Memberloggined1 = (Member)session.getAttribute("Memberloggined");

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
%>
<section>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>탈퇴</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

  <!-- 커스텀 css 추가 -->
  <link href="css/mainCustom.css" rel="stylesheet">

  <!-- 폰트 -->
  <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500;900&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

  <!-- 제이쿼리 -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  <style>
    .card-header{
      text-align: center;
    }
  </style>
</head>

      <div class="container">
       	 <br><br>
        <div class="card h-100">
          <h4 class="card-header">계정 탈퇴</h4>
          <div class="card-body">
            <p class="card-text">
         'HYOLO' 를 다시 사용하지 않을 예정으로, 계정 삭제를 원하시는 경우<br> 해당 계정을 삭제 조치해 드립니다.
                삭제된 계정은 다시 활성화 할 수 없으며,<br>관련 콘텐츠는 'HYOLO'를 사용하시는 기존 고객들을 위해 삭제 조치되지 않습니다.<br>
                삭제를 원하시는 경우 관리자에게 문의해주시거나 <br>
                마이페이지에서 <b>내가 쓴 리뷰</b> 혹은 <b>문의내역 확인</b>에서 삭제 가능합니다.<br>
            </p>
          </div>
           <div class="card-footer">
            <p class="pw_text">
			* 계정 탈퇴 후에는 복구가 불가능 합니다.
              </p>
          </div>
        </div>
        <br>
        <div class="button_f">
        <button class="btn btn-primary" onclick="mydelete();">탈퇴하기 </button>
        <button class="btn btn-primary" onclick="mydelete2();" > 취소 </button>
      </div>
      <script>
      
    //패스워드 확인
      function mydelete(){
		if(confirm("정말로 탈퇴하시겠습니까?")){
			location.replace('<%=request.getContextPath()%>/partner/memberDelete?partner_id=<%=logginedMember.getPartner_id()%>');			
			}
		};
	function mydelete2(){
		history.go(-1);
	}
	  </script>
	
	
        </div>   
      </div>
    </div>
  </div>

    <style>
        .pw_text{
            font-size: 11px;
            color: red;
        }
        .pw_client{
            margin-left: 2%;
        }
        .spam{
            width: 230px;
            height: 50px;
        }
        .button_f{
        	text-align: center;
        	margin-bottom: 5%;
        	margin-top: 5%;
        }
    </style>

</section>
<%@ include file="/views/common/footer.jsp" %>