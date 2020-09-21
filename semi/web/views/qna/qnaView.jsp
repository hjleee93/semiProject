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

%>
<style>
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
  <form name="noticeFrm" id="noticeFrm" action="" method="post">
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
        <tr>
      <%--  <th>첨부파일</th>
				<td>
				 	<%if(n.getQnaOriginalFileName()!=null){ %>
				 		<a href="javascript:fn_fileDownload('<%=n.getQnaOriginalFileName()%>','<%=n.getQnaRenamedFileName()%>');">
					 		<img src="<%=request.getContextPath() %>/images/file.png" width="20" height="20">
					 		<%=n.getQnaOriginalFileName() %>
				 		</a>
				 		<script>
				 			function fn_fileDownload(oriname,rename){
				 				const url="<%=request.getContextPath()%>/qna/qnaFileDown";
				 				let oName=encodeURIComponent(oriname);
				 				location.assign(url+'?oName='+oName+'&rName='+rename);
				 			}
				 		</script>
				 	<%} %>
				</td> --%>
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
							||MemberlogginedQna.getMemberId().equals("ptn123"))){ %>
							<button type="button" onclick="fn_modify()">수정</button>
							<button type="button" onclick="fn_delete()">삭제</button>
					<%} %>
					<button type="button" onclick="location.replace('<%=request.getContextPath() %>/qna')">목록</button>
				</th>
			</tr>
		
    
    
   <%-- <%if(Partnerloggined!=null&&(Partnerloggined.getPartnerId().equals("ptn123"))){%>
   		<div class="btn">
                <input type="button" value="수정하기" onclick="fn_modify();">
                <input type="button" value="삭제하기" onclick="fn_delete();">
        </div>
    <%}else if(MemberlogginedQna!=null&&(MemberlogginedQna.getMemberId().equals("ptn123"))){ %>
        <div class="btn">
                <input type="button" value="수정하기" onclick="fn_modify();">
                <input type="button" value="삭제하기" onclick="fn_delete();">
        </div>
     <%} %> --%>
      <%--   <input type="hidden" name="file" value="<%=n.getFile() %>"> --%>
  
    </form>
 </div>
   <div id="comment-container">
	    	<div class="comment-editor">
	    		<form action="<%=request.getContextPath() %>/qna/qnaCommentInsert" method="post">
	    			<input type="hidden" name="qnaRef" value="<%=n.getQnaNo() %>">
	    			<input type="hidden" name="qnaCommentWriter" value="<%=Memberloggined!=null?Memberloggined.getMemberId():"" %>">
					<input type="hidden" name="qnaCommentLevel" value="1">
					<input type="hidden" name="qnaCommentRef" value="0">
					<textarea name="qnaCommentContent" cols="55" rows="3"></textarea>
					<button type="submit" id="btn-insert">등록</button>	    			
	    		</form>
	    	</div>
	    </div>
	    <table id="tbl-comment">
	    	<%for(QnaComment bc : qnaList) {
	    		if(bc.getQnacommentLevel()==1){
	    	%>
		    	<tr class="level1">
		    		<td>
		    			<sub class="comment-writer"><%=bc.getQnaCommentWriter() %></sub>
		    			<sub class="comment-date"><%=bc.getQnaCommentDate() %></sub>
		    			<br>
		    			<%=bc.getQnaCommentContent() %>
		    		</td>
		    		<td>
		    			<button class="btn-reply" value="<%=bc.getQnaCommentNo()%>">답글</button>
		    			<%if(Memberloggined.getMemberId().equals(bc.getQnaCommentWriter())
		    					||Memberloggined.getMemberId().equals("ptn123")){ %>
		    				<button class="btn-delete" value="<%=bc.getQnaCommentNo()%>">삭제</button>
		    			<%} %>
		    		</td>
		    	</tr>
	    	<%}else { %>
	    		<tr class="level2">
		    		<td>
		    			<sub><%=bc.getQnaCommentWriter() %></sub>
		    			<sub><%=bc.getQnaCommentDate() %></sub>
		    			<br>
		    			<%=bc.getQnaCommentContent() %>
		    		</td>
		    		<td></td>
		    	</tr>
	    	<%}
	    	} %>
	    </table>
	    
	    
	    
	    
	    <script>
	    	$(function(){
	    		//로그인이 안된사람이 댓글을 창을 클릭했을때 로그인하라는 메세지 띄워주기
	    		$("[name=QnaCommentContent]").focus(e => {
	    			if(<%=Memberloggined==null%>){
	    				alert("로그인 후 이용해주세요!");
	    				$("#MemberId").focus();
	    			}
	    		})
	    		//답글에 대한 클릭이벤트설정
	    		$(".btn-reply").click(e => { 
	    			<%if(Memberloggined!=null){%>
	    				let tr=$("<tr>");
	    				let form=$(".comment-editor>form").clone();
	    				form.find("textarea").attr("rows","1");
	    				form.find("[name=qnaCommentLevel]").val("2");
	    				form.find("[name=qnaCommentRef]").val(e.target.value);
	    				form.find("button").addClass("btn-insert2")
	    				let td=$("<td>").attr("colspan","2");
	    				tr.find("td").css("display","none");
	    				tr.append(td.append(form));
	    			
						tr.insertAfter($(e.target).parents("tr")).children("td").slideDown(800);
						$(e.target).off("click");//이벤트제거
	    			<%}%>
	    		});
	    		
	    	
	    </script>
    </div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
<script>
	$(function(){
		$("#hide").hide();
		
	});
	function fn_delete(){
		if(confirm("삭제하시겠습니까?")){
			location.replace('<%=request.getContextPath()%>/qna/deleteQna?no=<%=n.getQnaNo()%>');			
		}	
		
	}
	
	function fn_modify(){
		 const frm= $("#noticeFrm");
		 const url="<%=request.getContextPath()%>/qna/modify?no=<%=n.getQnaNo()%>";
		 frm.attr({
			 "action":url,
			 "method":"post",
		 });
		 frm.submit();
	}
	
</script>

</section>

<%@ include file="/views/common/footer.jsp"%>





















