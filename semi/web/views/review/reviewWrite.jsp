<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<%
	
%>
<section>
<style>
        .starR1 {
            background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
            background-size: auto 100%;
            width: 15px;
            height: 30px;
            float: left;
            text-indent: -9999px;
            cursor: pointer;
        }

        .starR2 {
            background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
            background-size: auto 100%;
            width: 15px;
            height: 30px;
            float: left;
            text-indent: -9999px;
            cursor: pointer;
        }

        .starR1.on {
            background-position: 0 0;
        }

        .starR2.on {
            background-position: -15px 0;
        }

        .review {
            margin: 50px;
        }

        .review h1 {
            font-family: 'S-CoreDream-8Heavy', sans-serif;
            text-align: center;
        }

        caption {
            overflow: hidden;
            position: absolute;
            top: 0;
            left: 0;
            width: 1px;
            height: 1px;
            font-size: 0;
            line-height: 0
        }

        .tbl-reg {
            width: 100%;
            margin-top: 5px;
        }

        .tbl-reg th {
            font-size: 16px;
            font-weight: 400;
            color: #000;
            text-align: left;
            border-bottom: 1px solid #e7e7e7;
            padding: 10px 0 10px 30px;
            width: 170px;
        }

        .tbl-reg th label {
            font-size: 16px;
            color: #000;
            font-weight: 400;
        }

        .tbl-reg td {
            border-bottom: 1px solid #e7e7e7;
            padding: 10px 20px;
            height: 43px;
        }

        .tbl-reg td.bot2 {
            border-top: 2px solid #000;
        }

        .tbl-reg tr.first th {
            border-top: 2px solid #000;
        }

        .tbl-reg tr.first td {
            border-top: 2px solid #000;
        }

        .tbl-reg td .inp {
            font-size: 16px;
            color: #000;
            width: 223px;
            border: 1px solid #ccc;
            height: 43px;
        }

        .tbl-reg td .inp.full {
            width: calc(100% - 22px);
        }

        .tbl-reg td .select {
            font-size: 17px;
            color: #888;
            width: 222px;
            border: 1px solid #ccc;
            height: 45px;
        }

        .tbl-reg td .textarea {
            resize: none;
            width: calc(100% - 22px);
            border: 1px solid #ccc;
            height: 160px;
            padding: 10px;
            font-size: 17px;
            color: #888;
        }

        .radio {
            background: url(/images/site/frt/bg/bg-radio-off.png) no-repeat;
            width: 28px;
            height: 28px;
            /* overflow:hidden; */
            appearance: none;
            -moz-appearance: none;
            -webkit-appearance: none;
            -ms-display: flexbox;
            display: flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            ;
        }

        .radio:checked {
            background: url(/images/site/frt/bg/bg-radio-on.png) no-repeat;
        }

        .tbl-reg td .form {
            width: 100%;
            height: auto;
            -ms-display: flexbox;
            display: flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            ;
            justify-content: flex-start;
            align-items: center;
        }

        .tbl-reg td .form input {
            -ms-display: flexbox;
            display: flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            ;
            margin-right: 10px;
        }

        .tbl-reg td label {
            font-weight: 400;
            font-size: 16px;
            color: #333;
            display: inline-flex;
            margin: 0 20px 0 0px;
        }

        .tbl-reg td label.type01 {
            margin: 10px 0 5px 0;
        }

        .tbl-reg mark {
            background: transparent;
            color: #0e83c1;
            font-size: 16px;
            font-weight: 400;
        }

        .tbl-reg td.dt {
            background: #f8f9fd;
        }

        .board-view-btn {
            margin: 40px 0 80px 0;
            -ms-display: flexbox;
            display: flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            ;
            justify-content: flex-end;
            align-items: center;
            width: 100%;
            height: auto;
            /* overflow:hidden; */
        }

        .board-view-btn.ac {
            justify-content: center;
        }

        .board-view-btn a {
            margin-left: 5px;
            -ms-display: flexbox;
            display: flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            cursor: pointer;
            justify-content: center;
            align-items: center;
            width: 88px;

            height: 43px;
            overflow: hidden;
            font-size: 16px;
            color: #000;
            border: 1px solid #ddd;
        }

        .board-view-btn a:hover {
            text-decoration: underline;
        }

        .board-view-btn a.gray {
            background: #666666;
            border-color: #666666;
            color: #fff;
        }

        .board-view-btn a.blue {
            background: #107bb3;
            border-color: #107bb3;
            color: #fff;
        }

        #abc {
            color: red;
        }

        .img-fluid {
            cursor: pointer;
            height:100%;
        }
        .rate{
            font-size: larger;
        }

#output_image1,#output_image2,#output_image3
{
 max-width:100%;
 max-height:100%;
}
</style>
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="review">
            <h1>리뷰작성 하기</h1>
        </div>

        <p id="right">
            <span id="abc">*</span>
            필수입력사항
        </p>

        <table class="tbl-reg">

            <caption>문의하기 게시판</caption>

            <colgroup>
                <col style="width:20%">
                <col style="width:auto;">
            </colgroup>

            <tbody>
                <tr class="first">
                    <th scope="row"><label for="qnatitle"> <span id="abc">*</span>제목</label></th>
                    <td><input type="text" name="qnatitle" id="qnatitle" class="inp full" title="제목 입력" required></td>
                </tr>
                <tr>
                    <th scope="row">평점</th>
                    <td>
                        <div class="starRev">
                            <span class="starR1 on" id="0.5" onClick="reply_click(this)">별1_왼쪽</span>
                            <span class="starR2" id="1" onClick="reply_click(this)">별1_오른쪽</span>
                            <span class="starR1" id="1.5" onClick="reply_click(this)">별2_왼쪽</span>
                            <span class="starR2" id="2" onClick="reply_click(this)">별2_오른쪽</span>
                            <span class="starR1" id="2.5" onClick="reply_click(this)">별3_왼쪽</span>
                            <span class="starR2" id="3" onClick="reply_click(this)">별3_오른쪽</span>
                            <span class="starR1" id="3.5" onClick="reply_click(this)">별4_왼쪽</span>
                            <span class="starR2" id="4" onClick="reply_click(this)">별4_오른쪽</span>
                            <span class="starR1" id="4.5" onClick="reply_click(this)">별5_왼쪽</span>
                            <span class="starR2" id="5" onClick="reply_click(this)">별5_오른쪽</span>
                        </div>
                        <div class="rate">
                            <span style="margin-left: 15px;font-weight:bold" id="starRate">0.5</span> / 5
                    </div>
</td>
                </tr>
                <tr>
                    <th scope="row"><label for="ntcrNm">ID</label></th>
                    <td>
                        <!-- 회원아이디 default -->
                        <input type="text" name="ntcrNm" id="ntcrNm" class="inp" value="<%=Memberloggined.getMemberId() %>" disabled>
                        <input type="radio" name="idstatus" value="openId" checked>공개
                        <input type="radio" name="idstatus" value="closeId">비공개

                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="nttCn">내용</label></th>
                    <td>
                        <textarea name="nttCn" id="nttCn" rows="20" cols="70" class="textarea"></textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="password">후기 사진</label></th>
                    <td>

                        <div class="row">

                            <div class="col-md-3 col-sm-6 mb-4">
                                <div id="wrapper">
                                    <label>
                                    <input type="file" accept="image/*" onchange="preview_image1(event)" style="display:none">
                                    <img id="output_image1" class="img-fluid" src="http://placehold.it/500x300" alt=""> 
                                </label>
                                </div>

                        </div>

                            <div class="col-md-3 col-sm-6 mb-4">
                                    <div id="wrapper">
                                        <label>
                                        <input type="file" accept="image/*" onchange="preview_image2(event)" style="display:none">
                                        <img id="output_image2" class="img-fluid" src="http://placehold.it/500x300" alt=""> 
                                    </label>
                                    </div>

                            </div>

                            <div class="col-md-3 col-sm-6 mb-4">
                                <div id="wrapper">
                                    <label>
                                    <input type="file" accept="image/*" onchange="preview_image3(event)" style="display:none">
                                    <img id="output_image3" class="img-fluid" src="http://placehold.it/500x300" alt=""> 
                                </label>
                                </div>

                        </div>


                        </div>

                </tr>
            </tbody>
        </table>

        <div class="board-view-btn">
            <a class="gray" title="cancel" onclick="cancel_event();">취소</a>
            <a class="blue" title="submit" onclick="fn_pro()">등록</a>
        </div>
    </div>
</section>
 <script>
function preview_image1(event) 
{
 var reader = new FileReader();
 reader.onload = function()
 {
  var output = document.getElementById('output_image1');
  output.src = reader.result;
 }
 reader.readAsDataURL(event.target.files[0]);
}
function preview_image2(event) 
{
 var reader = new FileReader();
 reader.onload = function()
 {
  var output = document.getElementById('output_image2');
  output.src = reader.result;
 }
 reader.readAsDataURL(event.target.files[0]);
}
function preview_image3(event) 
{
 var reader = new FileReader();
 reader.onload = function()
 {
  var output = document.getElementById('output_image3');
  output.src = reader.result;
 }
 reader.readAsDataURL(event.target.files[0]);
}
       

        // 평점
        $('.starRev span').click(function () {
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            return false;
        });

        function reply_click(obj)
        {    
            var id = obj.id;
            document.getElementById('starRate') .innerHTML = id;
        }

        function cancel_event() {
            if (confirm("정말 삭제하시겠습니까?") == true) {
                location.href= history.back();
                //TODO: 삭제 코드 추가 
            }
        }


        function fn_pro() {
            if ($("#qnatitle").val() == "") {
                alert("제목은 필수 입력값입니다.");
                $("#qnatitle").focus();
            }
        	 else{
    		alert("등록 !?");
    		location.href="http://localhost:9090/semi/review/reviewList";
    		} 
    	 	
            //location.href = "mypage_partner.html"
        }
</script>

<%@ include file="/views/common/footer.jsp" %>
