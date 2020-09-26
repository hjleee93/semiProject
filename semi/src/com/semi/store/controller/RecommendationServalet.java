package com.semi.store.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.store.model.vo.Store;
import com.semi.store.service.StoreService;
import com.semi.storeservice.model.vo.StoreSvc;
import com.semi.storeservice.service.StoreServiceService;

/**
 * Servlet implementation class RecommendationServalet
 */
@WebServlet("/reco")
public class RecommendationServalet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecommendationServalet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException {
		String selectedDate = request.getParameter("datepicker");
		String selectedCategory = request.getParameterValues("category")[0];
		
		List<StoreSvc> listService = new StoreServiceService().selectAllService();
		List<Store> storeList = new StoreService().selectStoreList();
		
		List<Store> storeRcom = new ArrayList<Store>();
		
		
		
		List<Store> list = new StoreService().selectStoreList();
		
		


		
		String formatDay =selectedDate.replace("/", "");
		System.out.println("formatDay: "+formatDay);
		Date date = new Date();
		
		int storeId = -1; //0인 스토어가 있을 수도 있으므로 방지
		


			
			String newstring = null;
		String inputDate = formatDay;
		DateFormat df = new SimpleDateFormat("yyyyMMdd");
		DateFormat ddf = new SimpleDateFormat("EEE");
		
		try {
			newstring = ddf.format(df.parse(inputDate));
			
							
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		if(newstring.equals("월")) {
			newstring="Mon";
		}else if(newstring.equals("화")) {
			newstring="Tue";
		}else if(newstring.equals("수")) {
			newstring="Wed";
		}
		else if(newstring.equals("목")) {
			newstring="Thur";
		}
		else if(newstring.equals("금")) {
			newstring="Fri";
		}
		else if(newstring.equals("토")) {
			newstring="Sat";
		}
		else if(newstring.equals("일")) {
			newstring="Sun";
		}
		
				
				
				for(int i = 0; i<listService.size();i++) {//예약 서비스
					if(listService.get(i).getOpenTime() != 0) {//오픈타임이 0으로 설정되있지 않은 예약부터 sorting
						
						String storeDay = listService.get(i).getStoreDay();//오픈타임이 0이아닌  날짜의 요일을 출력
						int storeID = listService.get(i).getStoreId();//streId 출력
						System.out.println("요일 같음??: " + storeID);
						
						if(storeDay.equals(newstring) ) { //요일이 같은 경우 
							System.out.println("요일 같음??: " + storeDay);//요일이 같은 날짜의 해당 스토어 id 
							for(Store s : storeList) {//hyolo에 해당하는 모든 store 검색
								if((s.getStoreId() == storeID) && s.getStoreDtlCtgry().equals(selectedCategory)) { //해당스토어의 id값이 같고 사용자가 선택한 카테고리와 값이 같은 경우
									
									
									storeRcom.add(s); // storRcom에 해당 store 리스트 저장 
									
								}
							}
							storeId = listService.get(i).getStoreId();
						}
								
					}
				
//					
					
					
				}
//				
				
		
		request.setAttribute("stores", storeRcom);
	System.out.println("storeRcom");
		
		request.getRequestDispatcher("/views/recommand/dateReco.jsp") 
		.forward(request, response);
		

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
