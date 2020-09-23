package com.semi.member.model.vo;

import java.sql.Date;

public class TotalMember {

	private int memberNum;
	private String memberId;
	private String memberName;
	private String memberSep;
	private String memberPw;
	private String memberEmail;
	private String memberPhone;
	private String memPostcode;
	private String memAddress;
	private String memDetailAddress;
	private String memExtraAddress;
	private Date memberEnrolldate;
	private int customerNum;
	private String gender;
	private String birthday;
	private String category;
	
	public TotalMember() {
		// TODO Auto-generated constructor stub
	}

	public TotalMember(int memberNum, String memberId, String memberName, String memberSep, String memberPw,
			String memberEmail, String memberPhone, String memPostcode, String memAddress, String memDetailAddress,
			String memExtraAddress, Date memberEnrolldate, int customerNum, String gender, String birthday,
			String category) {
		super();
		this.memberNum = memberNum;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberSep = memberSep;
		this.memberPw = memberPw;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memPostcode = memPostcode;
		this.memAddress = memAddress;
		this.memDetailAddress = memDetailAddress;
		this.memExtraAddress = memExtraAddress;
		this.memberEnrolldate = memberEnrolldate;
		this.customerNum = customerNum;
		this.gender = gender;
		this.birthday = birthday;
		this.category = category;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
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

	public String getMemberSep() {
		return memberSep;
	}

	public void setMemberSep(String memberSep) {
		this.memberSep = memberSep;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemPostcode() {
		return memPostcode;
	}

	public void setMemPostcode(String memPostcode) {
		this.memPostcode = memPostcode;
	}

	public String getMemAddress() {
		return memAddress;
	}

	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}

	public String getMemDetailAddress() {
		return memDetailAddress;
	}

	public void setMemDetailAddress(String memDetailAddress) {
		this.memDetailAddress = memDetailAddress;
	}

	public String getMemExtraAddress() {
		return memExtraAddress;
	}

	public void setMemExtraAddress(String memExtraAddress) {
		this.memExtraAddress = memExtraAddress;
	}

	public Date getMemberEnrolldate() {
		return memberEnrolldate;
	}

	public void setMemberEnrolldate(Date memberEnrolldate) {
		this.memberEnrolldate = memberEnrolldate;
	}

	public int getCustomerNum() {
		return customerNum;
	}

	public void setCustomerNum(int customerNum) {
		this.customerNum = customerNum;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "TotalMember [memberNum=" + memberNum + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberSep=" + memberSep + ", memberPw=" + memberPw + ", memberEmail=" + memberEmail
				+ ", memberPhone=" + memberPhone + ", memPostcode=" + memPostcode + ", memAddress=" + memAddress
				+ ", memDetailAddress=" + memDetailAddress + ", memExtraAddress=" + memExtraAddress
				+ ", memberEnrolldate=" + memberEnrolldate + ", customerNum=" + customerNum + ", gender=" + gender
				+ ", birthday=" + birthday + ", category=" + category + "]";
	}
	
}
