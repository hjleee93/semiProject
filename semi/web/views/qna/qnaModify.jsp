<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import="com.semi.qna.model.vo.*" %>


<%
	Qna n = (Qna)request.getAttribute("qna");
%>

<style>
p,input,button,tr,th,a,td{
 font-family: 'JSDongkang-Regular';
}
	.notice{
		margin:5%;
	}
	.notice h1 {
            font-family: 'S-CoreDream-8Heavy', sans-serif;
            text-align: center;
            margin-bottom:7%;
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

        .tbl-reg td {
            border-bottom: 1px solid #e7e7e7;
            padding: 10px 20px;
            height: 43px;
        }
		
        .tbl-reg tr.first th {
            border-top: 2px solid #000;
        }

        .tbl-reg tr.first td {
            border-top: 2px solid #000;
        }
        .tbl-reg tr th{
        	font-weight:bold;
        }
   
		#noticeFrm{
			padding-left:15%;
			padding-right:15%;
			text-align:center;
		}
		.btn {
			margin:6%;
            
		}
		#title{
			float:left;
		}
		#writer{
			float:left;
		}
		#content{
			float:left;
			padding-bottom:50px;
		}
		#select{
			float:left;
		}
		#file{
			float:left;
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
  <div id="notice-container" class="notice">
	  <h1>Q&A</h1>
  </div>
  <form name="noticeFrm" id="noticeFrm" action="" method="post">
  
    <table class="tbl-reg">
 	 <colgroup>
    	   <col style="width:20%">
	       <col style="width:auto;">
     </colgroup>
  	<tbody>
        <tr class="first">
            <th scope="row">제 목</th>
            <td><input type="text" id="title" name="title" size="57" value="<%=n.getQnaTitle()%>"></td>
        </tr>
        <tr>
        	<th scope="row">구분</th>
        	<td>
	        	<select  id="select" name="search">
	        		<option name="reservation" id=reservation value="reservation">예약 문의</option>
	        		<option name="payment" id="payment" value="payment">결제 문의</option>
	        		<option name="refund" id="refund" value="refund">환불 문의</option>
	        		<option name="etc" id="etc" value="etc">기타 문의</option>
	       		</select>
       		</td>
        </tr>
        
     
        <tr>
            <th scope="row">작성자</th>
            <td><input type="text" id="writer" name="writer" size="57" value="<%=n.getQnaWriter()%>" readonly></td>
        </tr>
         <%--  <th>첨부파일</th> 
				 <td>
				 	<%if(n.getQnaOriginalFileName()!=null){ %>
				 		<a href="javascript:fn_fileDownload('<%=n.getQnaOriginalFileName()%>','<%=n.getQnaRenamedFileName()%>');">
					 		<img src="<%=request.getContextPath() %>/images/file.png" width="20" height="20">
					 		
				 		</a>
				 		<script>
				 			function fn_fileDownload(oriname,rename){
				 				const url="<%=request.getContextPath()%>/Qna/QnaFileDown";
				 				let oName=encodeURIComponent(oriname);
				 				location.assign(url+'?oName='+oName+'&rName='+rename);
				 			}
				 		</script>
				 	<%} %>
				</td>  --%>
		
        <tr>
            <th scope="row">내 용</th>
            <td><textarea name="content" id="content" rows="5" cols="60"></textarea></td>
        </tr>
        </tbody>
    </table>
        <div class="btn">
                <input type="button" value="수정하기" onclick="fn_modify();">
        </div>
    </form>
 </div>
<script>

	$(function(){
		$("#title").click(function(){
			$("#title").val("");
		});
	});
	function fn_modify(){
		const title=$("#title").val();
		const content=$("[name=content]").val();
		if(title.trim().length==0){
			alert("제목을 입력해주세요!");
			$("#title").focus();
			return false;
		}
		if(content.trim().length==0){
			alert("내용을 입력해주세요!");
			$("[name=content]").focus();
			return false;
		}
		
		 const frm= $("#noticeFrm");
		 const url="<%=request.getContextPath()%>/qna/modifySuccess?no=<%=n.getQnaNo()%>";
		 frm.attr({
			 "action":url,
			 "method":"post",
		 });
		 frm.submit();
	}
	
</script>

</section>

<%@ include file="/views/common/footer.jsp"%>