package com.semi.qna.model.vo;

import java.sql.Date;

public class Qna {

	private int qnaNo;
	private String qnaSep;
	private String qnaTitle;
	private String qnaWriter;
	private String qnaContent;
	private Date qnaDate;
	private String qnaOriginalFileName;
	private String qnaRenamedFileName;
	private int qnaCount;

	public Qna() {
		// TODO Auto-generated constructor stub
	}

	public Qna(int qnaNo, String qnaSep, String qnaTitle, String qnaWriter, String qnaContent, Date qnaDate,
			String qnaOriginalFileName, String qnaRenamedFileName, int qnaCount) {
		super();
		this.qnaNo = qnaNo;
		this.qnaSep = qnaSep;
		this.qnaTitle = qnaTitle;
		this.qnaWriter = qnaWriter;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaOriginalFileName = qnaOriginalFileName;
		this.qnaRenamedFileName = qnaRenamedFileName;
		this.qnaCount = qnaCount;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getQnaSep() {
		return qnaSep;
	}

	public void setQnaSep(String qnaSep) {
		this.qnaSep = qnaSep;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaWriter() {
		return qnaWriter;
	}

	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}

	public String getQnaOriginalFileName() {
		return qnaOriginalFileName;
	}

	public void setQnaOriginalFileName(String qnaOriginalFileName) {
		this.qnaOriginalFileName = qnaOriginalFileName;
	}

	public String getQnaRenamedFileName() {
		return qnaRenamedFileName;
	}

	public void setQnaRenamedFileName(String qnaRenamedFileName) {
		this.qnaRenamedFileName = qnaRenamedFileName;
	}

	public int getQnaCount() {
		return qnaCount;
	}

	public void setQnaCount(int qnaCount) {
		this.qnaCount = qnaCount;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaSep=" + qnaSep + ", qnaTitle=" + qnaTitle + ", qnaWriter=" + qnaWriter
				+ ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate + ", qnaOriginalFileName=" + qnaOriginalFileName
				+ ", qnaRenamedFileName=" + qnaRenamedFileName + ", qnaCount=" + qnaCount + "]";
	}
	
	
	
	
	
	
}