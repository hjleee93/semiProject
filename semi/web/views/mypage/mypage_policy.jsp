<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<section>


<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>취소 및 환불 정책</title>

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
          <h4 class="card-header">취소 및 환불 정책</h4>
          <div class="card-body">
            <p class="card-text">
                 - 취소요청 접수기준은 당사의 운영시간 내 ‘환불요청서’가 접수된 시간 또는 플랫폼 내의 ‘1:1 문의하기’에 기록된 시간 혹은 ‘취소요청’이 접수된 시간을 기준으로 합니다.
                <br>
                - 예약 확정 후 파트너가 일정을 변경하여 드릴 수 없어서 발생하는 예약 취소에 관하여는 본 취소환불 정책에 따른 수수료가 부과됩니다.
                <br>
                - 일정 변경과 관련한 사항은 파트너에게 직접 문의하여야 합니다. 변경요청하시는 내용에 따라서 요금이 추가되거나 일정 변경이 불가할 수 있습니다.
                <br>
                - 확정 후 24시간 이내에 예약 취소를 요청하더라도, 24시간 이내인 경우 전액환불 대상에서 제외됩니다.
                <br>
                - 각 상품의 설명 내용에서 취소환불 정책이 별도 규정 있을 경우, 각 상품의 별도 기재 내용이 본 취소환불 정책보다 우선 적용됩니다.
              </p>
              <hr>
              ※ 환불신청가능기간<br>
              결제일 이후 7일 이내 환불 신청한 경우에 한하여 환불이 가능합니다.<br>
              (유효기간의 2주 이전에 환불을 신청한 경우에 한하여 환불이 가능합니다.)<br>
              ※ 환불진행시 유의사항<br>
              개인 과실로 인한 착오로 일정 변경의 경우 환불이 불가하오니, 유의하여 주시기 바랍니다.<br>
              ※ 환불수수료<br>
              취소수수료(결제금액의 10%)가 환불수수료로 차감됩니다.<br>
              제공업체에서 자체 규정하는 별도의 환불규정이 있는 경우
              제공업체의 환불규정이 당사의 환불규정에 우선하여 적용됩니다.<br>
              (상품상세페이지 기재)
            </p>
          </div>
          <div class="card-footer">
            <p class="pw_text">* 고객센터<br>
	                월~금: 09:00-18:00 (점심시간 12:00-13:00) 공휴일&주말: 1:1 채팅 상담만 가능 <br>
	                환불,변경 접수: 월~금 09:00-17:00
              </p>
          </div>
        </div>
        <div class="button_f">
        <button class="btn btn-primary" onclick="mydelete3();" > &nbsp;&nbsp;확인&nbsp;&nbsp; </button>
		<script>
		function mydelete3(){
			history.go(-1);
		}
		</script>
        	
        </div>
      </div>
    </div>
  </div>

    <style>
        .pw_text{
            /* text-align: center; */
            font-size: 13px;
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