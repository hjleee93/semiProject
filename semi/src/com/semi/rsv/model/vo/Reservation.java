package com.semi.rsv.model.vo;

import java.sql.Date;

public class Reservation {
	private int rsvCode;
	private int customerNum;
	private int storeId;
	private String rsvDate;
	private int rsvTime;
	private String rsvRequire;
	private int paymentCode;
	private int rsvPpl;
	
	public Reservation() {}


	@Override
	public String toString() {
		return "Reservation [rsvCode=" + rsvCode + ", customerNum=" + customerNum + ", storeId=" + storeId
				+ ", rsvDate=" + rsvDate + ", rsvTime=" + rsvTime + ", rsvRequire=" + rsvRequire + ", paymentCode="
				+ paymentCode + ", rsvPpl=" + rsvPpl + "]";
	}


	public int getRsvPpl() {
		return rsvPpl;
	}


	public void setRsvPpl(int rsvPpl) {
		this.rsvPpl = rsvPpl;
	}


	public Reservation(int rsvCode, int customerNum, int storeId, String rsvDate, int rsvTime, String rsvRequire,
			int paymentCode, int rsvPpl) {
		super();
		this.rsvCode = rsvCode;
		this.customerNum = customerNum;
		this.storeId = storeId;
		this.rsvDate = rsvDate;
		this.rsvTime = rsvTime;
		this.rsvRequire = rsvRequire;
		this.paymentCode = paymentCode;
		this.rsvPpl = rsvPpl;
	}


	public int getRsvCode() {
		return rsvCode;
	}

	public void setRsvCode(int rsvCode) {
		this.rsvCode = rsvCode;
	}

	public int getCustomerNum() {
		return customerNum;
	}

	public void setCustomerNum(int memberNum) {
		this.customerNum = memberNum;
	}

	public int getStoreId() {
		return storeId;
	}

	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}

	public String getRsvDate() {
		return rsvDate;
	}

	public void setRsvDate(String rsvDate) {
		this.rsvDate = rsvDate;
	}

	public int getRsvTime() {
		return rsvTime;
	}

	public void setRsvTime(int rsvTime) {
		this.rsvTime = rsvTime;
	}

	public String getRsvRequire() {
		return rsvRequire;
	}

	public void setRsvRequire(String rsvRequire) {
		this.rsvRequire = rsvRequire;
	}

	public int getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}
	
	
	
	
}
