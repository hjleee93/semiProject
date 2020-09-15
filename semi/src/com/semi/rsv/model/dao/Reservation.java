package com.semi.rsv.model.dao;
//자바에서 가져온 데이터 저장할 공간

import java.sql.Date;

public class Reservation {
	private String rsvCode;
	private String memberNum;
	private String storeId;
	private Date rsvDate;
	private Date rsvTime;
	private int rsvRequire;
	private String paymentCode;
	
	
	public Reservation() {}
	
	@Override
	public String toString() {
		return "Reservation [rsvCode=" + rsvCode + ", memberNum=" + memberNum + ", storeId=" + storeId + ", rsvDate="
				+ rsvDate + ", rsvTime=" + rsvTime + ", rsvRequire=" + rsvRequire + ", paymentCode=" + paymentCode
				+ "]";
	}

	public Reservation(String rsvCode, String memberNum, String storeId, Date rsvDate, Date rsvTime, int rsvRequire,
			String paymentCode) {
		super();
		this.rsvCode = rsvCode;
		this.memberNum = memberNum;
		this.storeId = storeId;
		this.rsvDate = rsvDate;
		this.rsvTime = rsvTime;
		this.rsvRequire = rsvRequire;
		this.paymentCode = paymentCode;
	}

	public String getRsvCode() {
		return rsvCode;
	}
	public void setRsvCode(String rsvCode) {
		this.rsvCode = rsvCode;
	}
	public String getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(String memberNum) {
		this.memberNum = memberNum;
	}
	public String getStoreId() {
		return storeId;
	}
	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}
	public Date getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(Date rsvDate) {
		this.rsvDate = rsvDate;
	}
	public Date getRsvTime() {
		return rsvTime;
	}
	public void setRsvTime(Date rsvTime) {
		this.rsvTime = rsvTime;
	}
	public int getRsvRequire() {
		return rsvRequire;
	}
	public void setRsvRequire(int rsvRequire) {
		this.rsvRequire = rsvRequire;
	}
	public String getPaymentCode() {
		return paymentCode;
	}
	public void setPaymentCode(String paymentCode) {
		this.paymentCode = paymentCode;
	}
}
