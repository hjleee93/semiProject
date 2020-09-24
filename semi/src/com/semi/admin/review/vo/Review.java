package com.semi.admin.review.vo;

import java.sql.Date;

public class Review {

	private int reviewNum;
	private String reviewTitle;
	private String reviewCategory;
	private String reviewWriter;
	private String reviewContent;
	private String reviewMark;
	private Date enrolldate;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewNum, String reviewTitle, String reviewCategory, String reviewWriter, String reviewContent,
			String reviewMark, Date enrolldate) {
		super();
		this.reviewNum = reviewNum;
		this.reviewTitle = reviewTitle;
		this.reviewCategory = reviewCategory;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewMark = reviewMark;
		this.enrolldate = enrolldate;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewCategory() {
		return reviewCategory;
	}

	public void setReviewCategory(String reviewCategory) {
		this.reviewCategory = reviewCategory;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewMark() {
		return reviewMark;
	}

	public void setReviewMark(String reviewMark) {
		this.reviewMark = reviewMark;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	@Override
	public String toString() {
		return "Review [reviewNum=" + reviewNum + ", reviewTitle=" + reviewTitle + ", reviewCategory=" + reviewCategory
				+ ", reviewWriter=" + reviewWriter + ", reviewContent=" + reviewContent + ", reviewMark=" + reviewMark
				+ ", enrolldate=" + enrolldate + "]";
	}
	

	
	
}
