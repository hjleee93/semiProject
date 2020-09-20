<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="<%=request.getContextPath()%>/js/jquery-3.5.1.min.js"></script>
<style>
.card {
	background-color: tomato;
	width: 100%;
	height: 5px;
}
td{
	margin-left:10px;
}
tr td{
	padding:2%;
	text-align:center;
}
table{
	margin:auto;
	padding:0px;
}
input{
	border:none;
	border-right:0px; 
	border-top:0px; 
	boder-left:0px; 
	boder-bottom:0px;
	background:white;
}
button{
	background-color:white;
	margin-left:30%;
}
</style>
<section>
	<div class="mptitle">
		<h1>❤ R E V I E W ❤</h1>
	</div>
	<div class="container">
		<table>
			<div class="card" id="one">
				<tr>
					<td><img class="img-fluid rounded mb-3 mb-md-0"
						src="http://placehold.it/350x300" alt="">
					</td>
					<td><img class="img-fluid rounded mb-3 mb-md-0"
						src="http://placehold.it/350x300" alt=""></td>
					<td><img class="img-fluid rounded mb-3 mb-md-0"
						src="http://placehold.it/350x300" alt=""></td>
				</tr>
				<tr>
					<td>
						<p id="star_grade1">
				        <a>🤍</a>
				        <a>🤍</a>
				        <a>🤍</a>
				        <a>🤍</a>
				        <a>🤍</a>
						<button onclick="changebtn1();">🤍</button>
						</p>
					</td>
					<td>
						<p id="star_grade2">
				        <a>🤍</a>
				        <a>🤍</a>
				        <a>🤍</a>
				        <a>🤍</a>
				        <a>🤍</a>
						<button onclick="changebtn2();">🤍</button>
						</p>
					</td>
					<td>
						<p id="star_grade3">
				        <a>🤍</a>
				        <a>🤍</a>
				        <a>🤍</a>
				        <a>🤍</a>
				        <a>🤍</a>
						<button onclick="changebtn3();">🤍</button>
						</p>
					</td>			
				</tr>
				<tr>
					<td><textarea rows="3" cols="40"></textarea></td>
					<td><textarea rows="3" cols="40"></textarea></td>
					<td><textarea rows="3" cols="40"></textarea></td>
				</tr>
			</div>
		</table>
	</div>
<script>
	$('#star_grade1 a').click(function(){
	    $(this).text("❤");
	});
	$('#star_grade2 a').click(function(){
	    $(this).text("❤");
	});
	$('#star_grade3 a').click(function(){
	    $(this).text("❤");
	});
	function changebtn1(){
		$("#star_grade1 a").text("🤍");
	};
	function changebtn2(){
		$("#star_grade2 a").text("🤍");
	};
	function changebtn3(){
		$("#star_grade3 a").text("🤍");
	};
</script>
</section>

<%@ include file="/views/common/footer.jsp"%>