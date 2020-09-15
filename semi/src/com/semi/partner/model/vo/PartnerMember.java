package com.semi.partner.model.vo;

import java.sql.Date;

public class PartnerMember {

	private int partnerNum;
	private String partnerId;
	private String partnerName;
	private String partnerPw;
	private String partnerEmail;
	private String partnerPhone;
	private String postcode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private Date partnerEnrolldate;
	public PartnerMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PartnerMember(int partnerNum, String partnerId, String partnerName, String partnerPw, String partnerEmail,
			String partnerPhone, String postcode, String address, String detailAddress, String extraAddress,
			Date partnerEnrolldate) {
		super();
		this.partnerNum = partnerNum;
		this.partnerId = partnerId;
		this.partnerName = partnerName;
		this.partnerPw = partnerPw;
		this.partnerEmail = partnerEmail;
		this.partnerPhone = partnerPhone;
		this.postcode = postcode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.extraAddress = extraAddress;
		this.partnerEnrolldate = partnerEnrolldate;
	}
	@Override
	public String toString() {
		return "PartnerMember [partnerNum=" + partnerNum + ", partnerId=" + partnerId + ", partnerName=" + partnerName
				+ ", partnerPw=" + partnerPw + ", partnerEmail=" + partnerEmail + ", partnerPhone=" + partnerPhone
				+ ", postcode=" + postcode + ", address=" + address + ", detailAddress=" + detailAddress
				+ ", extraAddress=" + extraAddress + ", partnerEnrolldate=" + partnerEnrolldate + "]";
	}
	public int getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(int partnerNum) {
		this.partnerNum = partnerNum;
	}
	public String getPartnerId() {
		return partnerId;
	}
	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public String getPartnerPw() {
		return partnerPw;
	}
	public void setPartnerPw(String partnerPw) {
		this.partnerPw = partnerPw;
	}
	public String getPartnerEmail() {
		return partnerEmail;
	}
	public void setPartnerEmail(String partnerEmail) {
		this.partnerEmail = partnerEmail;
	}
	public String getPartnerPhone() {
		return partnerPhone;
	}
	public void setPartnerPhone(String partnerPhone) {
		this.partnerPhone = partnerPhone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public Date getPartnerEnrolldate() {
		return partnerEnrolldate;
	}
	public void setPartnerEnrolldate(Date partnerEnrolldate) {
		this.partnerEnrolldate = partnerEnrolldate;
	}
	
	
	

}