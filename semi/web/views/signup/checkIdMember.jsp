<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.semi.member.model.vo.Member" %>
<%
	//m이 null이면 사용가능한 아이디, null이 아니면 불가능한 아이디
	 Member m=(Member)request.getAttribute("result");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member id 중복검사</title>
<style>
	div#checkId-container{text-align:center;padding-top:50px;}
	span#duplicated{color:blue;font-weight:bolder;}
</style>
</head>
<body>
	<div id="checkId-container">
		<%if(m==null) {%>
			<span><%=request.getParameter("member_id") %></span> 는 사용가능합니다.
			<br><br>
			<button type="button" onclick="setUserId();">닫기</button>
		<%} else{%>
			<span id="duplicated"><%=m.getMemberId()%></span> 는 사용중입니다.
			<br><br>
			<!-- 아이디 재입력창 구성 -->
			<form action="<%=request.getContextPath() %>/checkIdMember" method="post">
				<input type="text" name="member_id" id="member_id">
				<input type="submit" value="중복검사" onclick="return fn_validate();">
			</form>
		<%} %>
	</div>
	<script>
		function fn_validate(){
			let id=document.getElementById("member_id").value;
			if(id.trim().length<4){
				alert("아이디는 4글자 이상 입력하세요!");
				document.getElementById("member_id").focus();
				return false;
			}
		}
		function setUserId(){
			//입력된 id를 부모창에 대입
			const id='<%=request.getParameter("member_id")%>';
			opener.memberEnrollFrm.member_id.value=id;
			opener.memberEnrollFrm.member_name.focus();
			//팝업창 닫아주기
			close();
		}
	</script>
</body>
</html>









