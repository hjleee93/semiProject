<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/adminmenubar.jsp" %>
<%@ page import="com.semi.admin.review.vo.*" %>
<%
	List<Review> reviewlist = (List)request.getAttribute("reviewlist");
%>

<style>
		
        table{margin-top:2%;}
        #movewrite{
            float: right;
            margin: 7% 0 7% 0;
            color: white;
            background-color: #107bb3;
            border: #107bb3 3px solid;
        }
      
        .cst-status {
            margin: 50px;
        }

        .cst-status h1 {
            font-family: 'S-CoreDream-8Heavy', sans-serif;
            text-align: center;
        }
        #pageBar{
        	text-align:center;
        	margin:10%;
        	font-size:20px;
        }
        #pageBar a{color:#000;}
        #pageBar a:link{color:mediumpurple;}
        
        #pageBar>.num:hover{
        	color:mediumpurple;
        	font-weight:bolder;
        	text-decoration:underline;
        }	
        div.board-header{
        	margin-bottom:5%;
        }
        div#writebtn a.meple {
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
		#content:link { 
			text-decoration: none;
			color:#646464;
			/* box-shadow: 0 -6px rgba(75, 112, 253, 0.3) inset;  */
		} 
		#title:visited { 
			text-decoration: none;
			color:#646464; 
		 }
		#title:active { 
			text-decoration: none;
			color:#646464; 
		}
		#title:hover { 
			text-decoration: none;
			color:#646464; 
			box-shadow: 0 -6px rgba(140, 89, 185, 0.3) inset; }		 
		#title{ display: inline; }
    </style>
<section>
	<div class="cst-status">
        <h1>R E V I E W</h1>
    </div>
    <div class="container">
   <div class="tbl-box">
             <table class="tbl-list">
                 <caption>관리자 BEST REVIEW PICK</caption>
                 <thead>
                 <colgroup>
					<col width="20px">
					<col width="20px">
					<col width="100px">
					<col width="270px">
					<col width="50px">
					<col width="50px">
				</colgroup>
                     <tr>
                         <th scope="col">NO</th>
                         <th scope="col">CATEGORY</th>
                         <th scope="col">STORE</th>
                         <th scope="col">TITLE</th>
                         <th scope="col">CONTENT</th>
                         <th scope="col">WRITER</th>
                         <th scope="col">DATE</th>
                     </tr>
                 </thead>
                 <tbody>
                 <%
                 if(reviewlist!=null){
                 	for(Review r : reviewlist){ 
                 %>
                    <tr>
                        <td><%=r.getReviewNum() %></td>
                        <td><%=r.getReviewCategory() %></td>
                        <td>
                        <a id="title" href="<%=request.getContextPath()%>/reviewView?no=<%=r.getReviewNum()%>">
                        <%=r.getReviewTitle() %></a>
                        </td>
                        <td><%=r.getReviewContent() %></td>
                        <td><%=r.getReviewWriter() %></td>
                        <td><%=r.getEnrolldate() %></td>                            
                    </tr>
                    <%}
                 	}%>
                </tbody>
             </table>
         </div>
         <%if(Memberloggined!=null && Memberloggined.getMemberId().equals("admin")){ %>
         <div id="writebtn">
             <a type="button" class="meple" id="movewrite" onclick="location.assign('<%=request.getContextPath()%>/admin/reviewWrite');">리뷰쓰기</a>
           
         </div>
         <%} %>
<div id="pageBar">
	<%=request.getAttribute("pageBar") %>
</div>
       
    </div>


</section>

<%@ include file="/views/common/footer.jsp"%>