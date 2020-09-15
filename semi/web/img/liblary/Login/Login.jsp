<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 로그인이 필요합니다.</h1>
	<form action="/liblary/login.do" method="post">
		ID<input type="text" name="id" size="10">
		Password<input type="password" name="password" size="10">
		<input type="submit" value="로그인">
	</form>
	<a href="/liblary/Login/LostAndFind/FindLostId.jsp">아이디/비밀번호 찾기</a><br>
	<a href="./assign/checkUsedId.jsp">회원가입</a>


</body>
</html>