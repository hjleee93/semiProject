package com.semi.storeservice.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.storeservice.model.vo.StoreService;
import com.semi.storeservice.service.StoreServiceService;

/**
 * Servlet implementation class StoreRsvSettingEndServlet
 */
@WebServlet("/storeService/storeRsvSettingEnd")
public class StoreRsvSettingEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StoreRsvSettingEndServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StoreService ss = new StoreService();

		
		int monOpenTime = 0;
		int monCloseTime = 0;
		int monStartTime = 0;
		int monEndTime = 0;
		if(request.getParameter("monOpenTime") !="") {
		monOpenTime = Integer.parseInt(request.getParameter("monOpenTime").replace(":", ""));
		}
		if(request.getParameter("monCloseTime") !="") {
		 monCloseTime = Integer.parseInt(request.getParameter("monCloseTime").replace(":", ""));
		}
		 if(request.getParameter("monBreakStart") !="") {
		 monStartTime = Integer.parseInt(request.getParameter("monBreakStart").replace(":", ""));
		 }
		 if(request.getParameter("monBreakEnd") !="") {
		 monEndTime = Integer.parseInt(request.getParameter("monBreakEnd").replace(":", ""));
		}
		ss.setStoreId(Integer.parseInt(request.getParameter("storeId")));
		ss.setPtnNum(Integer.parseInt(request.getParameter("ptnId")));
		ss.setStoreDay(request.getParameter("Mon"));
		ss.setOpenTime(monOpenTime);
		ss.setCloseTime(monCloseTime);
		ss.setBreakStart(monStartTime);
		ss.setBreakEnd(monEndTime);

		if (request.getParameter("monMaxPpl").equals("")) {
			ss.setMaxPpl(0);
		} else {
			ss.setMaxPpl(Integer.parseInt(request.getParameter("monMaxPpl")));
		}

		if (request.getParameter("monMinPpl").equals("")) {
			ss.setMinPpl(0);
		} else {
			ss.setMinPpl(Integer.parseInt(request.getParameter("monMinPpl")));
		}
		ss.setStoreOff(request.getParameter("storeOff"));
		System.out.println("mon: " + ss);
		int result1 = new StoreServiceService().insertStoreService(ss);

		
		int tueOpenTime = 0;
		int tueCloseTime = 0;
		int tueStartTime = 0;
		int tueEndTime = 0;
		if(request.getParameter("tueOpen") !="") {
			
		 tueOpenTime = Integer.parseInt(request.getParameter("tueOpen").replace(":", ""));
		}
		if(request.getParameter("tueClose") !="") {
		tueCloseTime = Integer.parseInt(request.getParameter("tueClose").replace(":", ""));
		}
		if(request.getParameter("tueBreakStart") !="") {
		tueStartTime = Integer.parseInt(request.getParameter("tueBreakStart").replace(":", ""));
		}
		if(request.getParameter("tueBreakEnd") !="") {
		tueEndTime = Integer.parseInt(request.getParameter("tueBreakEnd").replace(":", ""));
		}
		
		
		
		ss.setStoreId(Integer.parseInt(request.getParameter("storeId")));
		ss.setPtnNum(Integer.parseInt(request.getParameter("ptnId")));
		ss.setStoreDay(request.getParameter("Tue"));
		
		ss.setOpenTime(tueOpenTime);
		ss.setCloseTime(tueCloseTime);
		ss.setBreakStart(tueStartTime);
		ss.setBreakEnd(tueEndTime);

		if (request.getParameter("tueMaxPpl").equals("")) {
			ss.setMaxPpl(0);
		} else {
			ss.setMaxPpl(Integer.parseInt(request.getParameter("tueMaxPpl")));
		}

		if (request.getParameter("tueMinPpl").equals("")) {
			ss.setMinPpl(0);
		} else {
			ss.setMinPpl(Integer.parseInt(request.getParameter("tueMinPpl")));
		}
		ss.setStoreOff(request.getParameter("storeOff"));
		int result2 = new StoreServiceService().insertStoreService(ss);
		
		int wedOpenTime = 0;
		int wedCloseTime = 0;
		int wedStartTime = 0;
		int wedEndTime = 0;
		
		if(request.getParameter("wedOpen") !="") {
		wedOpenTime = Integer.parseInt(request.getParameter("wedOpen").replace(":", ""));
		}
		if(request.getParameter("wedClose") !="") {
		wedCloseTime = Integer.parseInt(request.getParameter("wedClose").replace(":", ""));
		}
		if(request.getParameter("wedBreakStart") !="") {
		wedStartTime = Integer.parseInt(request.getParameter("wedBreakStart").replace(":", ""));
		}
		if(request.getParameter("wedBreakEnd") !="") {
		wedEndTime = Integer.parseInt(request.getParameter("wedBreakEnd").replace(":", ""));
		}
		
		ss.setStoreId(Integer.parseInt(request.getParameter("storeId")));
		ss.setPtnNum(Integer.parseInt(request.getParameter("ptnId")));
		ss.setStoreDay(request.getParameter("Wed"));
		ss.setOpenTime(wedOpenTime);
		ss.setCloseTime(wedCloseTime);
		ss.setBreakStart(wedStartTime);
		ss.setBreakEnd(wedEndTime);

		if (request.getParameter("wedMaxPpl").equals("")) {
			ss.setMaxPpl(0);
		} else {
			ss.setMaxPpl(Integer.parseInt(request.getParameter("wedMaxPpl")));
		}

		if (request.getParameter("wedMinPpl").equals("")) {
			ss.setMinPpl(0);
		} else {
			ss.setMinPpl(Integer.parseInt(request.getParameter("wedMinPpl")));
		}
		ss.setStoreOff(request.getParameter("storeOff"));
		int result3 = new StoreServiceService().insertStoreService(ss);

		
		int thurOpenTime = 0;
		int thurCloseTime = 0;
		int thurStartTime = 0;
		int thurEndTime = 0;
		
		if(request.getParameter("thurOpen") !="") {
		thurOpenTime = Integer.parseInt(request.getParameter("thurOpen").replace(":", ""));
		}
		if(request.getParameter("thurClose") !="") {
		 thurCloseTime = Integer.parseInt(request.getParameter("thurClose").replace(":", ""));
		}
		 if(request.getParameter("thurBreakStart") !="") {
		 thurStartTime = Integer.parseInt(request.getParameter("thurBreakStart").replace(":", ""));
		 }
		 if(request.getParameter("thurBreakEnd") !="") {
		 thurEndTime = Integer.parseInt(request.getParameter("thurBreakEnd").replace(":", ""));
		 }
		
		
		ss.setStoreId(Integer.parseInt(request.getParameter("storeId")));
		ss.setPtnNum(Integer.parseInt(request.getParameter("ptnId")));
		ss.setStoreDay(request.getParameter("Thur"));
		ss.setOpenTime(thurOpenTime);
		ss.setCloseTime(thurCloseTime);
		ss.setBreakStart(thurStartTime);
		ss.setBreakEnd(thurEndTime);

		if (request.getParameter("thurMaxPpl").equals("")) {
			ss.setMaxPpl(0);
		} else {
			ss.setMaxPpl(Integer.parseInt(request.getParameter("thurMaxPpl")));
		}

		if (request.getParameter("thurMinPpl").equals("")) {
			ss.setMinPpl(0);
		} else {
			ss.setMinPpl(Integer.parseInt(request.getParameter("thurMinPpl")));
		}
		ss.setStoreOff(request.getParameter("storeOff"));
		int result4 = new StoreServiceService().insertStoreService(ss);
		
		
		int friOpenTime = 0;
		int friCloseTime = 0;
		int friStartTime = 0;
		int friEndTime = 0;
		System.out.println("111: "+request.getParameter("friBreakStart") );
		if(request.getParameter("friOpen") !="") {
		friOpenTime = Integer.parseInt(request.getParameter("friOpen").replace(":", ""));
		}
		if(request.getParameter("friClose") !="") {
		friCloseTime = Integer.parseInt(request.getParameter("friClose").replace(":", ""));
		}
		if(!(request.getParameter("friBreakStart").isEmpty()) || (request.getParameter("friBreakStart") !="")){
			
		friStartTime = Integer.parseInt(request.getParameter("friBreakStart").replace(":", ""));
		}
		if(!(request.getParameter("friBreakEnd").isEmpty()) || (request.getParameter("friBreakEnd") !="")) {
			System.out.println("222: " +request.getParameter("friBreakEnd") +"33");
		friEndTime = Integer.parseInt(request.getParameter("friBreakEnd").replace(":", ""));
		}

		ss.setStoreId(Integer.parseInt(request.getParameter("storeId")));
		ss.setPtnNum(Integer.parseInt(request.getParameter("ptnId")));
		ss.setStoreDay(request.getParameter("Fri"));
		ss.setOpenTime(friOpenTime);
		ss.setCloseTime(friCloseTime);
		ss.setBreakStart(friStartTime);
		ss.setBreakEnd(friEndTime);

		if (request.getParameter("friMaxPpl").equals("")) {
			ss.setMaxPpl(0);
		} else {
			ss.setMaxPpl(Integer.parseInt(request.getParameter("friMaxPpl")));
		}

		if (request.getParameter("friMinPpl").equals("")) {
			ss.setMinPpl(0);
		} else {
			ss.setMinPpl(Integer.parseInt(request.getParameter("friMinPpl")));
		}
		ss.setStoreOff(request.getParameter("storeOff"));
		int result5 = new StoreServiceService().insertStoreService(ss);
		

		int satOpenTime = 0;
		int satCloseTime = 0;
		int satStartTime = 0;
		int satEndTime = 0;
		
		if(request.getParameter("satOpen") !="") {
		
		satOpenTime = Integer.parseInt(request.getParameter("satOpen").replace(":", ""));
		}
		if(request.getParameter("satClose") !="") {
		satCloseTime = Integer.parseInt(request.getParameter("satClose").replace(":", ""));
		}
		if(request.getParameter("satBreakStart") !="") {
		satStartTime = Integer.parseInt(request.getParameter("satBreakStart").replace(":", ""));
		}
		if(request.getParameter("satBreakEnd") !="") {
		satEndTime = Integer.parseInt(request.getParameter("satBreakEnd").replace(":", ""));
		}
		ss.setStoreId(Integer.parseInt(request.getParameter("storeId")));
		ss.setPtnNum(Integer.parseInt(request.getParameter("ptnId")));
		ss.setStoreDay(request.getParameter("Sat"));
		ss.setOpenTime(satOpenTime);
		ss.setCloseTime(satCloseTime);
		ss.setBreakStart(satStartTime);
		ss.setBreakEnd(satEndTime);

		if (request.getParameter("satMaxPpl").equals("")) {
			ss.setMaxPpl(0);
		} else {
			ss.setMaxPpl(Integer.parseInt(request.getParameter("satMaxPpl")));
		}

		if (request.getParameter("satMinPpl").equals("")) {
			ss.setMinPpl(0);
		} else {
			ss.setMinPpl(Integer.parseInt(request.getParameter("satMinPpl")));
		}
		ss.setStoreOff(request.getParameter("storeOff"));
		int result6 = new StoreServiceService().insertStoreService(ss);
		
		int sunOpenTime = 0;
		int sunCloseTime = 0;
		int sunStartTime = 0;
		int sunEndTime = 0;
		
		if(request.getParameter("sunOpen") !="") {
		
		sunOpenTime = Integer.parseInt(request.getParameter("sunOpen").replace(":", ""));
		}
		if(request.getParameter("sunClose") !="") {
		 sunCloseTime = Integer.parseInt(request.getParameter("sunClose").replace(":", ""));
		}
		if(request.getParameter("sunBreakStart") !="") {
		 sunStartTime = Integer.parseInt(request.getParameter("sunBreakStart").replace(":", ""));
		}
		if(request.getParameter("sunBreakEnd") !="") {
		 sunEndTime = Integer.parseInt(request.getParameter("sunBreakEnd").replace(":", ""));
		}

		ss.setStoreId(Integer.parseInt(request.getParameter("storeId")));
		ss.setPtnNum(Integer.parseInt(request.getParameter("ptnId")));
		ss.setStoreDay(request.getParameter("Sun"));
		ss.setOpenTime(sunOpenTime);
		ss.setCloseTime(sunCloseTime);
		ss.setBreakStart(sunStartTime);
		ss.setBreakEnd(sunEndTime);

		if (request.getParameter("sunMaxPpl").equals("")) {
			ss.setMaxPpl(0);
		} else {
			ss.setMaxPpl(Integer.parseInt(request.getParameter("sunMaxPpl")));
		}

		if (request.getParameter("sunMinPpl").equals("")) {
			ss.setMinPpl(0);
		} else {
			ss.setMinPpl(Integer.parseInt(request.getParameter("sunMinPpl")));
		}
		ss.setStoreOff(request.getParameter("storeOff"));
		int result7 = new StoreServiceService().insertStoreService(ss);

		




		String msg = "";
		String loc = "/";
		if (result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0 && result6 > 0 && result7 > 0) {
			msg = "예약 서비스 등록이 완료되었습니다.";

			loc = "/ptnstorelist";// 마이페이지로 이동
		} else {
			msg = "입력하신 데이터에 오류가 발생했습니다. 입점 신청을 다시 시도해주세요";
			// 신청폼 다시
			loc = "/storeService/storeRsvSetting?storeId=" + request.getParameter("storeId");
		}

		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
