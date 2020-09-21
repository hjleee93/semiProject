<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>지역별 추천</title>
<h2>지역을 선택해주세요</h2>
<script>
function sub(){
	var x = f.sel1.value;
 	$.ajax({  
  	type: "POST", 
  	url: "rlist.jsp",  
  	data: "region="+x,   //&a=xxx 식으로 뒤에 더 붙이면 됨
  	success: result    //function result 를 의미함
   		}
 	);

}

function result(msg){
//sub()가 실행되면 결과 값을 가지고 와서 action 을 취해주는 callback 함수
	var sel  =  document.f.sel2;
 	$("#sp1").html(msg);
}

</script>

<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>

</head>
<body>
<form name="f">
 <select name="sel1" onchange="sub();">
  <option value="">선택하세요</option>
  <option value="seoul">서울</option>
  <option value="kyung">경기</option>
  <option value="incheon">인천</option>
  <option value="gangwon">강원</option>
  <option value="chungcheong">충청</option>
  <option value="gyeongsang">경상</option>
  <option value="jeolla">전라</option>
  <option value="jeju">제주</option>
 </select>
 <span id="sp1">
  <select name="sel2">
   <option value="">선택하세요</option>
  </select>
 </span>
</form>
</body>
</html>
	