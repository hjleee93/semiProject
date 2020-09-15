<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<script type="text/javascript">


var checkPasswordRule;
var checkNameRule;
var checkEmailRule;

function validatePassword(value) {	//패스워드 검증 
	var alphaSmall =/[a-z]/;
	var alphaBig=/[A-Z]/;
	var number=/[0-9]/;
	var specialChar=/[!@#$%^&*()_+|]/;
	var space =/[\s]/;
	checkPasswordRule=false;
	if(value.length >15 || value.length < 9) 
		document.getElementById("passwordSpan").innerHTML="9자리 ~ 15자리 입력";
	else if(!number.test(value))
		document.getElementById("passwordSpan").innerHTML="숫자를 포함시켜야 합니다.";
	else if(!alphaSmall.test(value) && !alphaBig.test(value)) 
		document.getElementById("passwordSpan").innerHTML="알파벳을 포함시켜야합니다.";
	else if(!specialChar.test(value)) 
		document.getElementById("passwordSpan").innerHTML="특수문자를 포함시켜야 합니다.";
	else if(space.test(value)) 
		document.getElementById("passwordSpan").innerHTML="공백은 사용 할 수 없습니다.";
	else {
		checkPasswordRule=true;
		document.getElementById("passwordSpan").innerHTML="사용가능합니다.";
	}
}

function validateName(value) { // 이름 검증
	var alphaSmall =/[a-z]/;
	var alphaBig=/[A-Z]/;
	var korean=/^[가-힣]+$/;
	var english=/^[A-z]+$/;
	checkNameRule=false;
	//이름 검증 시작
	if(value.length<1 || value.length>20)
		document.getElementById("nameSpan").innerHTML="1자리 ~ 20자리 입력";
	else if(!korean.test(value) && !english.test(value)) 
		document.getElementById("nameSpan").innerHTML="영문또는 한글 사용. 공백불가. 혼용물가";
	else {
		checkNameRule=true;
		document.getElementById("nameSpan").innerHTML="사용가능합니다.";
	}	
}

function validateEmail(value) { //email검증
	var emailRule=/^\w+@\w+\.\w+$/;
	checkEmailRule=false;

	if(!emailRule.test(value)) {
		document.getElementById("emailSpan").innerHTML="올바른 e-mail주소를 입력하세요";
	}
	else {
		checkEmailRule=true;
		document.getElementById("emailSpan").innerHTML="사용가능합니다.";
	}
}

function placeOrder(form) { //form 제출
	if(!checkPasswordRule) {
		alert("패스워드를 올바르게 입력하세요");
		validatePassword(document.getElementById("password").value);
	}
	else if(!checkNameRule) {
		alert("이름을 올바르게 입력하세요");
		validateName(document.getElementById("name").value);
	}
	else if(!checkEmailRule) {
		alert("이메일을 올바르게 입력하세요");
		validateEmail(document.getElementById("email").value);
	}
	else {
		form.submit();
	}
}

</script>
<body>

아이디 생성 페이지

	<form action="/liblary/createId.do" method="post">
	<table border="1">
		<tr>			
			<td>아이디</td>		
			<td><%=request.getParameter("newId") %><input type="hidden" name="newId" value="<%=request.getParameter("newId")%>"></td>	
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" size="10" id="password" onblur="validatePassword(this.value)"><span id="passwordSpan" style="color: red;" >9~15자리. 영문, 숫자, 특수문자 포함</span></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" onblur="validateName(this.value)" size="10"><span id="nameSpan" style="color: red;">1~20자리 영문, 한글</span></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email" size="20" onblur="validateEmail(this.value)"><span id="emailSpan" style="color: red;"></span></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="회원가입" onclick="placeOrder(this.form)"></td>
		</tr>
	</table>
	</form>
</body>
</html>