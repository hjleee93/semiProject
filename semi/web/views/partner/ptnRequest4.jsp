<%@page import="com.semi.storeservice.service.StoreServiceService"%>
<%@page import="com.semi.storeservice.model.vo.StoreService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ include file="/views/common/header.jsp"%> --%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
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

System.out.println("customerId: " + customerId);
System.out.println("에이젝스: " + selectedDay);

// for(int i = 0; i<serviceList.length; i++){
System.out.println("에이젝스 list: " + serviceList);






%>


	<tr>
	


		<td>선택 가능한 시간: </td>
		
<%
for(StoreService ss : serviceList){
if(selectedDay.equals("Sun") && ss.getStoreDay().equals("Sun")){
	if(ss.getOpenTime() != 0){
		String closeArr =String.valueOf(ss.getCloseTime());
		String openArr = String.valueOf(ss.getOpenTime());
		String startArr =String.valueOf(ss.getBreakStart());
		String endArr = String.valueOf(ss.getBreakEnd());
		
		if(closeArr.length() ==3){
			closeArr = "0" + closeArr;
		}
		if(openArr.length() ==3){
			openArr = "0" + openArr;
			
		}
		if(startArr.length() ==3){
			startArr = "0" + startArr;
			
		}
		if(endArr.length() ==3){
			endArr = "0" + endArr;
			
		}
		DateFormat hourFormat = new SimpleDateFormat("HHmm");
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		Date openTime =null;
		Date closeTime=null;
		Date startTime=null;
		Date endTime=null;
		
		if(Integer.parseInt(openArr) != 0){
		 openTime = hourFormat.parse(openArr); //오픈시간
		}
		if(Integer.parseInt(closeArr) != 0){
		 closeTime = hourFormat.parse(closeArr); //마감시간
		}
		if(Integer.parseInt(startArr) != 0){
		 startTime = hourFormat.parse(startArr); //브탐시작
		}
		if(Integer.parseInt(endArr) != 0){
		 endTime = hourFormat.parse(endArr); //브탐끝
		}
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		long diff = 0; //브탐있는경우
		long diffPm =0;//브탐x
		long diffAm = 0;
		long mintotal = 0;
		long minAm = 0;
		long minPm = 0;
		
		String bookingTime = null;
		String bookingTime2 =null;
		
		if(startTime==null){
			diff = closeTime.getTime() -openTime.getTime(); //브탐 없는 경우
			mintotal = diff/(60000*60);
			cal.setTime(openTime);
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간
		}else{
			diffAm = startTime.getTime()- openTime.getTime(); //브탐있는 경우 오전
			diffPm = closeTime.getTime() - endTime.getTime(); //브탐있는 경우 오후 
			minAm = diffAm/(60000*60);
			minPm =diffPm /(60000*60);
			
			
			cal.setTime(openTime);
			cal2.setTime(endTime);
			bookingTime2= hourFormat.format(cal2.getTime()); //30분 증가한 시간, start 시간
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간, open 시간
			System.out.println("브탐있음: "+ bookingTime);
			System.out.println("브탐시작: "+ bookingTime2);
		}
	%>
	<td>
	<% 
	if(ss.getBreakStart() == 0){//브탐없으면
	for(int i = 0; i<(mintotal)*4 ;i++){
		%><input type="radio" name="tueTime"><%=bookingTime %>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4 +1;i++){
			%><input type="radio" name="tueTime"><%=bookingTime %>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;
	}
	%><p>브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			%><input type="radio" name="tueTime"><%=bookingTime2 %>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
	
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
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
	if(ss.getOpenTime() != 0){
		String closeArr =String.valueOf(ss.getCloseTime());
		String openArr = String.valueOf(ss.getOpenTime());
		String startArr =String.valueOf(ss.getBreakStart());
		String endArr = String.valueOf(ss.getBreakEnd());
		
		if(closeArr.length() ==3){
			closeArr = "0" + closeArr;
		}
		if(openArr.length() ==3){
			openArr = "0" + openArr;
			
		}
		if(startArr.length() ==3){
			startArr = "0" + startArr;
			
		}
		if(endArr.length() ==3){
			endArr = "0" + endArr;
			
		}
		DateFormat hourFormat = new SimpleDateFormat("HHmm");
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		Date openTime =null;
		Date closeTime=null;
		Date startTime=null;
		Date endTime=null;
		
		if(Integer.parseInt(openArr) != 0){
		 openTime = hourFormat.parse(openArr); //오픈시간
		}
		if(Integer.parseInt(closeArr) != 0){
		 closeTime = hourFormat.parse(closeArr); //마감시간
		}
		if(Integer.parseInt(startArr) != 0){
		 startTime = hourFormat.parse(startArr); //브탐시작
		}
		if(Integer.parseInt(endArr) != 0){
		 endTime = hourFormat.parse(endArr); //브탐끝
		}
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		long diff = 0; //브탐있는경우
		long diffPm =0;//브탐x
		long diffAm = 0;
		long mintotal = 0;
		long minAm = 0;
		long minPm = 0;
		
		String bookingTime = null;
		String bookingTime2 =null;
		
		if(startTime==null){
			diff = closeTime.getTime() -openTime.getTime(); //브탐 없는 경우
			mintotal = diff/(60000*60);
			cal.setTime(openTime);
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간
		}else{
			diffAm = startTime.getTime()- openTime.getTime(); //브탐있는 경우 오전
			diffPm = closeTime.getTime() - endTime.getTime(); //브탐있는 경우 오후 
			minAm = diffAm/(60000*60);
			minPm =diffPm /(60000*60);
			
			
			cal.setTime(openTime);
			cal2.setTime(endTime);
			bookingTime2= hourFormat.format(cal2.getTime()); //30분 증가한 시간, start 시간
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간, open 시간
			System.out.println("브탐있음: "+ bookingTime);
			System.out.println("브탐시작: "+ bookingTime2);
		}
	%>
	<td>
	<% 
	if(ss.getBreakStart() == 0){//브탐없으면
	for(int i = 0; i<(mintotal)*4 ;i++){
		%><input type="radio" name="tueTime"><%=bookingTime %>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4 +1;i++){
			%><input type="radio" name="tueTime"><%=bookingTime %>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;
	}
	%><p>브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			%><input type="radio" name="tueTime"><%=bookingTime2 %>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
	
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
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
	if(ss.getOpenTime() != 0){
		String closeArr =String.valueOf(ss.getCloseTime());
		String openArr = String.valueOf(ss.getOpenTime());
		String startArr =String.valueOf(ss.getBreakStart());
		String endArr = String.valueOf(ss.getBreakEnd());
		
		if(closeArr.length() ==3){
			closeArr = "0" + closeArr;
		}
		if(openArr.length() ==3){
			openArr = "0" + openArr;
			
		}
		if(startArr.length() ==3){
			startArr = "0" + startArr;
			
		}
		if(endArr.length() ==3){
			endArr = "0" + endArr;
			
		}
		DateFormat hourFormat = new SimpleDateFormat("HHmm");
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		Date openTime =null;
		Date closeTime=null;
		Date startTime=null;
		Date endTime=null;
		
		if(Integer.parseInt(openArr) != 0){
		 openTime = hourFormat.parse(openArr); //오픈시간
		}
		if(Integer.parseInt(closeArr) != 0){
		 closeTime = hourFormat.parse(closeArr); //마감시간
		}
		if(Integer.parseInt(startArr) != 0){
		 startTime = hourFormat.parse(startArr); //브탐시작
		}
		if(Integer.parseInt(endArr) != 0){
		 endTime = hourFormat.parse(endArr); //브탐끝
		}
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		long diff = 0; //브탐있는경우
		long diffPm =0;//브탐x
		long diffAm = 0;
		long mintotal = 0;
		long minAm = 0;
		long minPm = 0;
		
		String bookingTime = null;
		String bookingTime2 =null;
		
		if(startTime==null){
			diff = closeTime.getTime() -openTime.getTime(); //브탐 없는 경우
			mintotal = diff/(60000*60);
			cal.setTime(openTime);
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간
		}else{
			diffAm = startTime.getTime()- openTime.getTime(); //브탐있는 경우 오전
			diffPm = closeTime.getTime() - endTime.getTime(); //브탐있는 경우 오후 
			minAm = diffAm/(60000*60);
			minPm =diffPm /(60000*60);
			
			
			cal.setTime(openTime);
			cal2.setTime(endTime);
			bookingTime2= hourFormat.format(cal2.getTime()); //30분 증가한 시간, start 시간
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간, open 시간
			System.out.println("브탐있음: "+ bookingTime);
			System.out.println("브탐시작: "+ bookingTime2);
		}
	%>
	<td>
	<% 
	if(ss.getBreakStart() == 0){//브탐없으면
	for(int i = 0; i<(mintotal)*4;i++){
		%><input type="radio" name="tueTime"><%=bookingTime %>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4+1;i++){
			%><input type="radio" name="tueTime"><%=bookingTime %>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;
	}
	%><p>브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			%><input type="radio" name="tueTime"><%=bookingTime2 %>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>

	</td>
</tr>
<tr>
	<td><select size="1" name ="ppl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
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
	if(ss.getOpenTime() != 0){
		String closeArr =String.valueOf(ss.getCloseTime());
		String openArr = String.valueOf(ss.getOpenTime());
		String startArr =String.valueOf(ss.getBreakStart());
		String endArr = String.valueOf(ss.getBreakEnd());
		
		if(closeArr.length() ==3){
			closeArr = "0" + closeArr;
		}
		if(openArr.length() ==3){
			openArr = "0" + openArr;
			
		}
		if(startArr.length() ==3){
			startArr = "0" + startArr;
			
		}
		if(endArr.length() ==3){
			endArr = "0" + endArr;
			
		}
		
		DateFormat hourFormat = new SimpleDateFormat("HHmm");
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		Date openTime =null;
		Date closeTime=null;
		Date startTime=null;
		Date endTime=null;
		
		if(Integer.parseInt(openArr) != 0){
		 openTime = hourFormat.parse(openArr); //오픈시간
		}
		if(Integer.parseInt(closeArr) != 0){
		 closeTime = hourFormat.parse(closeArr); //마감시간
		}
		if(Integer.parseInt(startArr) != 0){
		 startTime = hourFormat.parse(startArr); //브탐시작
		}
		if(Integer.parseInt(endArr) != 0){
		 endTime = hourFormat.parse(endArr); //브탐끝
		}
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		long diff = 0; //브탐있는경우
		long diffPm =0;//브탐x
		long diffAm = 0;
		long mintotal = 0;
		long minAm = 0;
		long minPm = 0;
		
		String bookingTime = null;
		String bookingTime2 =null;
		
		if(startTime==null){
			diff = closeTime.getTime() -openTime.getTime(); //브탐 없는 경우
			mintotal = diff/(60000*60);
			cal.setTime(openTime);
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간
		}else{
			diffAm = startTime.getTime()- openTime.getTime(); //브탐있는 경우 오전
			diffPm = closeTime.getTime() - endTime.getTime(); //브탐있는 경우 오후 
			minAm = diffAm/(60000*60);
			minPm =diffPm /(60000*60);
			
			
			cal.setTime(openTime);
			cal2.setTime(endTime);
			bookingTime2= hourFormat.format(cal2.getTime()); //30분 증가한 시간, start 시간
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간, open 시간
			System.out.println("브탐있음: "+ bookingTime);
			System.out.println("브탐시작: "+ bookingTime2);
		}
	%>
	<td>
	<% 
	if(ss.getBreakStart() == 0){//브탐없으면
	for(int i = 0; i<(mintotal)*4;i++){
		%><input type="radio" name="tueTime"><%=bookingTime %>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4+1;i++){
			%><input type="radio" name="tueTime"><%=bookingTime %>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;
	}
	%><p>브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			%><input type="radio" name="tueTime"><%=bookingTime2 %>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
	
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
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
	
	if(ss.getOpenTime() != 0){
		String closeArr =String.valueOf(ss.getCloseTime());
		String openArr = String.valueOf(ss.getOpenTime());
		String startArr =String.valueOf(ss.getBreakStart());
		String endArr = String.valueOf(ss.getBreakEnd());
		
		if(closeArr.length() ==3){
			closeArr = "0" + closeArr;
		}
		if(openArr.length() ==3){
			openArr = "0" + openArr;
			
		}
		if(startArr.length() ==3){
			startArr = "0" + startArr;
			
		}
		if(endArr.length() ==3){
			endArr = "0" + endArr;
			
		}
		
		DateFormat hourFormat = new SimpleDateFormat("HHmm");
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		Date openTime =null;
		Date closeTime=null;
		Date startTime=null;
		Date endTime=null;
		
		if(Integer.parseInt(openArr) != 0){
		 openTime = hourFormat.parse(openArr); //오픈시간
		}
		if(Integer.parseInt(closeArr) != 0){
		 closeTime = hourFormat.parse(closeArr); //마감시간
		}
		if(Integer.parseInt(startArr) != 0){
		 startTime = hourFormat.parse(startArr); //브탐시작
		}
		if(Integer.parseInt(endArr) != 0){
		 endTime = hourFormat.parse(endArr); //브탐끝
		}
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		long diff = 0; //브탐있는경우
		long diffPm =0;//브탐x
		long diffAm = 0;
		long mintotal = 0;
		long minAm = 0;
		long minPm = 0;
		
		String bookingTime = null;
		String bookingTime2 =null;
		
		if(startTime==null){
			diff = closeTime.getTime() -openTime.getTime(); //브탐 없는 경우
			mintotal = diff/(60000*60);
			cal.setTime(openTime);
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간
		}else{
			diffAm = startTime.getTime()- openTime.getTime(); //브탐있는 경우 오전
			diffPm = closeTime.getTime() - endTime.getTime(); //브탐있는 경우 오후 
			minAm = diffAm/(60000*60);
			minPm =diffPm /(60000*60);
			
			
			cal.setTime(openTime);
			cal2.setTime(endTime);
			bookingTime2= hourFormat.format(cal2.getTime()); //30분 증가한 시간, start 시간
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간, open 시간
			System.out.println("브탐있음: "+ bookingTime);
			System.out.println("브탐시작: "+ bookingTime2);
		}
	%>
	<td>
	<% 
	if(ss.getBreakStart() == 0){//브탐없으면
	for(int i = 0; i<(mintotal)*4;i++){
		%><input type="radio" name="tueTime"><%=bookingTime %>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4+1;i++){
			%><input type="radio" name="tueTime"><%=bookingTime %>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;
	}
	%><p>브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			%><input type="radio" name="tueTime"><%=bookingTime2 %>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
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
//선택한 날짜가 화요일인 경우
else if((selectedDay.equals("Tue") && ss.getStoreDay().equals("Tue"))){ 
	if(ss.getOpenTime() != 0){
		String closeArr =String.valueOf(ss.getCloseTime());
		String openArr = String.valueOf(ss.getOpenTime());
		String startArr =String.valueOf(ss.getBreakStart());
		String endArr = String.valueOf(ss.getBreakEnd());
		
		if(closeArr.length() ==3){
			closeArr = "0" + closeArr;
		}
		if(openArr.length() ==3){
			openArr = "0" + openArr;
			
		}
		if(startArr.length() ==3){
			startArr = "0" + startArr;
			
		}
		if(endArr.length() ==3){
			endArr = "0" + endArr;
			
		}
		
		DateFormat hourFormat = new SimpleDateFormat("HHmm");
		Calendar cal = Calendar.getInstance();
		Calendar cal2 = Calendar.getInstance();
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		Date openTime =null;
		Date closeTime=null;
		Date startTime=null;
		Date endTime=null;
		
		if(Integer.parseInt(openArr) != 0){
		 openTime = hourFormat.parse(openArr); //오픈시간
		}
		if(Integer.parseInt(closeArr) != 0){
		 closeTime = hourFormat.parse(closeArr); //마감시간
		}
		if(Integer.parseInt(startArr) != 0){
		 startTime = hourFormat.parse(startArr); //브탐시작
		}
		if(Integer.parseInt(endArr) != 0){
		 endTime = hourFormat.parse(endArr); //브탐끝
		}
		System.out.println("1: " + openArr);
		System.out.println("2: " + closeArr);
		System.out.println("3: " + startArr);
		System.out.println("4: " + endArr);
		
		long diff = 0; //브탐있는경우
		long diffPm =0;//브탐x
		long diffAm = 0;
		long mintotal = 0;
		long minAm = 0;
		long minPm = 0;
		
		String bookingTime = null;
		String bookingTime2 =null;
		
		if(startTime==null){
			diff = closeTime.getTime() -openTime.getTime(); //브탐 없는 경우
			mintotal = diff/(60000*60);
			cal.setTime(openTime);
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간
		}else{
			diffAm = startTime.getTime()- openTime.getTime(); //브탐있는 경우 오전
			diffPm = closeTime.getTime() - endTime.getTime(); //브탐있는 경우 오후 
			minAm = diffAm/(60000*60);
			minPm =diffPm /(60000*60);
			
			
			cal.setTime(openTime);
			cal2.setTime(endTime);
			bookingTime2= hourFormat.format(cal2.getTime()); //30분 증가한 시간, start 시간
			bookingTime = hourFormat.format(cal.getTime()); //30분 증가한 시간, open 시간
			System.out.println("브탐있음: "+ bookingTime);
			System.out.println("브탐시작: "+ bookingTime2);
		}
	%>
	<td>
	<% 
	if(ss.getBreakStart() == 0){//브탐없으면
	for(int i = 0; i<(mintotal)*4;i++){
		%><input type="radio" name="tueTime"><%=bookingTime %>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4+1;i++){
			%><input type="radio" name="tueTime"><%=bookingTime %>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;
	}
	%><p>브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			%><input type="radio" name="tueTime"><%=bookingTime2 %>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
	
		

	</td>
</tr>
<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
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
	<form action="<%=request.getContextPath() %>/store/reservation" method="post">
	<input type="hidden" name="storeId" value="<%=storeId%>">
	<input type="hidden" name="customerId" value="<%=customerId%>">
		<input type="submit" value="장바구니에 담기"> 
		<input type="submit"
			value="바로 예약하기">
			
			
</form>
</div>
