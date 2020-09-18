<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%-- <%@ include file="/views/common/header.jsp"%> --%>


<!DOCTYPE html>
<html>
<head>
<title>달력</title>




<!-- 임시 -->


<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 	카카오맵API추가 20/09/09 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f450544bd9053c96d7b9a97ececcb59a&libraries=services,clusterer,drawing"></script>


<!-- Bootstrap core CSS -->
<link
	href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/modern-business.css"
	type="text/css">



<!-- 커스텀 css 추가 -->
<link href="<%=request.getContextPath()%>/css/mainCustom.css"
	rel="stylesheet">

<!-- 폰트 -->
<link rel="stylesheet"
	href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">

<!-- datepicker -->

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />


<!-- 로그인, 회원가입  -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/login-register.js"></script>
<link href="<%=request.getContextPath()%>/css/login-register.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<script src="<%=request.getContextPath()%>/js/bootstrap.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/login-register.js"
	type="text/javascript"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap"
	rel="stylesheet">


<!-- 다음 주소 api  -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 임시끝 -->



<style type="text/css">
td {
	width: 50px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	font-family: 굴림;
	border: 2px border-color:#3333FF;
	border-radius: 8px; /*모서리 둥글게*/
}
</style>
<script type="text/javascript">
	var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date();//today의 Date를 세어주는 역할
	function prevCalendar() {//이전 달
		// 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() - 1, today
				.getDate());
		buildCalendar(); //달력 cell 만들어 출력 
	}

	function nextCalendar() {//다음 달
		// 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
		//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
		//getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
		today = new Date(today.getFullYear(), today.getMonth() + 1, today
				.getDate());
		buildCalendar();//달력 cell 만들어 출력
	}
	function buildCalendar() {//현재 달 달력 만들기
		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		//이번 달의 첫째 날,
		//new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
		//new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
		//왜냐면 getMonth()는 0~11을 반환하기 때문
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		//이번 달의 마지막 날
		//new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
		//day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
		//대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
		var tbCalendar = document.getElementById("calendar");
		//날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
		var tbCalendarYM = document.getElementById("tbCalendarYM");
		//테이블에 정확한 날짜 찍는 변수
		//innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
		//new를 찍지 않아서 month는 +1을 더해줘야 한다. 
		tbCalendarYM.innerHTML = today.getFullYear() + "년 "
				+ (today.getMonth() + 1) + "월";

		/*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
		while (tbCalendar.rows.length > 2) {
			//열을 지워줌
			//기본 열 크기는 body 부분에서 2로 고정되어 있다.
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
			//테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
			//30일 이후로 담을달에 순서대로 열이 계속 이어진다.
		}
		var row = null;
		row = tbCalendar.insertRow();
		//테이블에 새로운 열 삽입//즉, 초기화
		var cnt = 0;// count, 셀의 갯수를 세어주는 역할
		// 1일이 시작되는 칸을 맞추어 줌
		for (i = 0; i < doMonth.getDay(); i++) {
			/*이번달의 day만큼 돌림*/
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
		}
		/*달력 출력*/
		for (i = 1; i <= lastDate.getDate(); i++) {
			//1일부터 마지막 일까지 돌림
			cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
			cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
			cell.setAttribute("id", "day" + i);
			cell.setAttribute("value", i);
			cell.setAttribute("class", "row-day");
			cell.setAttribute("onclick", "getDate(this);");
			cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
			if (cnt % 7 == 1) {/*일요일 계산*/
				//1주일이 7일 이므로 일요일 구하기
				//월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
				cell.innerHTML = "<font color=#F79DC2>" + i
				//1번째의 cell에만 색칠
			}
			if (cnt % 7 == 0) {/* 1주일이 7일 이므로 토요일 구하기*/
				//월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
				cell.innerHTML = "<font color=skyblue>" + i
				//7번째의 cell에만 색칠
				row = calendar.insertRow();
				//토요일 다음에 올 셀을 추가
			}
			/*오늘의 날짜에 노란색 칠하기*/
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) {
				//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
				cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
			}
		}
	};
</script>
</head>
<body>
	<div style="display: flex;">
		<div style="width: 50%">
			<h3 align="center">예약 상세사항을 선택하세요</h3>

			<table id="calendar" border="3" align="center"
				style="border-color: #3333FF">
				<tr>
					<td><label onclick="prevCalendar()"><</label></td>

					<td align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</td>
					<td><label onclick="nextCalendar()">> </label></td>
				</tr>
				<tr>
					<td align="center"><font color="#F79DC2">일</td>
					<td align="center">월</td>
					<td align="center">화</td>
					<td align="center">수</td>
					<td align="center">목</td>
					<td align="center">금</td>
					<td align="center"><font color="skyblue">토</td>
				</tr>
			</table>
		</div>
		<div>
<!-- 		폼시작 -->
			<form>
				<table >
					<tr>
						<td>선택한 날짜:</td>
						<td id="selectedDate">
						</td>
					</tr>
					<tr >
						<td>선택 가능한 시간:</td>
						<td id="timeSelector">
						<input type="radio" name="time">11:00
						<input type="radio" name="time">12:00
						<input type="radio" name="time">12:30
						<input type="radio" name="time">13:00
						</td>
					</tr>
					<tr>
					<td>인원 수</td>
					<td><input type="number" name="ppl" min=0></td>
					
					</tr>
					<tr>
					<td>기타</td>
					<td><textarea></textarea></td>
					</tr>
				</table>
				<input type="reset" value="취소">
				<input type="submit" value="예약">
				
				
				 	
				
			</form>
		</div>
	</div>
	<script language="javascript" type="text/javascript">
		buildCalendar();
		

		function getDate(e) {
			$("tr td#selectedDate input").remove();
			var selectedDay = $(e).attr('value');
			var selectedMonth = (today.getMonth() + 1);
			var selectedYear = today.getFullYear();

			var input = document.createElement("input");

			input.setAttribute("id", "selectedDt");
			input.setAttribute("type", "text");
			input.setAttribute("name", "selectedDate");
			input.setAttribute("readonly", "readonly");

			if ((selectedDay + "").length < 2) {
				selectedDay = "0" + selectedDay;
			}
			if ((selectedMonth + "").length < 2) {
				selectedMonth = "0" + selectedMonth;
			}

			var today1 = new Date();

			var currentD = today1.getDate() + (today1.getMonth() + 1)
					+ today1.getFullYear();
			var selectDt = selectedYear + "" + selectedMonth + "" + selectedDay;
			var compareDt = new Date(selectDt.substring(0, 4), selectDt.substring(
					4, 6) - 1, selectDt.substring(6, 8));

			
			if (compareDt < today1) {
				alert("오늘 날짜 이후를 선택해주세요");
				
			} else {
				input.setAttribute("value", (selectedYear + "/" + selectedMonth
						+ "/" + selectedDay));

				document.querySelector("tr td#selectedDate").appendChild(input);
				
			
			
						
			
			}
			
		};
		
		//TODO:데이터 처리 어떻게 할지 수정 
		$(".row-day").click(e => {
			$.ajax({
				url:"<%=request.getContextPath()%>/reservation",
				type:"get",
				dataType:"html",
				success: data => {
					console.log(data);
					
					<tr>
					<td>선택 가능한 시간:</td>
					<td id="timeSelector">
					<input type="radio" name="time">11:00
					<input type="radio" name="time">12:00
					<input type="radio" name="time">12:30
					<input type="radio" name="time">13:00
					</td>
				</tr>
					$("#timeSelector").html(data);
				}
			})
		});
		
		
		
	</script>
</body>
</html>

<%@ include file="/views/common/footer.jsp"%>