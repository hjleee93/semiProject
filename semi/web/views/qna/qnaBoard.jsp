<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.qna.model.vo.*, java.util.List" %>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/adminmenubar.jsp"%>
<%
	List<Qna> listQna =(List)request.getAttribute("list"); 
System.out.println("listQna in jsp: " + listQna);
	List<Qna> search = (List)request.getAttribute("search");
	Member MemberlogginedQna = (Member)session.getAttribute("Memberloggined");
	int data = (Integer)request.getAttribute("totalData");
	
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
        strong{
        	color:mediumpurple;
        }
   		
        div#search-member{display:inline-block;}
        div#search-partner{display:none;}
        div#search-title{display:none;}
    </style>
<section>
	<div class="cst-status">
        <h1>Q&A</h1>
    </div>
    <div class="container">
            <div class="board-header">
                <div class="board-search-form">
                    <label for="searchType" class="hidden">검색 구분</label>
                    <select id="searchType" name="searchType" class="select">
                        <option value="member">제목</option>
                        <option value="partner">내용</option>
                        <option value="title">제목+내용</option>
                    </select>
                    <div id="search-member">
	                   	<form action="<%=request.getContextPath()%>/qns/qna/search">
		                    <input type="hidden" name="searchType" value="member">
		                    <input type="text" class="inp" name="searchkeyword" id="member" placeholder="제목">
		                    <button type="submit" onclick="javascript:fn_se();return false;">검색버튼</button>
	                    </form>
                    </div>
                    <div id="search-partner">
	                    <form action="<%=request.getContextPath()%>/qna/qna/search">
		                    <input type="hidden" name="searchType" value="partner">
		                    <input type="text" class="inp" name="searchkeyword" id="partner" placeholder="내용">
		                    <button type="submit" onclick="javascript:fn_se();return false;">검색버튼</button>
	                    </form>
                    </div>
                    <div id="search-title">
	                    <form action="<%=request.getContextPath()%>/qna/qna/search">
		                    <input type="hidden" name="searchType" value="title">
		                    <input type="text" class="inp" name="searchkeyword" id="title" placeholder="제목+내용">
		                    <button type="submit" onclick="javascript:fn_se();return false;">검색버튼</button>
	                    </form>
                    </div>
                </div>
            </div>
		
            <div class="tbl-box">
                <table class="tbl-list">
<%--                 <span>총게시글 : <strong><%=data %></strong></span> --%>
                    <caption>Q&A</caption>
                    <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">분류</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">첨부파일</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <%for(Qna n : listQna){ 
                   
                    %>
                    <tbody>
                        <tr>
                            <td><%=n.getQnaNo() %></td>
                            <td>
                                <span><%=n.getQnaSep() %></span>
                            </td>
                            <td class="al">
                                <a href="<%=request.getContextPath() %>/QnaView?no=<%=n.getQnaNo() %>" onclick="fn_view('3454','21'); return false;">
                                    <span>
                                        <%=n.getQnaTitle() %>
                                    </span>
                                </a>
                            </td>
                            <td><%=n.getQnaWriter() %></td>
                            <td>
								<%if(n.getQnaOriginalFileName()!=null) {%>
								<img src="<%=request.getContextPath() %>/images/file.png" width="20" height="20"> 
								<%}else{%> 
								<p>첨부파일x</p>
								<%}%>
							</td>
                            <td><%=n.getQnaDate() %></td>
                            <td><%=n.getQnaCount() %></td>                            
                        </tr>
                    </tbody>
                    <%} %>
                </table>
            </div>
            <%if(MemberlogginedQna!=null && MemberlogginedQna.getMemberId().equals("admin")){ %>
            <div id="writebtn">
                <a type="button" class="meple" id="movewrite" onclick="location.assign('<%=request.getContextPath()%>/qna/writeQna');">글작성</a>
              
            </div>
            <%} %>
			<div id="pageBar">
				<%=request.getAttribute("pageBar") %>
			</div>
       
    </div>

</section>
<script>
	$(function(){
		
		$("#searchType").change(e=>{
			let member= $("#search-member");
			let partner=$("#search-partner");
			let title=$("#search-title");
			
			member.css("display","none");
			partner.css("display","none");
			title.css("display","none");
			
			let value=$(e.target).val();
			$("#search-"+value).css("display","inline-block");
		})
		
	});
</script>

<%@ include file="/views/common/footer.jsp"%>