package com.semi.rsv.model.vo;

public class ReservationPtnView {
	
	public String storeName;
	public String memberName;
	public String rsvDate;
	public int rsvTime;
	public int memberPhone;
	public int rsvPpl;
	public String rsvRequiry;
	
	public ReservationPtnView() {	}

	public ReservationPtnView(String storeName, String memberName, String rsvDate, int rsvTime, int memberPhone,
			int rsvPpl, String rsvRequiry) {
		super();
		this.storeName = storeName;
		this.memberName = memberName;
		this.rsvDate = rsvDate;
		this.rsvTime = rsvTime;
		this.memberPhone = memberPhone;
		this.rsvPpl = rsvPpl;
		this.rsvRequiry = rsvRequiry;
	}

	@Override
	public String toString() {
		return "ReservationPtnView [storeName=" + storeName + ", memberName=" + memberName + ", rsvDate=" + rsvDate
				+ ", rsvTime=" + rsvTime + ", memberPhone=" + memberPhone + ", rsvPpl=" + rsvPpl + ", rsvRequiry="
				+ rsvRequiry + "]";
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public int getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(int memberPhone) {
		this.memberPhone = memberPhone;
	}

	public int getRsvPpl() {
		return rsvPpl;
	}

	public void setRsvPpl(int rsvPpl) {
		this.rsvPpl = rsvPpl;
	}

	public String getRsvRequiry() {
		return rsvRequiry;
	}

	public void setRsvRequiry(String rsvRequiry) {
		this.rsvRequiry = rsvRequiry;
	}
	
	
	
	
	

}
