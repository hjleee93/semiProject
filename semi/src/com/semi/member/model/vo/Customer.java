package com.semi.member.model.vo;

import java.util.Arrays;

public class Customer {

	private int customerNum;
	private String gender;
	private String birthday;
	private String category;
	
	public Member member;
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Customer() {
		// TODO Auto-generated constructor stub
	}

	public Customer(int customerNum, String gender, String birthday, String category) {
		super();
		this.customerNum = customerNum;
		this.gender = gender;
		this.birthday = birthday;
		this.category = category;
		
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
		return "Customer [customerNum=" + customerNum + ", gender=" + gender + ", birthday=" + birthday + ", category="
				+ category + "]";
	}

	
	
	
}
