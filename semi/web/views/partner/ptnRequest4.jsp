<%@page import="com.semi.storeservice.service.StoreServiceService"%>
<%@page import="com.semi.storeservice.model.vo.StoreService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp"%> --%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List"%>
<%-- <%@ page import="com.semi.storeservice.model.vo.StoreService"%> --%>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/swiper-bundle.css">

<script src="<%=request.getContextPath()%>/js/swiper-bundle.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/review.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%
//  	Store s = (Store) request.getAttribute("store");
int storeId = Integer.parseInt(request.getParameter("storeId"));
int customerId =Integer.parseInt(request.getParameter("customerId"));
String selectedDate = request.getParameter("selectedDate");
String selectedDay = request.getParameter("selectedDay");
int ptnNum = Integer.parseInt(request.getParameter("ptnNum"));

List<StoreService> serviceList = new StoreServiceService().selectService(storeId, ptnNum);

System.out.println("에이젝스: " + selectedDay);

// for(int i = 0; i<serviceList.length; i++){
System.out.println("에이젝스: " + serviceList);






%>


	<tr>
	


		<td>선택 가능한 시간: </td>
		
<%
for(StoreService ss : serviceList){
if(selectedDay.equals("Sun") && ss.getStoreDay().equals("Sun")){
	if(ss.getOpenTime() != null){
		
	%>
		<td>
		
<%-- 		<% ss.getOpenTime()-ss.getBreakStart()%> --%>
		<input type="radio" name="selectedTime">11:00 
		<input type="radio" name="time">12:00 
		<input type="radio" name="time">12:30 
		<input type="radio" name="time">13:00
			

		</td>
	</tr>
	<tr>
		<td>인원 수</td>
		<td><select size="1" required>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5명 이상</option>
		</select></td>

	</tr>
	<tr>
		<td>기타</td>
		<td><textarea style="resize: none;"></textarea></td>
	</tr>
	<%}else{%>
	
	<p>휴무일 입니다</p>
	<%
}}else if((selectedDay.equals("Mon") && ss.getStoreDay().equals("Mon"))){
	if(ss.getOpenTime() != null){%>
	<td><input type="radio" name="time">11:00 <input
		type="radio" name="time">12:00 <input type="radio"
		name="time">12:30 <input type="radio" name="time">13:00
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" required>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5명 이상</option>
	</select></td>

</tr>
<tr>
	<td>기타</td>
	<td><textarea style="resize: none;"></textarea></td>
</tr>
<%}else{%>

<p>휴무일 입니다</p>
<%
}


}else if((selectedDay.equals("Wed") && ss.getStoreDay().equals("Wed"))){
	if(ss.getOpenTime() != null){

		String beforeSplitTime=ss.getOpenTime();
		String[] SplitTime = beforeSplitTime.split(":");
		int openTime = Integer.parseInt(SplitTime[0]);//오픈시간
		
		if(ss.getBreakStart() == null){
			System.out.println(openTime);
		}else{
		String beforeSplitTime1=ss.getBreakStart();
		String[] SplitTime1 = beforeSplitTime1.split(":");
		int breakStart = Integer.parseInt(SplitTime1[0]);//브탐시작 
		
		int time1 = openTime-breakStart;
		
		System.out.println(time1);
		}
	%>
	<td><input type="radio" name="time">11:00 <input
		type="radio" name="time">12:00 <input type="radio"
		name="time">12:30 <input type="radio" name="time">13:00
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" required>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5명 이상</option>
	</select></td>

</tr>
<tr>
	<td>기타</td>
	<td><textarea style="resize: none;"></textarea></td>
</tr>
<%}else{%>

<p>휴무일 입니다</p>
<%
}}else if((selectedDay.equals("Thur") && ss.getStoreDay().equals("Thur"))){
	if(ss.getOpenTime() != null){%>
	<td><input type="radio" name="time">11:00 <input
		type="radio" name="time">12:00 <input type="radio"
		name="time">12:30 <input type="radio" name="time">13:00
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" required>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5명 이상</option>
	</select></td>

</tr>
<tr>
	<td>기타</td>
	<td><textarea style="resize: none;"></textarea></td>
</tr>
<%}else{%>

<p>휴무일 입니다</p>
<%
}}else if((selectedDay.equals("Fri") && ss.getStoreDay().equals("Fri"))){
	if(ss.getOpenTime() != null){%>
	<td><input type="radio" name="time">11:00 <input
		type="radio" name="time">12:00 <input type="radio"
		name="time">12:30 <input type="radio" name="time">13:00
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" required>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5명 이상</option>
	</select></td>

</tr>
<tr>
	<td>기타</td>
	<td><textarea style="resize: none;"></textarea></td>
</tr>
<%}else{%>

<p>휴무일 입니다</p>
<%
}}else if((selectedDay.equals("Sat") && ss.getStoreDay().equals("Sat"))){
	if(ss.getOpenTime() != null){

		String beforeSplitTime=ss.getOpenTime();
		String[] SplitTime = beforeSplitTime.split(":");
		int openTime = Integer.parseInt(SplitTime[0]);
		System.out.println(openTime);
	%>
	<td><input type="radio" name="time">11:00 <input
		type="radio" name="time">12:00 <input type="radio"
		name="time">12:30 <input type="radio" name="time">13:00
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" required>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5명 이상</option>
	</select></td>

</tr>
<tr>
	<td>기타</td>
	<td><textarea style="resize: none;"></textarea></td>
</tr>
<%}else{%>

<p>휴무일 입니다</p>
<%
}}else if((selectedDay.equals("Tue") && ss.getStoreDay().equals("Tue"))){
	if(ss.getOpenTime() != null){%>
	<td><input type="radio" name="time">11:00 <input
		type="radio" name="time">12:00 <input type="radio"
		name="time">12:30 <input type="radio" name="time">13:00
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" required>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5명 이상</option>
	</select></td>

</tr>
<tr>
	<td>기타</td>
	<td><textarea style="resize: none;"></textarea></td>
</tr>
<%}else{%>

<p>휴무일 입니다</p>
<%
}}
}
		%>


		
	</tbody>
	
	<div class="btn_wrap text-center">
	<form action="/store/reservation" method="post">
	<input type="hidden" name="storeId" value="<%=storeId%>">
<input type="hidden" name="customerId" value="<%=customerId%>">
		<input type="submit" value="장바구니에 담기"> 
		<input type="submit"
			value="바로 구매하기">
			
			
</form>
</div>
