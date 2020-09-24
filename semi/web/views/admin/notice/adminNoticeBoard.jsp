<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.admin.notice.vo.*, java.util.List" %>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/adminmenubar.jsp"%>
<%
	List<Notice> noticelist =(List)request.getAttribute("noticelist");
	List<Notice> search = (List)request.getAttribute("search");
	Member logginedMember = (Member) session.getAttribute("Memberloggined");
	
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
        strong{
        	color:mediumpurple;
        }
   		
        div#search-member{display:inline-block;}
        div#search-partner{display:none;}
        div#search-title{display:none;}
    </style>
<section>
	<div class="cst-status">
        <h1>공지사항</h1>
    </div>
    <div class="container">
    <div class="board-header">
                <div class="board-search-form">
                    <label for="searchType" class="hidden">검색 구분</label>
                    <select id="searchType" name="searchType" class="select">
                        <option value="member">구분</option>
                        <option value="title">제목</option>
                    </select>
                    <div id="search-member">
	                   	<form action="<%=request.getContextPath()%>/admin/notice/search">
		                    <input type="hidden" name="searchType" value="member">
		                    <input type="text" class="inp" name="searchkeyword" id="member" placeholder="">
		                    <button type="button" onclick="javascript:fn_se();return false;">검색버튼</button>
	                    </form>
                    </div>
                    <div id="search-title">
	                    <form action="<%=request.getContextPath()%>/admin/notice/search">
		                    <input type="hidden" name="searchType" value="title">
		                    <input type="text" class="inp" name="searchkeyword" id="title" placeholder="검색어입력">
		                    <button type="button" onclick="javascript:fn_se();return false;">검색버튼</button>
	                    </form>
                    </div>
                </div>
            </div>
		
            <div class="tbl-box">
                <table class="tbl-list">
                <span>총 게시글 : <strong><%=data %></strong></span>
                    <caption>관리자 공지사항</caption>
                    <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">구분</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <%for(Notice n : noticelist){ %>
                    <tbody>
                        <tr>
                            <td><%=n.getNoticeNo() %></td>
                            <td>
                                <span><%=n.getNoticeSep() %></span>
                            </td>
                            <td class="al">
                                <a href="<%=request.getContextPath() %>/noticeView?no=<%=n.getNoticeNo() %>" onclick="fn_view('3454','21'); return false;">
                                    <span>
                                        <%=n.getNoticeTitle() %>
                                    </span>
                                </a>
                            </td>
                            <td><%=n.getNoticeWriter() %></td>
                            <td><%=n.getNoticeDate() %></td>
                            <td><%=n.getNoticeCount() %></td>                            
                        </tr>
                    </tbody>
                    <%} %>
                </table>
            </div>
            <%if(Memberloggined!=null && Memberloggined.getMemberId().equals("admin")){ %>
            <div id="writebtn">
                <a type="button" class="meple" id="movewrite" onclick="location.assign('<%=request.getContextPath()%>/admin/writeNotice');">글작성</a>
              
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
		let title=$("#search-title");
		
		member.css("display","none");
		title.css("display","none");
		
		let value=$(e.target).val();
		$("#search-"+value).css("display","inline-block");
	})
	 $("input[name='searchkeyword']").blur(function(){
		var k = $(this).val();
		$(".tbl-list>tbody>tr").hide();
		if($("#searchType").val()=='member'){
		var temp=$(".tbl-list>tbody>tr>td:nth-child(5n+2):contains('"+k+"')");
		}
		if($("#searchType").val()=='title'){
			temp=$(".tbl-list>tbody>tr>td:nth-child(5n+3):contains('"+k+"')");
		}
		$(temp).parent().show();
	})
	
});
</script>

<%@ include file="/views/common/footer.jsp"%>