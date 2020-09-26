package com.semi.storeservice.model.vo;

import static com.semi.common.JDBCTemplate.close;
import static com.semi.common.JDBCTemplate.commit;
import static com.semi.common.JDBCTemplate.getConnection;
import static com.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.semi.store.model.vo.Store;

public class StoreSvc {
	
	private int storeId;
	private int ptnNum;
	private String storeDay;
	private int openTime;
	private int breakStart;
	private int breakEnd;
	private int closeTime;
	private String storeOff;
	private int minPpl;
	private int maxPpl;
	
	public StoreSvc() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StoreSvc(int storeId, int ptnNum, String storeDay, int openTime, int breakStart, int breakEnd,
			int closeTime, String storeOff, int minPpl, int maxPpl) {
		super();
		this.storeId = storeId;
		this.ptnNum = ptnNum;
		this.storeDay = storeDay;
		this.openTime = openTime;
		this.breakStart = breakStart;
		this.breakEnd = breakEnd;
		this.closeTime = closeTime;
		this.storeOff = storeOff;
		this.minPpl = minPpl;
		this.maxPpl = maxPpl;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public int getPtnNum() {
		return ptnNum;
	}

	public void setPtnNum(int ptnNum) {
		this.ptnNum = ptnNum;
	}

	public String getStoreDay() {
		return storeDay;
	}

	public void setStoreDay(String storeDay) {
		this.storeDay = storeDay;
	}

	public int getOpenTime() {
		return openTime;
	}

	public void setOpenTime(int openTime) {
		this.openTime = openTime;
	}

	public int getBreakStart() {
		return breakStart;
	}

	public void setBreakStart(int breakStart) {
		this.breakStart = breakStart;
	}

	public int getBreakEnd() {
		return breakEnd;
	}

	public void setBreakEnd(int breakEnd) {
		this.breakEnd = breakEnd;
	}

	public int getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(int closeTime) {
		this.closeTime = closeTime;
	}

	public String getStoreOff() {
		return storeOff;
	}

	public void setStoreOff(String storeOff) {
		this.storeOff = storeOff;
	}

	public int getMinPpl() {
		return minPpl;
	}

	public void setMinPpl(int minPpl) {
		this.minPpl = minPpl;
	}

	public int getMaxPpl() {
		return maxPpl;
	}

	public void setMaxPpl(int maxPpl) {
		this.maxPpl = maxPpl;
	}

	@Override
	public String toString() {
		return "StoreService [storeId=" + storeId + ", ptnNum=" + ptnNum + ", storeDay=" + storeDay + ", openTime="
				+ openTime + ", breakStart=" + breakStart + ", breakEnd=" + breakEnd + ", closeTime=" + closeTime
				+ ", storeOff=" + storeOff + ", minPpl=" + minPpl + ", maxPpl=" + maxPpl + "]";
	}


	
	
	
	

}
