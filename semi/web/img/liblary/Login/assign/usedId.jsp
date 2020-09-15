<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
		var IdCheck="not done";
	function validateId(value) {       //id 값 검증
		var IdRule = /^\w+$/;
		if(value.length==0) {
			alert("아이디를 입력하세요");
		}
		else if(value.length >10) {
			alert("1~10자리의 아이디를 입력하세요");		
		}
		else if(!IdRule.test(value)) {
			alert("1~10자리의 영문/숫자를 입력하세요");
		}
		else {
			IdCheck="Done";
		}
	}
	
	function placeOrder(form) {  // form 제출
		if(IdCheck=="Done") {
			form.submit();
		}
		else {
			alert("1~10자리의 영문/숫자를 입력하세요");
		}
	}
</script>

<body>
<h1>사용중인 아이디 입니다.</h1>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>
				<form name="ss" action="/liblary/checkUsedId.do" method="post">
					<input type="text"  name="newId" size="10" onblur="validateId(this.value)">
					<input type="button"  value="회원가입" onclick="placeOrder(this.form)">
				</form>
			</td>
		</tr>
	</table>
	
	<a href="../LostAndFind/findLostId.jsp">아이디/비밀번호 찾기</a>

</body>