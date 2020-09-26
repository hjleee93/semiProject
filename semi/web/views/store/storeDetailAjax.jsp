<%@page import="com.semi.storeservice.service.StoreServiceService"%>
<%@page import="com.semi.storeservice.model.vo.StoreSvc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.semi.store.model.vo.*"%>
<%@ page import="com.semi.store.service.*"%>
<%-- <%@ page import="com.semi.storeservice.model.vo.StoreService"%> --%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%
	//  	Store s = (Store) request.getAttribute("store");

int storeId = Integer.parseInt(request.getParameter("storeId"));
int customerId =Integer.parseInt(request.getParameter("customerId"));
String selectedDate = request.getParameter("selectedDate");

String selectedDay = request.getParameter("selectedDay");
int ptnNum = Integer.parseInt(request.getParameter("ptnNum"));



List<StoreSvc> serviceList = new StoreServiceService().selectService(storeId, ptnNum);


StoreMenu sm =(StoreMenu)request.getAttribute("StoreMenu");
List<StoreMenu> menuList = new StoreMenuService().selectStoreMenu(storeId);

System.out.println("customerId: " + selectedDate);
System.out.println("customerId: " + customerId);
System.out.println("에이젝스: " + selectedDay);

// for(int i = 0; i<serviceList.length; i++){
System.out.println("에이젝스 list: " + serviceList);
%>




<form action="<%=request.getContextPath()%>/store/reservation" method="post">
<table>
	
		
<%
				for(StoreSvc ss : serviceList){
				
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
	<tr>
	

		<td>선택 가능한 시간: </td></tr>
	<td>
	<% 
	if(ss.getBreakStart() == 0){//브탐없으면
	for(int i = 0; i<(mintotal)*4 ;i++){
		%>
		<%
		String bookTime = bookingTime; 
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-danger">
		
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		</label>
		</div>
		
		
		<%
		
		cal.add(Calendar.MINUTE, 30);
		System.out.println("선택값: " +bookingTime);
		
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4 +1;i++){
			%>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
		
		<%
		String bookTime = bookingTime; 
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		
		</label>
		</div>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;}
			startArr = startArr.substring(0,2)+ ":"+ startArr.substring(2,4);
			endArr = endArr.substring(0,2)+ ":"+ endArr.substring(2,4);
		%>
		
		<p class="break-tm-ds">브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			String bookTime2 = bookingTime2; 
			bookingTime2 = bookingTime2.substring(0,2)+ ":"+ bookingTime2.substring(2,4);
			%>
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" >
			<input type="radio" name="rsvTime" value="<%=bookTime2 %>"><%=bookingTime2 %>
			
			</label>
		</div>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
	
		

	</td>

<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" class="ppl-dl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
	</select></td>

</tr>
<tr>
	<td>기타</td>
	<td><textarea name="rsvRequire" style="resize: none;"></textarea></td>
</tr>

<tr>
<td colspan="2"><input class="rsv-btn" type="submit"
			value="바로 예약하기"></td>
			</tr>
<%}else{%>
	
	<div style="width:1800px;"><p>휴무일 입니다</p></div>
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
	<td class="time-btn">
	<% 
	if(ss.getBreakStart() == 0){//브탐없으면
	for(int i = 0; i<(mintotal)*4 ;i++){
		%>
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-danger">
		
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		</label>
		</div>
		
		
		
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4 +1;i++){
			%>
			
			<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
		
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		
		</label>
		</div>
			
			
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;
	}
		startArr = startArr.substring(0,2)+ ":"+ startArr.substring(2,4);
		endArr = endArr.substring(0,2)+ ":"+ endArr.substring(2,4);
	%>
	
	<p class="break-tm-ds">브레이크타임<%=startArr %>~<%= endArr%></p>
	
	<%
		for(int i = 0; i<(minPm)*4;i++){
			String bookTime2 = bookingTime2;
			bookingTime2 = bookingTime2.substring(0,2)+ ":"+ bookingTime2.substring(2,4);
			%>
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
			<input type="radio" name="rsvTime" value="<%=bookTime2 %>"><%=bookingTime2 %>
			
			</label>
		</div>
			
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
	
		

	</td>

<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" class="ppl-dl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
	</select></td>

	

</tr>
<tr>
	<td>기타</td>
	<td><textarea name="rsvRequire" style="resize: none;"></textarea></td>
</tr>

<tr>
<td colspan="2"><input class="rsv-btn" type="submit"
			value="바로 예약하기"></td>
			</tr>
<%}else{%><div style="width:1800px;"><p>휴무일 입니다</p></div>
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
		%>
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-danger">
		
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		</label>
		</div>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4+1;i++){
			%>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
		
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		
		</label>
		</div>
			
			
			
			
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;
	}
	startArr = startArr.substring(0,2)+ ":"+ startArr.substring(2,4);
		endArr = endArr.substring(0,2)+ ":"+ endArr.substring(2,4);
	%>
	
	<p class="break-tm-ds">브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			String bookTime2 = bookingTime;
			bookingTime2 = bookingTime2.substring(0,2)+ ":"+ bookingTime2.substring(2,4);
			%>
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
			<input type="radio" name="rsvTime" value="<%=bookTime2 %>"><%=bookingTime2 %>
			
			</label>
		</div>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>

	</td>

<tr>
	<td><select size="1" name ="ppl" class="ppl-dl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
	</select></td>


</tr>
<tr>
	<td>기타</td>
	<td><textarea name="rsvRequire" style="resize: none;"></textarea></td>
</tr>

<tr><td colspan="2"><input class="rsv-btn" type="submit"
			value="바로 예약하기"></td>
			</tr>
<%}else{%>

<div style="width:1800px;"><p>휴무일 입니다</p></div>
<%
}}else if((selectedDay.equals("Sat") && ss.getStoreDay().equals("Sat"))){

	
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
		%>
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
	
		%>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-danger">
		
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		</label>
		</div>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4+1;i++){
			%>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
		
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		
		</label>
		</div>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;
		}
			startArr = startArr.substring(0,2)+ ":"+ startArr.substring(2,4);
			endArr = endArr.substring(0,2)+ ":"+ endArr.substring(2,4);
		%>
		
		<p class="break-tm-ds">브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			String bookTime2 = bookingTime;
			bookingTime2 = bookingTime2.substring(0,2)+ ":"+ bookingTime2.substring(2,4);
			%>
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
			<input type="radio" name="rsvTime" value="<%=bookTime2 %>"><%=bookingTime2 %>
			
			</label>
		</div>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>

	</td>

<tr>
	<td><select size="1" name ="ppl"  class="ppl-dl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
	</select></td>


</tr>
<tr>
	<td>기타</td>
	<td><textarea name="rsvRequire" style="resize: none;"></textarea></td>
</tr>

<tr><td colspan="2"><input class="rsv-btn" type="submit"
			value="바로 예약하기"></td>
			</tr>
<%}else{%>
<div style="width:1800px;"><p>휴무일 입니다</p></div>
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
		%>
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-danger">
		
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		</label>
		</div>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4+1;i++){
			%>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
		
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		
		</label>
		</div>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;}
			startArr = startArr.substring(0,2)+ ":"+ startArr.substring(2,4);
			endArr = endArr.substring(0,2)+ ":"+ endArr.substring(2,4);
		%>
		
		<p class="break-tm-ds">브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			String bookTime2 = bookingTime;
			bookingTime2 = bookingTime2.substring(0,2)+ ":"+ bookingTime2.substring(2,4);
			%>
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
			<input type="radio" name="rsvTime" value="<%=bookTime2 %>"><%=bookingTime2 %>
			
			</label>
		</div>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
	
		

	</td>

<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" class="ppl-dl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
	</select></td>

</tr>
<tr>
	<td>기타</td>
	<td><textarea name="rsvRequire" style="resize: none;"></textarea></td>
</tr>

<tr><td colspan="2"><input class="rsv-btn" type="submit"
			value="바로 예약하기"></td>
			</tr>
<tr>
<%}else{%>
<div style="width:1800px;"><p>휴무일 입니다</p></div>
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
		%>
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-danger">
		
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		</label>
		</div>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4+1;i++){
			%>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
		
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		
		</label>
		</div>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;}
			startArr = startArr.substring(0,2)+ ":"+ startArr.substring(2,4);
			endArr = endArr.substring(0,2)+ ":"+ endArr.substring(2,4);
		%>
		
		<p class="break-tm-ds">브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			String bookTime2 = bookingTime;
			bookingTime2 = bookingTime2.substring(0,2)+ ":"+ bookingTime2.substring(2,4);
			%>
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
			<input type="radio" name="rsvTime" value="<%=bookTime2 %>"><%=bookingTime2 %>
			
			</label>
		</div>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
		

	</td>

<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" class="ppl-dl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
	</select></td>

</tr>
<tr>
	<td>기타</td>
	<td><textarea name="rsvRequire" style="resize: none;"></textarea></td>
</tr>

<tr>
<td colspan="2"><input class="rsv-btn" type="submit"
			value="바로 예약하기"></td>
			</tr>
<%}else{%>
<div style="width:1800px;"><p>휴무일 입니다</p></div>
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
		%>
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<div class="btn-group btn-group-toggle" data-toggle="buttons">
		<label class="btn btn-danger">
		
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		</label>
		</div>
		<%cal.add(Calendar.MINUTE, 30);
		bookingTime = hourFormat.format(cal.getTime());
		i++;
	}
	}else{//브탐있
		for(int i = 0; i<(minAm)*4+1;i++){
			%>
			<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
		
		<%
		String bookTime = bookingTime;
		bookingTime = bookingTime.substring(0,2)+ ":"+ bookingTime.substring(2,4);
		%>
		<input type="radio" id="jb-radio-1" name="rsvTime" value="<%=bookTime %>"><%=bookingTime %>
		
		</label>
		</div>
			<%cal.add(Calendar.MINUTE, 30);
			
			bookingTime = hourFormat.format(cal.getTime());
			i++;}
			startArr = startArr.substring(0,2)+ ":"+ startArr.substring(2,4);
			endArr = endArr.substring(0,2)+ ":"+ endArr.substring(2,4);
		%>
		
		<p class="break-tm-ds">브레이크타임<%=startArr %>~<%= endArr%></p><%
		for(int i = 0; i<(minPm)*4;i++){
			String bookTime2 = bookingTime;
			bookingTime2 = bookingTime2.substring(0,2)+ ":"+ bookingTime2.substring(2,4);
			%>
				<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin:5px;">
		<label class="btn btn-info" style="background-color: #0000ef57; border-color:#0000ef57">
			<input type="radio" name="rsvTime" value="<%=bookTime2 %>"><%=bookingTime2 %>
			
			</label>
		</div>
			<%cal2.add(Calendar.MINUTE, 30);
			bookingTime2 = hourFormat.format(cal2.getTime());
			i++;
	}
	}
	%>
	
		

	</td>

<tr>
	<td>인원 수</td>
	<td><select size="1" name ="ppl" class="ppl-dl" required>
		<%for(int i = ss.getMinPpl(); i<=ss.getMaxPpl();i++ ){
		
		%>
			<option value="<%=i %>"><%=i %></option>
	
<%} %>
</select></td>
</tr>

<tr>
	<td>기타</td>
	<td><textarea name="rsvRequire" style="resize: none;"></textarea></td>
</tr>
<tr>
<td colspan="2"><input class="rsv-btn" type="submit"
			value="바로 예약하기"></td>
			</tr>
<%}else{%>
<div style="width:1800px;"><p>휴무일 입니다</p></div>
<%
}}
}
		%>


		
	</table>
	
	<input type="hidden" name="selectedDate" value="<%= selectedDate%>">
<input type="hidden" name="storeId" value="<%=storeId%>">
	<input type="hidden" name="customerId" value="<%=customerId%>">
</form>
	
	
		
				


