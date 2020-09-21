<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String region  =  request.getParameter("region");

out.println("<select name='sel2'>");
	if(region.equals("seoul")){
 		out.println("<option value=''>선택하세요</option> "); 
 		out.println("<option value='seocho'>서초</option> "); 
 		out.println("<option value='gangnam'>강남</option> ");
 		out.println("<option value='mapo'>마포</option> ");
 		out.println("<option value='dongdaemun'>동대문</option> ");
 		}
	else if(region.equals("kyung")){
 		out.println("<option value=''>선택하세요</option> "); 
 		out.println("<option value='guri'>구리</option> "); 
	 	out.println("<option value='hanam'>하남</option> ");
	 	out.println("<option value='goyang'>고양</option> ");
	 	out.println("<option value='suwon'>수원</option> ");
		}
	else if(region.equals("incheon")){
		out.println("<option value=''>선택하세요</option> ");
		out.println("<option value='yeonsu'>연수</option> ");
		out.println("<option value='bupyeong'>부평</option> ");
		out.println("<option value='gyeyang'>계양</option> ");
		}
	else if(region.equals("gangwon")){
		out.println("<option value=''>선택하세요</option> ");
		out.println("<option value='gangleung'>강릉</option> ");
		out.println("<option value='sokcho'>속초</option> ");
		out.println("<option value='suncheon'>순천</option> ");
		}
	else if(region.equals("chungcheong")){
		out.println("<option value=''>선택하세요</option> ");
		out.println("<option value='daejeon'>대전</option> ");
		out.println("<option value='cheonan'>천안</option> ");
		out.println("<option value='chungju'>충주</option> ");
		}
	else if(region.equals("gyeongsang")){
		out.println("<option value=''>선택하세요</option> ");
		out.println("<option value='gyeongju'>경주</option> ");
		out.println("<option value='andong'>안동</option> ");
		out.println("<option value='daegu'>대구</option> ");
		out.println("<option value='busan'>부산</option> ");
		}
	else if(region.equals("jeolla")){
		out.println("<option value=''>선택하세요</option> ");
		out.println("<option value='jeonju'>전주</option> ");
		out.println("<option value='gwangju'>광주</option> ");
		out.println("<option value='yeosu'>여수</option> ");
		}
	else if(region.equals("jeju")){
		out.println("<option value=''>선택하세요</option> ");
		out.println("<option value='jejusi'>제주시</option> ");
		out.println("<option value='seogwipo'>서귀포</option> ");
	}
out.println("</select>");

%>
