package com.semi.member.model.vo;

import java.sql.Date;

public class SearchMember {

	public String memberId;
	public String memberName;
	public String sep;
	public String gender;
	public String birthday;
	public String email;
	public String phone;
	public String address;
	public String category;
	public Date enrolldate;
	
	public SearchMember() {
		// TODO Auto-generated constructor stub
	}

	public SearchMember(String memberId, String memberName, String sep, String gender, String birthday, String email,
			String phone, String address, String category, Date enrolldate) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.sep = sep;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.category = category;
		this.enrolldate = enrolldate;
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

	public String getSep() {
		return sep;
	}

	public void setSep(String sep) {
		this.sep = sep;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	@Override
	public String toString() {
		return "SearchMember [memberId=" + memberId + ", memberName=" + memberName + ", sep=" + sep + ", gender="
				+ gender + ", birthday=" + birthday + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", category=" + category + ", enrolldate=" + enrolldate + "]";
	}
	

}
