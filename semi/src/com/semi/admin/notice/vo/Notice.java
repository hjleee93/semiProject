package com.semi.admin.notice.vo;

import java.sql.Date;

public class Notice {

	private int noticeNo;
	private String noticeSep;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private Date noticeDate;
	private String file;
	private int noticeCount;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(int noticeNo, String noticeSep, String noticeTitle, String noticeWriter, String noticeContent,
			Date noticeDate, String file, int noticeCount) {
		super();
		this.noticeNo = noticeNo;
		this.noticeSep = noticeSep;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.file = file;
		this.noticeCount = noticeCount;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeSep() {
		return noticeSep;
	}

	public void setNoticeSep(String noticeSep) {
		this.noticeSep = noticeSep;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeSep=" + noticeSep + ", noticeTitle=" + noticeTitle
				+ ", noticeWriter=" + noticeWriter + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate
				+ ", file=" + file + ", noticeCount=" + noticeCount + "]";
	}
	
}
