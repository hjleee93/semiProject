package com.semi.member.model.vo;

import java.sql.Date;

public class Member {

	private int member_num;
	private String member_id;
	private String member_name;
	private String member_pw;
	private String gender;
	private String member_age;
	private String member_email;
	private String member_phone;
	private String mem_postcode;
	private String mem_address;
	private String mem_detailAddress;
	private String mem_extraAddress;
	private Date member_enrolldate;
	private String category;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int member_num, String member_id, String member_name, String member_pw, String gender,
			String member_age, String member_email, String member_phone, String mem_postcode, String mem_address,
			String mem_detailAddress, String mem_extraAddress, Date member_enrolldate, String category) {
		super();
		this.member_num = member_num;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_pw = member_pw;
		this.gender = gender;
		this.member_age = member_age;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.mem_postcode = mem_postcode;
		this.mem_address = mem_address;
		this.mem_detailAddress = mem_detailAddress;
		this.mem_extraAddress = mem_extraAddress;
		this.member_enrolldate = member_enrolldate;
		this.category = category;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMember_age() {
		return member_age;
	}

	public void setMember_age(String member_age) {
		this.member_age = member_age;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMem_postcode() {
		return mem_postcode;
	}

	public void setMem_postcode(String mem_postcode) {
		this.mem_postcode = mem_postcode;
	}

	public String getMem_address() {
		return mem_address;
	}

	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}

	public String getMem_detailAddress() {
		return mem_detailAddress;
	}

	public void setMem_detailAddress(String mem_detailAddress) {
		this.mem_detailAddress = mem_detailAddress;
	}

	public String getMem_extraAddress() {
		return mem_extraAddress;
	}

	public void setMem_extraAddress(String mem_extraAddress) {
		this.mem_extraAddress = mem_extraAddress;
	}

	public Date getMember_enrolldate() {
		return member_enrolldate;
	}

	public void setMember_enrolldate(Date member_enrolldate) {
		this.member_enrolldate = member_enrolldate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Member [member_num=" + member_num + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", member_pw=" + member_pw + ", gender=" + gender + ", member_age=" + member_age + ", member_email="
				+ member_email + ", member_phone=" + member_phone + ", mem_postcode=" + mem_postcode + ", mem_address="
				+ mem_address + ", mem_detailAddress=" + mem_detailAddress + ", mem_extraAddress=" + mem_extraAddress
				+ ", member_enrolldate=" + member_enrolldate + ", category=" + category + "]";
	}
	
}