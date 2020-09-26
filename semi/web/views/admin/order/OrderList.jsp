<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/common/adminmenubar.jsp" %>
<%@ page import="com.semi.admin.order.vo.*,com.semi.store.model.vo.*"%>
<%
	List<Order> Orderlist = (List)request.getAttribute("Orderlist"); //오더리스트 다 받아오는거죠?넹
%>

<style>
		h1{margin-bottom:7%;}
		th{
			font-size: 15px;
			text-align: left;
			background-color: white;
			color:tomato;
		}
        table{
        	margin-top:2%;
	        font-family: futura-pt, sans-serif;
			font-weight: 400;
			font-style: normal;
			font-size: 0.7em;
			border-collapse: collapse;
			width: 95%;
			border-radius: 15px;
			box-shadow: 0px 0px 10px rgba(114, 114, 113, 0.5);
			overflow: auto;
		}
		tr:hover {
			background-color: rgba(114, 114, 113, 0.2);
		}
        #delete{
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
        <h1>R E S E R V A T I O N</h1>
    </div>
    <div class="container">
   <div class="tbl-box">
             <table class="tbl-list">
                 <caption>관리자 주문내역 조회</caption>
                 <thead>
                 <colgroup>
					<col width="50px">
					<col width="70px">
					<col width="70px">
					<col width="100px">
					<col width="70px">
					<col width="100px">
					<col width="70px">
					<col width="100px">
					<col width="100px">
					<col width="50px">
					<col width="100px">
				</colgroup>
                     <tr>
                         <th scope="col">예약번호</th>
                         <th scope="col">고객ID</th>
                         <th scope="col">고객이름</th>
                         <th scope="col">업체</th>
                         <th scope="col">구매메뉴</th>
                         <th scope="col">예약날짜</th>
                         <th scope="col">예약시간</th>
                         <th scope="col">요구사항</th>
                         <th scope="col">결제방법</th>
                         <th scope="col">인원수</th>
                         <th scope="col">구매일</th>
                     </tr>
                 </thead>
                 <tbody>
                 <%if(Orderlist==null){%>
                	<tr>
                		<td colspan="11">예약내역이 존재하지 않습니다.</td>
                	</tr> 
                 <%}else{
                 		for(Order o : Orderlist){
            	  %> 
                	
                    <tr>
                        <td><%=o.getRsvCode() %></td>
                        <td><%=o.getMemberId() %></td>
                        <td><%=o.getMemberName()%></td>
                        <td><%=o.getStoreName()%></td>
                        <td><%=o.getMenuName()%></td>
                        <td><%=o.getRsvDate()%></td>
                        <td><%=o.getRsvTime()%></td>
                        <td><%=o.getRsvRequiry()%></td>
                        <%if(o.getPaymentCode()==0){ %>
                        <td>신용카드</td>
                        <%}else if(o.getPaymentCode()==1){ %>
                        <td>무통장입금</td>
                        <%}else{ %>
                        <td>카카오페이</td>
                        <%} %>
                        <td><%=o.getRsvPPL() %></td>
                        <td><%=o.getPayDate() %></td>      
                    </tr>
                    <%}
                 	}%>
                </tbody>
             </table>
         </div>
         
	<div id="pageBar">
	<%=request.getAttribute("pageBar") %>
	</div>
       
    </div>


</section>


<%@ include file="/views/common/footer.jsp"%>