<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/css/orderSuccess.css" rel="stylesheet">
<section>
    <div class="mptitle">
        <h1>주문완료</h1>
    </div>
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active">01 장바구니</li>
                <li class="breadcrumb-item active">02 주문/결제</li>
                <li class="breadcrumb-item active" aria-current="page">03 주문완료</li>
            </ol>
        </nav>



        <!-- Page Content -->
        <div class="orderSuccess-container">


            <h2 id="successOrderText">구매가 정상적으로 완료되었습니다.</h2>
            <!-- 주문상품정보테이블 -->
            <tbody>
                <table class="table">
                    <tr class="inner_line">
                        <td colspan="3">
                            <div></div>
                        </td>
                    </tr>
                    <tr>
                        <th rowspan="3">
                            <p>주문번호</p>
                            <p>20200823</p>
                        </th>
                        <td>총 결제 금액</td>
                        <td>8,000원</td>
                    </tr>
                    <tr>
                        <td>신용카드</td>
                        <td>8,000원</td>
                    </tr>
                    <tr>
                        <td>적립금 사용</td>
                        <td>0원</td>
                    </tr>
                    <tr class="inner_line">
                        <td colspan="3">
                            <div></div>
                        </td>
                    </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th>구매 내역</th>
                    <td colspan="2">적립금<em>400</em><i class="won">원</i>
                        <button type="button" onclick="location.href='mypage_customer.html'">상세보기></button>
                      
                    </td>
                </tr>
            </tfoot>
            </table>
            <!-- 주문상품정보테이블 end-->
            <pre>
            자세한 구매내역 확인 및 문자발송, 배송지 변경 등의 서비스는 사이트 우측 상단의 마이페이지>구매내역에서 이용가능합니다.
            카드사 포인트 사용 내역은 카드사 페이지에서 확인 가능합니다.
        </pre>
        </div>
        <div class="btn_check_area">
            <button type="button" class="btn btn-success" onclick="location.href='usr_rsvstatus.html'">구매내역 확인</button>
            <button type="button" class="btn btn-success" onclick="location.href='main_usr_login.html'">쇼핑 계속하기</button>
        </div>
    </div>

    <script>
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
</section>

<%@ include file="/views/common/footer.jsp"%>