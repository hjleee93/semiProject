<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.*" %>
<title>관리자용 서브메뉴바</title>
<!-- 서브메뉴 -->

  <div class=submenu style="background-color: mediumpurple;">
  
    <ul>
      <li><a class="subhome" href="<%=request.getContextPath()%>/admin/adminpage">MYPAGE</a></li>
      <li><a class="subhome" href="<%=request.getContextPath() %>/rsv/reservationView">RESERVATION</a></li>
      <li><a class="subhome" href="<%=request.getContextPath() %>/admin/StoreRequestStatus">입점현황</a></li>
      <li><a class="subhome" href="<%=request.getContextPath() %>/notice">NOTICE</a></li>
      <li><a class="subhome" href="<%=request.getContextPath() %>/qna">Q&A</a></li>
      <li><a class="subhome" href="<%=request.getContextPath() %>/admin/order">주문현황</a></li>
    </ul>
  
  </div>