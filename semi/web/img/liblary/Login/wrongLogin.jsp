<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

아이디 또는 비밀번호가 잘못되었습니다. 다시 로그인하세요!
	<form action="/liblary/login.do" method="get">
		ID<input type="text" name="id" size="10">
		Password<input type="password" name="password" size="10">
		<input type="submit" value="로그인">
	</form>
	<a href="/liblary/Login/LostAndFind/FindLostId.jsp">아이디/비밀번호 찾기</a>

</body>
</html>