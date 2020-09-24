package com.semi.qna.model.vo;

import java.sql.Date;

public class QnaComment {
	private int qnaCommentNo;
	private String qnaCommentWriter;
	private String qnaCommentContent;
	private int qnaRef;
	private Date qnaCommentDate;
	
	public QnaComment() {
		// TODO Auto-generated constructor stub
	}

	public QnaComment(int qnaCommentNo,String qnaCommentWriter,
			String qnaCommentContent, int qnaRef,Date qnaCommentDate) {
		super();
		this.qnaCommentNo = qnaCommentNo;
		this.qnaCommentWriter = qnaCommentWriter;
		this.qnaCommentContent = qnaCommentContent;
		this.qnaRef = qnaRef;
		this.qnaCommentDate = qnaCommentDate;
	}

	public int getQnaCommentNo() {
		return qnaCommentNo;
	}

	public void setQnaCommentNo(int qnaCommentNo) {
		this.qnaCommentNo = qnaCommentNo;
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


	public Date getQnaCommentDate() {
		return qnaCommentDate;
	}

	public void setQnaCommentDate(Date qnaCommentDate) {
		this.qnaCommentDate = qnaCommentDate;
	}

	@Override
	public String toString() {
		return "QnaComment [qnaCommentNo=" + qnaCommentNo + ", qnaCommentWriter=" + qnaCommentWriter + ", qnaCommentContent=" + qnaCommentContent + ", qnaRef="
				+ qnaRef +  ", qnaCommentDate=" + qnaCommentDate + "]";
	}

	
	
}



