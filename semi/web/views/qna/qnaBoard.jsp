<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.qna.model.vo.Qna, java.util.List" %>
<%@ include file="/views/common/header.jsp"%>

<%
   List<Qna> listQna =(List)request.getAttribute("list"); 
//System.out.println("listQna in jsp: " + listQna);
   List<Qna> search = (List)request.getAttribute("search");
   Member MemberlogginedQna = (Member)session.getAttribute("Memberloggined");
   int data = (Integer)request.getAttribute("totalData");
   String type=request.getParameter("searchType");
   String keyword=request.getParameter("searchkeyword");
   String numPerPage=request.getParameter("numPerPage");
%>

<style>
p,input,button,tr,th,a,td{
 font-family: 'JSDongkang-Regular';
}

#hiddenSearch{
display:none;
}
        table{margin-top:2%;}
        #movewrite{
            float: right;
            margin: 7% 0 7% 0;
            color: white;
            background-color: #107bb3;
            border: #107bb3 3px solid;
        }
        .cst-status{
      margin:5%;
      }
      

        .cst-status h1 {
            font-family: 'S-CoreDream-8Heavy', sans-serif;
            text-align: center;
             margin-bottom:7%;
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
           background: #5873ff75 ;
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
            border-radius:1px; */
            
        }
        strong{
           color:mediumpurple;
        }
         
        div#search-member{display:inline-block;}
        div#search-partner{display:none;}
        div#search-title{display:none;}
    </style>

<%if((MemberlogginedQna != null && MemberlogginedQna.getMemberSep().equals("관리자"))){ %>
  <%@ include file="/views/common/adminmenubar.jsp"%>
  
  <%}else{ %>
<!-- 회원 파트너 서브메뉴 -->


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
  
  
  
  
<%} %>
  <!-- 서브메뉴 끝 -->
<section>
   <div class="cst-status">
        <h1>Q&A</h1>
    </div>
    <div class="container"> 

                
       <div id="search-category" id="hiddenSearch">
         <form action="<%=request.getContextPath()%>/qna/qnaSearch">
            
            <input type="hidden" name="searchType" value="category">
            
            <label><input type="radio" name="searchkeyword"    value="문의"      
            <%=type!=null&&type.equals("category")&&keyword.equals("기타 문의")?"checked":""%>
            <%=type!=null&&type.equals("category")&&keyword.equals("예약 문의")?"checked":""%>
            <%=type!=null&&type.equals("category")&&keyword.equals("결제 문의")?"checked":""%>
            <%=type!=null&&type.equals("category")&&keyword.equals("환불 문의")?"checked":""%>>ALL</label>
            
            <label><input type="radio" name="searchkeyword" value="예약 문의"            
            <%=type!=null&&type.equals("category")&&keyword.equals("예약 문의")?"checked":""%>>예약 문의</label>
            
            <label><input type="radio" name="searchkeyword" value="결제 문의"
            <%=type!=null&&type.equals("category")&&keyword.equals("결제 문의")?"checked":""%>>결제 문의</label>
            
            <label><input type="radio" name="searchkeyword" value="환불 문의"            
            <%=type!=null&&type.equals("category")&&keyword.equals("환불 문의")?"checked":""%>>환불 문의</label>
            
            <label><input type="radio" name="searchkeyword" value="기타 문의"            
            <%=type!=null&&type.equals("category")&&keyword.equals("기타 문의")?"checked":""%>>기타 문의</label>
            
            <script type="text/javascript">
                  $(document).ready(function() {
                  //라디오처럼 동작시킬 체크박스 그룹 셀렉터
                  $('input[type="radio"][name="searchkeyword"]').click(function(){
                  //클릭 이벤트 발생한 요소가 체크 상태인 경우
                        if ($(this).prop('checked')) {
                            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
                            $('input[type="radio"][name="searchkeyword"]').prop('checked', false);
                                  $(this).prop('checked', true); 
                          } 
                      });
                  });
             </script> 
                  
      </form>
      </div>
                      
    
       
            <div class="tbl-box">
                <table class="tbl-list">
<%--                <span>총게시글 : <strong><%=data %></strong></span> --%>
                    <caption>Q&A</caption>
                    <thead>
                        <tr>
                            <th scope="col">NO</th>
                            <th scope="col">분류</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <%for(Qna n : listQna){ 
                      System.out.println("n: " + n);
                    %>
                    <tbody>
                        <tr>
                            <td><%=n.getQnaNo() %></td>
                            <td>
                                <span><%=n.getQnaSep() %></span>
                            </td>
                            <td class="al">
                                <a href="<%=request.getContextPath() %>/qna/qnaView?no=<%=n.getQnaNo() %>" onclick="fn_view('3454','21'); return false;">
                                    <span>
                                        <%=n.getQnaTitle() %>
                                    </span>
                                </a>
                            </td>
                     
                            
                            
                            <td><%=n.getQnaWriter() %></td>
                            <td><%=n.getQnaDate() %></td>
                            <td><%=n.getQnaCount() %></td>                            
                        </tr>
                    </tbody>
                    <%} %>
                </table>
            </div>              
            <%if(MemberlogginedQna!=null && MemberlogginedQna.getMemberSep().equals("회원")){ %>
            <div id="writebtn">
                <a type="button" class="meple" id="movewrite" onclick="location.assign('<%=request.getContextPath()%>/qna/writeQna');">문의하기</a>
             
              </div>
                        
            <%} %>
       <div id="pageBar">
            <%=request.getAttribute("pageBar") %>
         </div>
       
    </div>

</section>
<script>

//검색창

$(function(){
   
   $("#searchkeyword").change(e=>{
      let member= $("#search-member");
      let title=$("#search-title");
      
       member.css("display","none"); 
      title.css("display","none");
      
      let value=$(e.target).val();
      $("#search-"+value).css("display","inline-block");
   })
//     $("input[name='searchkeyword']").blur(function(){
//       var k = $(this).val();
//       $(".tbl-list>tbody>tr").hide();
      
         
      
       if($("#searchkeyword").val()=='member'){
      var temp=$(".tbl-list>tbody>tr>td:nth-child(5n+2):contains('"+k+"')");
      } 
      
      if($("#searchkeyword").val()=='title'){
         temp=$(".tbl-list>tbody>tr>td:nth-child(5n+3):contains('"+k+"')");
      }
      
      $(temp).parent().show();
   })
   
});


</script>

<%@ include file="/views/common/footer.jsp"%>