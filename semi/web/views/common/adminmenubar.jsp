<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.*" %>
<title>관리자용 서브메뉴바</title>
<!-- 서브메뉴 -->
<%-- <%
	Member logginedMember = (Member)session.getAttribute("logginedMember");
%>
<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
 --%>
  <div class=submenu style="background-color: mediumpurple;">
	<%-- <%if(logginedMember!=null && logginedMember.getMember_id().equals("admin")){ %> --%>
    <ul>
      <li><a class="subhome" href="<%=request.getContextPath()%>/mypagecustomer">MYPAGE</a></li>
      <%-- <li><a class="subhome" href="<%=request.getContextPath()%>/adminpage">MYPAGE</a></li> --%>
      <li><a class="subhome" href="<%=request.getContextPath() %>/admin/reservationView">RESERVATION</a></li>
      <li><a class="subhome" href="<%=request.getContextPath() %>/storeRequestStatus">입점현황</a></li>
      <li><a class="subhome" href="<%=request.getContextPath() %>/admin/notice">NOTICE</a></li>
      <li><a class="subhome" href="<%=request.getContextPath() %>/qna">Q&A</a></li>
      <li><a class="subhome" href="<%=request.getContextPath() %>/usr_review.html">REVIEW</a></li>
    </ul>
  <%-- <%} %> --%>
  </div>