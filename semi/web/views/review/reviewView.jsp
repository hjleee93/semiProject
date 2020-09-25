<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.review.model.vo.Review" %>
<% Review r=(Review)request.getAttribute("review"); %>
<%@ include file="/views/common/header.jsp" %>
<!--리뷰 상세 페이지  -->
<section>
	<div id="reivew-detail">
		<table id="review-tbl">
			<tr>
				<th>제목</th>
				<td><%=r.getReviewTitle() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=r.getMemberNum() %></td>
			</tr>
			<tr>
				<th>별점</th>
				<td><%=r.getReviewScore() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=r.getReviewContent() %></td>
			</tr>
			<tr>
				<th>후기사진</th>
				<td><%=r.getReviewPicsa() %></td>
				<td><%=r.getReviewPicsb() %></td>
				<td><%=r.getReviewPicsc() %></td>
			</tr>
		</table>
	</div>
</section>

<%@ include file="/views/common/footer.jsp" %>
