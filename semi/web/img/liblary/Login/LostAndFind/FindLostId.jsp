<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>아이디 / 비밀번호 찾기</h1>
<form action="/liblary/findId.do">
<table>
	<tr>
		<td> 성명 </td> 
		<td> <input type="text" name="name" size="10"> </td>
	</tr>
	
	<tr>
		<td> 이메일 </td>
		<td> <input type="text" name="email" size="20"> </td>
	</tr>
	
	<tr>
		<td colspan="2"> <input type="submit" value="아이디, 비밀번호 찾기" > </td>
	</tr>
</table>	
</form>


</body>
</html>