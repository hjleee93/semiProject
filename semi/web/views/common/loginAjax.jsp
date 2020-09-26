<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.semi.member.model.service.*"%>
<%@ page import="com.semi.member.model.dao.*"%>
<%@ page import="com.semi.member.model.vo.Member" %>
    <%
    
    String userName = request.getParameter("userName");
    String userPhone = request.getParameter("userPhone");
    String inputId = request.getParameter("userId");
    String userPhone1 = request.getParameter("userPhone1");
    System.out.println("값: " + inputId +":" + userPhone1);
    
    String foundId = new MemberService().foundId(userName, userPhone);
    %>
<div class="box" id="foundId">
					<div class="content searchPwdBox" style="">
						<div class="form">
							<form>
							<%if(foundId!=null){ %>
							<p>입력하신 이름은
							<%=userName %>이고 <%=userName %>님의 전화번호는 <%=userPhone %>입니다.</p>
							회원님의 아이디는 <%=foundId %>
							<input class="btn btn-default btn-login"
									id="loginBtn" type="submit" value="확인">
							<%}else{ %>
							<p>회원님의 정보를 찾을 수 없습니다.</p>
							<input class="btn btn-default btn-login"
									id="loginBtn" type="submit" value="확인">
							<%} %>
							</form>
						</div>

					</div>
				</div>