package com.semi.qna.model.vo;

import java.sql.Date;

public class QnaComment {
	private int qnaCommentNo;
	private int qnacommentLevel;
	private String qnaCommentWriter;
	private String qnaCommentContent;
	private int qnaRef;
	private int commentRef;
	private Date qnaCommentDate;
	
	public QnaComment() {
		// TODO Auto-generated constructor stub
	}

	public QnaComment(int qnaCommentNo, int qnacommentLevel, String qnaCommentWriter,
			String qnaCommentContent, int qnaRef, int commentRef, Date qnaCommentDate) {
		super();
		this.qnaCommentNo = qnaCommentNo;
		this.qnacommentLevel = qnacommentLevel;
		this.qnaCommentWriter = qnaCommentWriter;
		this.qnaCommentContent = qnaCommentContent;
		this.qnaRef = qnaRef;
		this.commentRef = commentRef;
		this.qnaCommentDate = qnaCommentDate;
	}

	public int getQnaCommentNo() {
		return qnaCommentNo;
	}

	public void setQnaCommentNo(int qnaCommentNo) {
		this.qnaCommentNo = qnaCommentNo;
	}

	public int getQnacommentLevel() {
		return qnacommentLevel;
	}

	public void setQnacommentLevel(int qnacommentLevel) {
		this.qnacommentLevel = qnacommentLevel;
	}

	public String getQnaCommentWriter() {
		return qnaCommentWriter;
	}

	public void setQnaCommentWriter(String qnaCommentWriter) {
		this.qnaCommentWriter = qnaCommentWriter;
	}

	public String getQnaCommentContent() {
		return qnaCommentContent;
	}

	public void setQnaCommentContent(String qnaCommentContent) {
		this.qnaCommentContent = qnaCommentContent;
	}

	public int getQnaRef() {
		return qnaRef;
	}

	public void setQnaRef(int qnaRef) {
		this.qnaRef = qnaRef;
	}

	public int getCommentRef() {
		return commentRef;
	}

	public void setCommentRef(int commentRef) {
		this.commentRef = commentRef;
	}

	public Date getQnaCommentDate() {
		return qnaCommentDate;
	}

	public void setQnaCommentDate(Date qnaCommentDate) {
		this.qnaCommentDate = qnaCommentDate;
	}

	@Override
	public String toString() {
		return "QnaComment [qnaCommentNo=" + qnaCommentNo + ", qnacommentLevel=" + qnacommentLevel
				+ ", qnaCommentWriter=" + qnaCommentWriter + ", qnaCommentContent=" + qnaCommentContent + ", qnaRef="
				+ qnaRef + ", commentRef=" + commentRef + ", qnaCommentDate=" + qnaCommentDate + "]";
	}

	
	
}



