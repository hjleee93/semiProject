package com.semi.admin.order.vo;

import java.sql.Date;

import com.semi.member.model.vo.TotalMember;
import com.semi.rsv.model.vo.Reservation;
import com.semi.store.model.vo.Store;
import com.semi.store.model.vo.StoreMenu;

public class Order {
//reservation table
	
	private int rsvCode;
	private String memberId;
	private String memberName;
	private String storeName;
	private String menuName;
	private String rsvDate;
	private int rsvTime;
	private String rsvRequiry;
	private int paymentCode;
	private int rsvPPL;
	private Date payDate;

	public TotalMember member;
	public Store store;
	public Reservation rsv;
	public StoreMenu storemenu;
	
	
	public Order() {
		// TODO Auto-generated constructor stub
	}


	public Order(int rsvCode, String memberId, String memberName, String storeName, String menuName, String rsvDate,
			int rsvTime, String rsvRequiry, int paymentCode, int rsvPPL, Date payDate, TotalMember member, Store store,
			Reservation rsv, StoreMenu storemenu) {
		super();
		this.rsvCode = rsvCode;
		this.memberId = memberId;
		this.memberName = memberName;
		this.storeName = storeName;
		this.menuName = menuName;
		this.rsvDate = rsvDate;
		this.rsvTime = rsvTime;
		this.rsvRequiry = rsvRequiry;
		this.paymentCode = paymentCode;
		this.rsvPPL = rsvPPL;
		this.payDate = payDate;
		this.member = member;
		this.store = store;
		this.rsv = rsv;
		this.storemenu = storemenu;
	}


	public int getRsvCode() {
		return rsvCode;
	}


	public void setRsvCode(int rsvCode) {
		this.rsvCode = rsvCode;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public String getMenuName() {
		return menuName;
	}


	public void setMenuName(String menuName) {
		this.menuName = menuName;
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


	public String getRsvRequiry() {
		return rsvRequiry;
	}


	public void setRsvRequiry(String rsvRequiry) {
		this.rsvRequiry = rsvRequiry;
	}


	public int getPaymentCode() {
		return paymentCode;
	}


	public void setPaymentCode(int paymentCode) {
		this.paymentCode = paymentCode;
	}


	public int getRsvPPL() {
		return rsvPPL;
	}


	public void setRsvPPL(int rsvPPL) {
		this.rsvPPL = rsvPPL;
	}


	public Date getPayDate() {
		return payDate;
	}


	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}


	public TotalMember getMember() {
		return member;
	}


	public void setMember(TotalMember member) {
		this.member = member;
	}


	public Store getStore() {
		return store;
	}


	public void setStore(Store store) {
		this.store = store;
	}


	public Reservation getRsv() {
		return rsv;
	}


	public void setRsv(Reservation rsv) {
		this.rsv = rsv;
	}


	public StoreMenu getStoremenu() {
		return storemenu;
	}


	public void setStoremenu(StoreMenu storemenu) {
		this.storemenu = storemenu;
	}


	@Override
	public String toString() {
		return "Order [rsvCode=" + rsvCode + ", memberId=" + memberId + ", memberName=" + memberName + ", storeName="
				+ storeName + ", menuName=" + menuName + ", rsvDate=" + rsvDate + ", rsvTime=" + rsvTime
				+ ", rsvRequiry=" + rsvRequiry + ", paymentCode=" + paymentCode + ", rsvPPL=" + rsvPPL + ", payDate="
				+ payDate + ", member=" + member + ", store=" + store + ", rsv=" + rsv + ", storemenu=" + storemenu
				+ "]";
	}
	
	


	
}
