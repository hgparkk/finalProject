package com.codingbamboo.finalproject.notice.dto;

import java.util.Date;

public class NoticeDTO {
    private int noticeNo;
    private int attachNo;
    private String noticeTitle;
    private String noticeContent;
    private Date noticeDate;        
	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", attachNo=" + attachNo + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + "]";
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getAttachNo() {
		return attachNo;
	}
	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
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
	public NoticeDTO(int noticeNo, int attachNo, String noticeTitle, String noticeContent, Date noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.attachNo = attachNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
	}
	public NoticeDTO() {
		super();
	}


}