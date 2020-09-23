package com.semi.review.model.vo;

import java.sql.Date;

public class Review {
	
	private int reviewNum;
	private int memberNum;
	private String storeId;
	private int reviewScore;
	private String reviewTitle;
	private String reviewContent;
	private String reviewPicsa;
	private String reviewPicsb;
	private String reviewPicsc;
	private Date reviewDate;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNum, int memberNum, String storeId, int reviewScore, String reviewTitle,
			String reviewContent, String reviewPicsa, String reviewPicsb, String reviewPicsc, Date reviewDate) {
		super();
		this.reviewNum = reviewNum;
		this.memberNum = memberNum;
		this.storeId = storeId;
		this.reviewScore = reviewScore;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewPicsa = reviewPicsa;
		this.reviewPicsb = reviewPicsb;
		this.reviewPicsc = reviewPicsc;
		this.reviewDate = reviewDate;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewPicsa() {
		return reviewPicsa;
	}

	public void setReviewPicsa(String reviewPicsa) {
		this.reviewPicsa = reviewPicsa;
	}

	public String getReviewPicsb() {
		return reviewPicsb;
	}

	public void setReviewPicsb(String reviewPicsb) {
		this.reviewPicsb = reviewPicsb;
	}

	public String getReviewPicsc() {
		return reviewPicsc;
	}

	public void setReviewPicsc(String reviewPicsc) {
		this.reviewPicsc = reviewPicsc;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Override
	public String toString() {
		return "Review [reviewNum=" + reviewNum + ", memberNum=" + memberNum + ", storeId=" + storeId + ", reviewScore="
				+ reviewScore + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent + ", reviewPicsa="
				+ reviewPicsa + ", reviewPicsb=" + reviewPicsb + ", reviewPicsc=" + reviewPicsc + ", reviewDate="
				+ reviewDate + "]";
	}
	
	
}
