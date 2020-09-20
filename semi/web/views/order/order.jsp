<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!-- 전용css  -->
<link href="<%=request.getContextPath()%>/css/orderpay.css" rel="stylesheet">

<section>
<div class="mptitle">
    <h1>주문결제</h1>
  </div>

  <!-- 주문상품정보테이블 -->
  <div class="container">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item active">01 장바구니</li>
        <li class="breadcrumb-item active" aria-current="page">02 주문/결제</li>
        <li class="breadcrumb-item active">03 주문완료</li>
      </ol>
    </nav>
    <div name="info-section" id="productInfo">
      <h4>주문상품정보</h4>

      <table class="table" id="product_table">
        <colgroup>
          <col style="width:150px;">
          <col style="width:430px;">
          <col style="width:120px;">
          <col style="width:120px;">
          <col style="width:110px;">
          <col>
        </colgroup>
        <thead>
          <tr>
            <th scope="col" colspan="2">상품정보</th>
            <th scope="col">상품금액</th>
            <th scope="col">할인금액</th>
            <th scope="col">주문금액</th>
          </tr>
        </thead>
        <tbody>
          <tr class="_deal" data-main-deal-srl="2289543706">
            <td class="thumb">
              <div class="product_thumb">
                <a href="http://www.tmon.co.kr/deal/2289543706#content_start" target="_blank"><img
                    src="http://th1.tmon.kr/thumbs/image/025/19e/f5e/09635164a_320x320_95_FIT.jpg"
                    alt="[애플] 에어팟 유선충전 2세대 (국내 공식 AS가능)"></a>
              </div>
            </td>
            <td class="v_top">
              <div class="product_title">
                <div class="info">
                  <p class="title"><a href="http://www.tmon.co.kr/deal/2289543706#content_start" target="_blank"
                      title="[애플] 에어팟 유선충전 2세대 (국내 공식 AS가능)">[애플] 에어팟 유선충전 2세대 (국내 공식 AS가능)</a></p>
                  <ul>
                    <li>
                      <em class="name">
                        03.애플 에어팟 프로 / Airpods Pro
                        | 애플 에어팟 프로 / Airpods Pro
                      </em>
                      <em class="num"><i>1</i>개</em>
                      <br>
                      <!-- 수량변경은 일단 보류!표시만해놓음 -->
                      <small style="color: lightgray;">수량변경은 장바구니에서-!일단보류</small>
                    </li>
                  </ul>
                </div>
              </div>
                <!-- <div class="btn">
                  수량 변경<input type="number" min="1" max="">
                    class="btn_change_amount _btn_change_amount" data-main-deal-srl="2289543706">수량
                </div> -->
                <!-- <span class="count">
                  <button type="button" class="btn_minus _btn_decrease_option_count">-</button>
                  <input class="_input_option_count" type="text" value="1">
                  <button type="button" class="btn_plus _btn_increase_option_count">+</button>
                </span> -->
            </td>
            <td class="mgl align_center">
              <span class="int_black"><em>277,000</em><i class="won">원</i></span>
            </td>
            <td class="mgl align_center">
              <span class="int">
                <em>-24,930</em><i class="won">원</i>
              </span>
            </td>
            <td rowspan="1" class="mgl align_center">
              <span class="int_black_big"><em>
                  255,070
                </em><i class="won">원</i></span>
            </td>
          </tr>
          <tr class="inner_line">
            <td colspan="6">
              <div></div>
            </td>
          </tr>

        </tbody>
        <tfoot>
          <tr>
            <td colspan="6">
              <div class="money_sum">
                <ul>
                  <li>
                    <em class="title">상품금액</em>
                    <span class="int_black"><em>277,000</em><i class="won">원</i></span>
                  </li>
                  <li>
                    <em class="title">할인금액</em>
                    <span class="int">
                      <em>-24,930</em><i class="won">원</i>
                    </span>
                  </li>
                </ul>
              </div>
            </td>
          </tr>
          <tr>
            <td colspan="6" class="bd0">
              <div class="money_tot">
                <em>총 주문금액</em>
                <span class="int_black_big"><em>255,070</em><i class="won">원</i></span>
              </div>
            </td>
          </tr>
        </tfoot>
      </table>
    </div>
    <!-- 주문상품정보테이블 end-->

    <!-- 적립금 -->
    <div class="mileage">
      <h4>적립금</h4>
      <table class="table">
        <tr>
          <th>적립예정금액</th>
          <td>
            <span class="int"><em>80</em><i class="won">원</i></span>
          </td>
        </tr>
        <tr>
          <th>적립금사용</th>
          <td>
            <div class="right_box_pay pay_banner_area">
              <span class="label">적립금</span>
              <input type="text" id="_payInfo_point_inputPoint" class="fl money" value="6000" disabled> 
              <span class="fl" style="font-weight: bold;">원</span>
              <button type="button" id="_payInfo_point_btnPointUseAll" class="fl btn_pay_all">전액사용</button>
              <small>5000원부터 사용이 가능합니다.</small>
              <!-- input값이 1000원이상일경우 사용가능하게 -->
            </div>
          </td>
        </tr>
      </table>
    </div>
    
    
    <!-- 결제방법선택 -->

    <div class="pay">
      <h4>결제방법선택</h4>
      <table class="table" id="choicetable">
        <colgroup>
          <col style="width:160px;">
          <col>
        </colgroup>
        <tr>
          <th>결제 방법</th>
          <td class="pay_type_td" id="_payInfo_payment_method">
            <ul class="pay_type">

              <li>
                <label class="radios kakao" for="payType_1">
                  <input id="payType_1" type="radio" name="sort2" value="KAKAO" data-paymentname="카카오페이"
                    data-paytypename="" class="_iradio_payInfo_payType">

                  <b>kakao</b>

                  <span>카카오페이</span>
                </label>
              </li>
              <li>
                <label class="radios" for="payType_2">
                  <input id="payType_2" type="radio" name="sort2" value="CARD" data-paymentname="신용카드"
                    data-paytypename="" checked="" class="_iradio_payInfo_payType">

                  <span>신용카드</span>
                </label>
              </li>
              <li>
                <label class="radios vbank" for="payType_3">
                  <input id="payType_3" type="radio" name="sort2" value="VBANK" data-paymentname="무통장입금"
                    data-paytypename="" class="_iradio_payInfo_payType">

                  <span>무통장입금</span>
                </label>
              </li>
            </ul>
          </td>
        </tr>
        <tr>
          <th scope="row" class="v_top">안내</th>
          <td>
            <div class="info_txt">
              <p class="dot">
                카카오페이는 카카오톡에 개인 신용/체크 카드를 등록하여 간단하게 비밀번호 만으로 결제할 수 있는 모바일 결제 서비스입니다. <br>
                등록 시 휴대폰과 카드 명의자가 동일해야 합니다.</p>
              <p class="dot">무이자 할부 서비스 및 신용카드 전용쿠폰 서비스는 이용이 제한 됩니다.</p>
              <p class="dot">카카오머니로 결제 시, 현금영수증 발급은 ㈜카카오페이에서 발급가능합니다.</p>
            </div>
          </td>
        </tr>
        <!-- 신용카드 -->
        <tr id="tr1">
          <th>카드 종류</th>
          <td>
            <div class="fl_wrap">
              <div class="select_div card">
                <!-- <div class="selectric " data-type="selectric"><span class="label">카드 선택</span><b class="button"></b> -->
                <select id="_iselect_payInfo_card">
                  <option value="">카드 선택</option>
                  <option value="SHINHAN">신한</option>
                  <option value="KB">KB국민</option>
                  <option value="SAMSUNG">삼성</option>
                  <option value="BC">BC</option>
                  <option value="HYUNDAI">현대</option>
                  <option value="WOORI">우리</option>
                  <option value="HANA">하나</option>
                  <option value="KEB">하나(구, 외환)</option>
                  <option value="NH">NH채움</option>
                  <option value="LOTTE">롯데</option>
                  <option value="CITI">씨티</option>
                  <option value="KAKAO">카카오뱅크</option>
                  <option value="KBANK">케이뱅크</option>
                  <option value="IBK">IBK기업</option>
                  <option value="GWANGJU">광주</option>
                  <option value="SUHYUP">수협</option>
                  <option value="SHINHYUP">신협</option>
                  <option value="POST">우체국카드</option>
                  <option value="FSB">저축은행</option>
                  <option value="JUNBOOK">전북</option>
                  <option value="JEJU">제주</option>
                  <option value="KDB">산은캐피탈</option>
                  <option value="MG">MG새마을카드</option>
                </select></div>
            </div>
    </div>
    </td>
    </tr>
    <tr>
      <th scope="row">할부 기간</th>
      <td>
        <div class="fl_wrap">
          <div class="fl select_div card">
            <!-- <div class="selectric " data-type="selectric"><span class="label">할부 선택</span><b class="button">▾</b> -->
            <select id="_iselect_payInfo_card_month">
              <option value="">일시불</option>
              <option value="1">1개월(무이자)</option>
              <option value="2">2개월(무이자)</option>
              <option value="3">3개월(무이자)</option>
              <option value="4">4개월(무이자)</option>
              <option value="4">5개월(무이자)</option>
              <option value="4">6개월(무이자)</option>
            </select>
          </div>
          <small>5만원 이상 구매시 최대 6개월 무이자할부 가능</small>
        </div>
      </td>
    </tr>
    <!-- <tr id="_payInfo_card_benefit"></tr> -->
    <!-- 무통장 -->

    <!-- 버튼이벤트 -->
    <!--//결제방법 제한 안내-->
    <tr>
      <th>가상 계좌</th>
      <td>
        <div class="fl_wrap">
          <div class="virtual-account-payment pay-type-content" data-controller="vaPayment"
            data-controller-data="{&quot;savedBankKcpCode&quot; : &quot;&quot;}">
            <p class="validate-message" style="display: none;"></p>
            <ul class="pay-type-sections">
              <li class="deposit-bank-wrap pay-type-section">
                <!-- <label for="depositBank" class="line-title">입금은행</label> -->
                <div class="line-data">
                  <select id="depositBank" class="" name="depositBank">
                    <option value="" selected="" data-limitmsg="">입금은행</option>


                    <option value="NH" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">농협은행
                    </option>

                    <option value="KB" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">국민은행
                    </option>

                    <option value="SHINHAN" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">신한은행
                    </option>

                    <option value="WOORI" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">우리은행
                    </option>

                    <option value="HANA" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">KEB하나은행
                    </option>

                    <option value="IBK" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">기업은행
                    </option>

                    <option value="DAEGU" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">대구은행
                    </option>

                    <option value="BUSAN" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">부산은행
                    </option>

                    <option value="POST_OFFICE" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">
                      우체국
                    </option>

                    <option value="KYONGNAM" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">경남은행
                    </option>

                    <option value="KWANGJU" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">광주은행
                    </option>

                    <option value="SC" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">SC제일은행
                    </option>

                    <option value="SUHYUB" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">수협은행
                    </option>

                    <option value="CITI" data-limitmsg="" data-messagecolor="" data-paymentdisabled="false">씨티은행
                    </option>


                  </select>
                  <p class="validate-message" style="display: none;"></p>
                  <p class="pay-box__deactivated-payment-notice" id="virtualAccountPayTypeLimitMsg"></p>
                </div>
              </li>
              <li class="pay-type-explain">
                <p class="cash-receipt-explain">* 현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.</p>
              </li>
            </ul>
          </div>
          <dl class="virtual-account-payment-explain">
            <dt>무통장입금 시 유의사항</dt>
            <dd>입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</dd>
            <dd>무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</dd>
            <dd>은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</dd>
          </dl>
        </div>
      </td>
    </tr>
    <tfoot class="bg_no">
      <tr>
        <td colspan="2" class="last">
          <input type="checkbox" id="_icheck_payInfo_use_next" checked="">
          <i class="ico"></i> <em>선택한 결제방법을 다음에도 사용</em>
        </td>
      </tr>
    </div>
  </div>
</table>
</div>
  


  <!-- 약관동의 -->
  <div class="tbl_wrap box_wrap agree">
    <h4>약관 동의</h4>
    <div id="truecheck">
      <div class="left_box" id="_terms">
        <dl>
          <dt>
            <div class="checkbox">
              <input type="checkbox" class="_terms_total_checkbox" id="totalcheck">
              <span id="checkall">전체 동의하기</span>
            </div>
          </dt>
          <dd>
            <ul>
              <li data-terms-type="personal">
                <label class="checkBox01">
                  <div class="checkbox" style="position: relative;"><input type="checkbox" class="_terms_checkbox" name="check"
                      data-is-required="true"> 개인정보 제 3자 제공에 동의합니다.
                  </div>
                </label>
                <!-- <a href="#" class="detail _personal_terms_layer">상세보기</a> -->
              </li>
              <li data-terms-type="pay">
                <label class="checkBox01">
                  <div class="checkbox" style="position: relative;"><input type="checkbox" class="_terms_checkbox" name="check"
                      data-is-required="true"> 결제대행서비스 이용약관에 동의합니다.
                  </div>
                </label>
                <!-- <a href="#" class="detail _pay_terms_layer">상세보기</a> -->
              </li>
              <li data-terms-type="refund">
                <label class="checkBox01">
                  <div class="icheckbox" style="position: relative;"><input type="checkbox" class="_terms_checkbox" name="check"
                      data-is-required="true"> 주문할 상품설명에 명시된 내용과 사용조건을 확인하였으며, 취소. 환불규정에 동의합니다.
                  </div>
                </label>
              </li>
            </ul>
          </dd>
        </dl>
      </div>

      <div class="right_box">
        <!-- 총 결제금액 영역 -->
        <div class="total_pay" id="_total_pay">

          <table class="totalSum">
            <colgroup>
              <col style="width:45%">
              <col style="width:5%">
              <col style="width:5%">
            </colgroup>
            <tr>
              <td class="int_black tit">총 상품금액</td>
              <td><em>277,000</em></td>
              <td>원</td>
            </tr>
            <tr>
              <td class="int tit">할인금액</td>
              <td><em>-24,930</em></td>
              <td>원</td>
            </tr>
            <tr>
              <td class="tit">적립금 사용</td>
              <td><em>0</em></td>
              <td>원</td>
            </tr>
          </table>
        </div>
        <div class="total">
          <span>총 결제금액</span>
          <p>
            <span class="int_orange int_black_big"><em>255,070</em><i class="won">원</i></span>
          </p>
        </div>
      </div>
      <!--// 총 결제금액 영역 -->
    </div>
  </div>
  </div>
  <!-- 약관동의end -->


  <div class="btn_buy_area">
    <button type="button" class="btn btn-outline-success">취소</button>
    <button type="button" class="btn btn-success" id="paysuccess">결제하기</button>
  </div>

  </div>
  <script>
    $(document).ready( function() {
     //할부 5만원이상 활성화
     if($("#_payInfo_point_inputPoint").val()<50000){
        $("#_payInfo_point_btnPointUseAll").attr('disabled',true);//비활성화
      }else{
        $("#_payInfo_point_btnPointUseAll").attr('disabled',false);//활성화
      }
      
      //적립금
      if($("#_payInfo_point_inputPoint").val()<5000){
        $("#_payInfo_point_btnPointUseAll").attr('disabled',true);//비활성화
      }else{
        $("#_payInfo_point_btnPointUseAll").attr('disabled',false);//활성화
      }
      
      $("#_payInfo_point_btnPointUseAll").on("click",function(){
        $("#_payInfo_point_inputPoint").val('0');
        // $("#_payInfo_point_inputPoint").html(value);
      });


      $("#paysuccess").click(function(){
      var next = $("input:checkbox[id='_icheck_payInfo_use_next']").is(":checked");
      var total = $("input:checkbox[id='totalcheck']").is(":checked");
      var check = $("input:checkbox[name='check']").is(":checked");
      
      if($("input:radio[id='payType_2']").is(":checked")){
        if($("#_iselect_payInfo_card").val()==0){
          alert("카드를 선택하세요");
          return;
        }
      }else if($("input:radio[id='payType_3']").is(":checked")){
        if($("#depositBank").val()==0){
          alert("입금은행을 선택하세요");
          return;
        }
      };

      if(next==true && total==true && check==true){
        var confirm_test = confirm("결제하시겠습니까?");
        
        if ( confirm_test == true ) {
          location.href="<%=request.getContextPath()%>/order/orderSuccess";
        }  
      }else{
        alert("약관동의는 필수입니다");
      
      };
      });
      
        // $('._terms_checkbox').prop('checked', this.checked);
          $("#choicetable tbody tr:nth-child(2)").toggle();
          $("#choicetable tbody tr:nth-child(5)").toggle();
        $("#payType_1").click( function() {
          $("#choicetable tbody tr:nth-child(2)").show();
          $("#choicetable tbody tr:nth-child(3)").hide();
          $("#choicetable tbody tr:nth-child(4)").hide();
          $("#choicetable tbody tr:nth-child(5)").hide();
        });
        $("#payType_2").click(function(){
          $("#choicetable tbody tr:nth-child(3)").show();
          $("#choicetable tbody tr:nth-child(4)").show();
          $("#choicetable tbody tr:nth-child(2)").hide();
          $("#choicetable tbody tr:nth-child(5)").hide();
        });
        $("#payType_3").click(function(){
          $("#choicetable tbody tr:nth-child(2)").hide();
          $("#choicetable tbody tr:nth-child(3)").hide();
          $("#choicetable tbody tr:nth-child(4)").hide();
          $("#choicetable tbody tr:nth-child(5)").show();
        });
      
        
    })

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
    });
  </script>
  <!-- 체크박스 전체선택 -->
  <script>
    $(document).ready(function () {
      $('._terms_total_checkbox').click(function () {
        $('._terms_checkbox').prop('checked', this.checked);
      });
    });
  </script>

</section>

<%@ include file="/views/common/footer.jsp"%>