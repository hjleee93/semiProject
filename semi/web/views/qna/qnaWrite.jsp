<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

<%@ page import="com.semi.member.model.vo.Member"%>
<%
	Member MemberlogginedQna = (Member)session.getAttribute("Memberloggined");

%>
<style>
        .notice{
            margin: 50px;
        }

        .notice h1{
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
            /* overflow:hidden; */
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
            background: lightgray;
            border-color: gray;
            color: #fff;
        }

        .board-view-btn a.meple {
            background: mediumpurple;
            border-color: mediumpurple;
            color: #fff;
        }
        p,input,button,tr,th,a,td{
 font-family: 'JSDongkang-Regular';
}
    </style>
    <div class=submenu style="background-color:#5873ff75 !important;">
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
    <section>
<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="notice">
            <h1>Q&A</h1>
        </div>        
	<form name="qnaWriteFrm" id="qnaWriteFrm" action="<%=request.getContextPath()%>/qna/qnaWrite" method="post"
	enctype="multipart/form-data">
        <table class="tbl-reg">

            <caption>QNA 작성</caption>

            <colgroup>
                <col style="width:20%">
                <col style="width:auto;">
            </colgroup>

            <tbody>
                <tr class="first">
                    <th scope="row"><label for="title">제목</label></th>
                    <td><input type="text" name="title" id="title" class="inp full" title="제목 입력" required></td>
                </tr>
         
                
                <tr>
                    <th scope="row"><label for="sep">문의</label></th>
                    <td>
                        <select id="sep" name="sep" title="문의" class="select">
                            <option name="sep" id="select0" value="예약 문의" selected>예약 문의</option>
                            <option name="sep" id="select1" value="결제 문의">결제 문의</option>
                            <option name="sep" id="select2" value="환불 문의">환불 문의</option>
                            <option name="sep" id="select3" value="기타 문의">기타 문의</option>                  
                        </select>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="writer">작성자</label></th>
                    <td><input type="text" name="writer" id="writer" class="inp" title="작성자 입력" value="<%=Memberloggined.getMemberId()%>"
                             readonly></td>
                </tr>
               <!--  <tr>
		            <th scope="row">첨부파일</th>
		            <td>
		            	<input type="file" name="upfile" id="file">
		            </td>
		        </tr> -->
                <tr>
                    <th scope="row"><label for="content">내용</label></th>
                    <td>
                        <textarea name="content" id="content" rows="20" cols="70" class="textarea"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>

        <div class="board-view-btn">
            <a class="gray" title="cancel" onclick="cancel_event();">취소</a>
            <a class="meple" title="submit" id="submit" onclick="location.assign('<%=request.getContextPath()%>/qna/qnaWrite');">등록</a>
            
        </div>
        </form>
    </div>

    <script>
        function cancel_event() {
            if (confirm("정말 취소하시겠습니까?") == true) {
                location.replace("<%=request.getContextPath()%>/qna");
            }
        };

        $(function () {
            $("#submit").click(function () {

                if ($("#title").val() == "") {
                    alert("제목은 필수 입력값입니다.");
                    $("#title").focus();
                    return;
                }
               
                if ($("#content").val() == "") {
                    alert("내용은 필수 입력값입니다.");
                    $("#content").focus();
                    return;
                }
          
				if($("#title").val()!=null && $("#content").val()!=null){
            	const frm = $("#qnaWriteFrm");
    			const url="<%=request.getContextPath()%>/qna/qnaWrite";
    			frm.attr({
    				"action":url,
    				"method":"post",
    			});
    			frm.submit();
				};
            })


        });
    </script>
</section>

<%@ include file="/views/common/footer.jsp"%>