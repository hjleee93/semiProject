<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/adminmenubar.jsp" %>
<%@ page import="com.semi.admin.notice.vo.*, com.semi.partner.model.vo.*" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
	Member Memberloggined = (Member)session.getAttribute("Memberloggined");
	PartnerMember Partnerloggined = (PartnerMember)session.getAttribute("Partnerloggined");
%>
<style>
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
        .tbl-reg tr.last th {
            border-bottom: 2px solid #000;
            
        }

        .tbl-reg tr.last td {
            border-bottom: 2px solid #000;
        }
        .tbl-reg tr th{
        	font-weight:bold;
        }
   
		#noticeFrm{
			padding-left:15%;
			padding-right:15%;
			text-align:center;
			margin-bottom:5%;
		}
		.btn {
			margin:6%;
            
		}
		#content{
			padding-top:70px;
			padding-bottom:70px;
		}
    	#no{
    		font-weight:bold;
    		float:left;
    		font-size:20px;
    		margin-botton:3%;
    	}

</style>
<section>
<div class="container">
  <div id="notice-container" class="notice">
	  <h1>공지</h1>
  </div>
  <form name="noticeFrm" id="noticeFrm" action="" method="post">
  <div id="no">
  <span> NO: </span>
  <span><%=n.getNoticeNo() %></span>
  </div>
    <table class="tbl-reg">
 	 <colgroup>
    	   <col style="width:20%">
	       <col style="width:auto;">
     </colgroup>
  	<tbody>
        <tr class="first">
            <th scope="row">제 목</th>
            <td><%=n.getNoticeTitle() %></td>
        </tr>
        <tr id="hide">
        	<th scope="row">구분</th>
        	<td><%=n.getNoticeSep() %></td>
        </tr>
        <tr>
            <th scope="row">작성자</th>
            <td><%=n.getNoticeWriter() %></td>
        </tr>
        <tr>
            <th scope="row">첨부파일</th>
            <td>
            <% if(n.getFile()!=null){%>
            <a href="<%=request.getContextPath()%>/notice/noticeFileDownload?file=<%=n.getFile()%>">
            	<img src="<%=request.getContextPath()%>/images/file.png" width="20" height="20">
            
            </a>
            <%} %>
            </td> 
        </tr>
        <tr class="last">
            <th scope="row">내 용</th>
            <td id="content"><%=n.getNoticeContent() %></td>
        </tr>
        </tbody>
    </table>
   <%if(Partnerloggined!=null&&(Partnerloggined.getPartnerId().equals("admin"))){%>
   		<div class="btn">
                <input type="button" value="수정하기" onclick="fn_modify();">
                <input type="button" value="삭제하기" onclick="fn_delete();">
        </div>
    <%}else if(Memberloggined!=null&&(Memberloggined.getMemberId().equals("admin"))){ %>
        <div class="btn">
                <input type="button" value="수정하기" onclick="fn_modify();">
                <input type="button" value="삭제하기" onclick="fn_delete();">
        </div>
     <%} %>
        <input type="hidden" name="file" value="<%=n.getFile() %>">
    </form>
 </div>
 <div id="comment-container">
 	<div class="comment-editor">
 		<form action="<%=request.getContextPath() %>/notice/noticeComment" method="post">
 			<%-- <input type="hidden" name="noticeRef" value="<%=nc.get"> --%>
 		
 		</form>
 	</div>
 </div>
<script>
	$(function(){
		$("#hide").hide();
		
	});
	function fn_delete(){
		if(confirm("공지사항을 삭제하시겠습니까?")){
			location.replace('<%=request.getContextPath()%>/notice/deleteNotice?no=<%=n.getNoticeNo()%>');			
		}	
		
	}
	
	function fn_modify(){
		 const frm= $("#noticeFrm");
		 const url="<%=request.getContextPath()%>/notice/modify?no=<%=n.getNoticeNo()%>";
		 frm.attr({
			 "action":url,
			 "method":"post",
		 });
		 frm.submit();
	}
	
</script>

</section>

<%@ include file="/views/common/footer.jsp"%>