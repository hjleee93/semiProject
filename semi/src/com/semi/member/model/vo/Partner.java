package com.semi.member.model.vo;

public class Partner {

	private int Partner_no;
	
	public Partner() {
		// TODO Auto-generated constructor stub
	}

	public Partner(int partner_no) {
		super();
		Partner_no = partner_no;
	}

	public int getPartner_no() {
		return Partner_no;
	}

	public void setPartner_no(int partner_no) {
		Partner_no = partner_no;
	}

	@Override
	public String toString() {
		return "Partner [Partner_no=" + Partner_no + "]";
	}

	
	
	
	
}
