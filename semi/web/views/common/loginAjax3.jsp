<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi.member.model.service.*"%>
<%@ page import="com.semi.member.model.dao.*"%>
<%@ page import="com.semi.member.model.vo.Member" %>
    <%
    
    String inputId = request.getParameter("userId");
    String userPhone1 = request.getParameter("userPhone1");
    
    
    System.out.println("값: " + inputId +":" + userPhone1);
    
    //String foundId = new MemberService().foundId(userName, userPhone);
    %>
<div class="box" id="foundPw">
					<div class="content searchPwdBox" style="">
						<div class="form">
									<form method="post" action="<%=request.getContextPath()%>/pwdUpdate"
								accept-charset="UTF-8">
								<input name="<%=inputId%>" id="inputId" type="hidden" value="<%=inputId%>">
								<input name="<%=userPhone1%>" id="userPhone1" type="hidden" value="<%=userPhone1%>">
							<%if(inputId !=null){ %>
							<table>
							<tr>
							<td>변경 할 비밀 번호를 입력하세요 : </td>
							<td><input type="password" name="updatedId" id="updatedId" required="required" onchange="pwRequired()"></td>
							<td><span class="span" id="pwRequired"></span></td>
							</tr>
							<tr>
							<td>비밀 번호를 확인헤주세요: </td> 
							<td><input type="password" name="checkedId" id="checkedId" required="required" onchange="pswCheck1()"></td>
							<td><span
												class="span" id="pswCheck1"></span></td>
							</tr>
							</table>
							<input class="btn btn-default btn-login"
									id="loginBtn" type="button" value="확인" onclick="acyncMovePage('<%=request.getContextPath()%>/views/common/loginAjax3.jsp'); ">
							<%}else{ %>
							<p>회원님의 정보로 등록된 아이디가 없습니다.</p>
							<input class="btn btn-default btn-login"
									id="loginBtn" type="submit" value="확인">
							<%} %>
							</form>
						</div>

					</div>
				</div>
				
				
				<script>
				function acyncMovePage(url) {
					var inputId;
					var userPhone1;
					var updatedId;
					
					inputId = $('#inputId').val();
					userPhone1 = $('#userPhone1').val();
					updatedPwd = $('#updatedId').val();
					
					
					

					var ajaxOption = {
						url : url,
						type : "POST",
						dataType : "html",
						data : {
							"inputId" : inputId,
							"userPhone1" : userPhone1,
							"updatedPwd" : updatedPwd
							
							
						},
						success : function(data) {
							console.log("Succeeded to pass");
						}
					}

					$.ajax(ajaxOption).done(function(data) {

						$('#foundPw').children().remove();

						$('#foundPw').html(data);
					});
				}
				
				function pswCheck1() {
					var updatedId = document
							.getElementById("updatedId").value;
					var checkedId = document
							.getElementById("checkedId").value;
					var pswCheck1 = document
							.getElementById("pswCheck1");
					if (updatedId != '' && checkedId != '') {
						if (updatedId == checkedId) {
							pswCheck1.innerHTML = " 비밀번호가 일치합니다.";
							pswCheck1.style.color = "blue";
							return true;
						} else {
							pswCheck1.innerHTML = " 비밀번호가 일치하지 않습니다!";
							pswCheck1.style.color = "red";
							return false;
						}
					}
				}
				
				function pwRequired() {
					var updatedId = document
							.getElementById("updatedId").value;
					var pwRequired = document
							.getElementById("pwRequired");
					
					var condition1 = /^.*(?=^.{6,15}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
					if (condition1.test(updatedId)) {
						pwRequired.innerHTML = "조건이 일치합니다.";
						pwRequired.style.color = "blue";
						return true;
					} else {
						pwRequired.innerHTML = "조건이 일치하지 않습니다!";
						pwRequired.style.color = "red";
						return false;
					}
				}
				
				</script>


