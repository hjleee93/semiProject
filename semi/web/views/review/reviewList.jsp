<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi.review.model.vo.Review,java.util.List" %>
    
 <%
 	List<Review> list=(List)request.getAttribute("list");
 %>  
    
<%-- <%@ include file="/views/common/header.jsp" %> --%><!--헤더추가하면 오류..?????????  -->
<section>
<div id="review-container">
			<button type="button" onclick="location.assign('<%=request.getContextPath()%>/review/reviewWrite')">리뷰쓰기</button>
			<table id="review-table">
				<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>별점</th>
					<th>작성일</th>
				</tr>
				<%for(Review r : list){ %>
					<tr>
						<td><a href="<%=request.getContextPath()%>/review/reivewDetailView?no=<%=r.getReviewNum()%>">
						<%=r.getReviewTitle() %></a>
						</td>
						
						<td><%=r.getMemberNum() %></td>
						
						<td><%=r.getReviewScore() %></td>
						
						<td><%=r.getReviewDate() %></td>
					</tr>
				<%} %>
			</table>
			<div id="pageBar">
				<%=request.getAttribute("pageBar") %>
			</div>
		</div>
</section>

<%@ include file="/views/common/footer.jsp" %>
