<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/adminmenubar.jsp" %>
<%@ page import="com.semi.qna.model.vo.*, com.semi.partner.model.vo.*" %>
<%
	Qna n = (Qna)request.getAttribute("qna");
	Member MemberlogginedQna = (Member)session.getAttribute("Memberloggined");
	PartnerMember Partnerloggined = (PartnerMember)session.getAttribute("Partnerloggined");
	List<QnaComment> qnaList=(List)request.getAttribute("list");
	System.out.println("qna: " + n);
	System.out.println("qna: " + qnaList);
	QnaComment bc = (QnaComment)request.getAttribute("qnaComment");

%>
<style>
   div#comment-container button#btn-insert{width:60px;height:50px; color:white;
    background-color:#3300FF;position:relative;top:-20px;}
    
	.notice{
		margin:5%;
	}
	
	
	 div#btn{
            background: mediumpurple;
            color: #fff;
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
            color: white;
            border: 1px solid #ddd;
            border-radius:7px;
            
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
	  <h1>Q&A</h1>
  </div>
  <div id="no">
  <span> NO: </span>
  <span><%=n.getQnaNo() %></span>
  </div>
    <table class="tbl-reg">
 	 <colgroup>
    	   <col style="width:20%">
	       <col style="width:auto;">
     </colgroup>
  	<tbody>
        <tr class="first">
            <th scope="row">제 목</th>
            <td><%=n.getQnaTitle() %></td>
        </tr>
        <tr id="hide">
        	<th scope="row">구분</th>
        	<td><%=n.getQnaSep() %></td>
        </tr>
        <tr>
            <th scope="row">작성자</th>
            <td><%=n.getQnaWriter() %></td>
        </tr>    
        <tr class="last">
            <th scope="row">내 용</th>
            <td id="content"><%=n.getQnaContent() %></td>
        </tr>
        </tbody>
    </table>   
    	<tr>
 				<th colspan="2" class="btn">
					<%if(MemberlogginedQna!=null&&(MemberlogginedQna.getMemberId().equals(n.getQnaWriter())
							||MemberlogginedQna.getMemberId().equals("admin"))){ %>
							<button type="button" onclick="fn_modify()">수정</button>
							<button type="button" onclick="fn_delete()">삭제</button>
					<%} %>
					<button type="button" onclick="location.replace('<%=request.getContextPath() %>/qna')">목록</button>
				</th>
			</tr>
    </form>
 </div>
 
 
 			<form action="<%=request.getContextPath() %>/qna/qnaRe">
		<table id="tbl-comment">
		<div class="comment-editor">		
			<tr>		    
		    	<%=bc.getQnaCommentContent() %>		 
	            <td id="qnaCommentContent">	<%=bc.getQnaCommentContent() %></td>
	        </tr>	 
	        <tr>		    
		    	<%=bc.getQnaCommentContent() %>		 
	            <td id="qnaCommentContent">	<%=bc.getQnaCommentContent() %></td>
	        </tr>	
	        
	        
	        
	         
	   	</div>	        			    			    		   			    		
	    </table>
	</form>
   
	    
	    
	 
	    
	   
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    </section>
<script>
	$(function(){
		$("#hide").hide();
		
	});
	
	function fn_delete(){
		if(confirm("삭제하시겠습니까?")){
			location.replace('<%=request.getContextPath()%>/qna/deleteQna?no=<%=n.getQnaNo()%>');			
		}	
		
	};
	
	function fn_modify(){
		 const frm= $("#noticeFrm");
		 const url="<%=request.getContextPath()%>/qna/modify?no=<%=n.getQnaNo()%>";
		 frm.attr({
			 "action":url,
			 "method":"post",
		 });
		 frm.submit();
	};
	
</script>


<%@ include file="/views/common/footer.jsp"%>





















