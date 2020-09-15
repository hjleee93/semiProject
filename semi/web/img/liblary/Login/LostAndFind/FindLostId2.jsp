<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
당신의 아이디는<%=request.getAttribute("id") %> 이며 <br>
비밀번호는 이메일 주소와 같습니다.
<a href="/liblary/index.jsp">메인페이지로</a>

</body>
</html>