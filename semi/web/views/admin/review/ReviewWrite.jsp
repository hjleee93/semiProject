<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.semi.admin.review.vo.*" %>
<%@ include file="/views/common/header.jsp"%>
<%
	Review r = (Review)request.getAttribute("review");
%>
<style>

        .review {
            margin:13% 0 5% 0;
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
            text-align: left;
            border-bottom: 1px solid #e7e7e7;
            padding: 10px 0 10px 30px;
            width: 170px;
        }

        .tbl-reg th label {
            font-size: 16px;
            font-weight: bold;
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
            border-top: 5px solid rgba(140, 89, 185, 0.3);
        }

        .tbl-reg tr.first td {
            border-top: 5px solid rgba(140, 89, 185, 0.3);
        }

        .tbl-reg td .inp {
            font-size: 16px;
            width: 223px;
            border: 1px solid #ccc;
            height: 43px;
        }

        .tbl-reg td .inp.full {
            width: calc(100% - 22px);
        }

        .tbl-reg td .select {
            font-size: 17px;
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
            display: inline-flex;
            margin: 0 20px 0 0px;
        }

        .tbl-reg td label.type01 {
            margin: 10px 0 5px 0;
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
            border: 1px solid #ddd;
        }

        .board-view-btn a:hover {
            font-weight:bolder;
        }

        .board-view-btn a.gray {
            background: rgba(140, 89, 185, 0.3);
            border-color: rgba(140, 89, 185, 0.3);
            color: white;
        }
        #reviewFrm{
			padding-left:15%;
			padding-right:15%;
			text-align:center;
			margin-bottom:5%;
		}
		#content:link { 
			text-decoration: none;
			color:#646464;
			/* box-shadow: 0 -6px rgba(75, 112, 253, 0.3) inset;  */
		} 
		#content:visited { 
			text-decoration: none;
			color:#646464; 
		 }
		#content:active { 
			text-decoration: none;
			color:#646464; 
		}
		#content:hover { 
			text-decoration: none;
			color:#646464; 
			box-shadow: 0 -6px rgba(140, 89, 185, 0.3) inset; }		 
		#content{ display: inline; }
       #star{float:left;}
    </style>
    <section>
<div class="container">
        <div class="review">
            <h1>R E V I E W</h1>
        </div>
	<form name="reviewFrm" id="reviewFrm" action="" method="post">
        <table class="tbl-reg">
            <caption>BEST TOP 3 REVIEW</caption>

            <colgroup>
                <col style="width:20%">
                <col style="width:auto;">
            </colgroup>

            <tbody>
                <tr class="first">
                    <th scope="row"><label for="category">카테고리</label></th>
                    <td>
                    	<select id="notice" name="category" title="카테고리">
							<option value="CAFE">CAFE</option>
                            <option value="PUB">PUB</option>
                            <option value="RESTAURANT">RESTAURANT</option>
                        </select>
                    </td>
                    <th scope="row"><label for="title">리뷰명</label></th>
                    <td><input type="text" name="title" id="title"></td>
                </tr>
                <tr>
                    <th scope="row"><label for="writer">작성자</label></th>
                    <td><input type="text" name="writer" id="writer"></td>
                    <th scope="row"><label for="content">내용</label></th>
                    <td><input type="text" name="content" id="content"></td>
                </tr>
                <tr>
                	<th></th>
                	<td></td>
                	<th scope="row"><label for="star">만족도</label></th>
                	<td colspan="2"><input type="text" id="mark" name="mark" value="❤❤❤❤🤍"></td>
                </tr>
            </tbody>
        </table>

        <div class="board-view-btn">
        	<a class="gray" id="btn" title="cancel" onclick="cancel_event();">취소</a>
            <a class="gray" id="btn" title="cancel" onclick="Fn_submit();">등록</a>
        </div>
        </form>
    </div>

    <script>
        function cancel_event() {
                location.replace("<%=request.getContextPath()%>/admin/review");
 
        };
        function Fn_submit(){
        	const title=$("#title").val();
   		 	const writer=$("#writer").val();
   		 	const content=$("#content").val();
   			if(title.trim().length==0){
   				alert("제목을 입력해주세요!");
   				$("#title").focus();
   				return false;
   			}
   			if(content.trim().length==0){
   				alert("내용을 입력해주세요!");
   				$("#content").focus();
   				return false;
   			}
   			if(writer.trim().length==0){
   				alert("작성자를 입력해주세요!");
   				$("#content").focus();
   				return false;
   			}
   		 const frm= $("#reviewFrm");
			 const url="<%=request.getContextPath()%>/admin/reviewUpload";
			 frm.attr({
				 "action":url,
				 "method":"post",
			 });
			 frm.submit();
        };



    </script>
</section>

<%@ include file="/views/common/footer.jsp"%>