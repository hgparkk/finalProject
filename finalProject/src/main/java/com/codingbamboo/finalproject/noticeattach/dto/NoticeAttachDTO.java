package com.codingbamboo.finalproject.noticeattach.dto;

public class NoticeAttachDTO {
	private int noticeNo;
	private int attachNo;
	@Override
	public String toString() {
		return "NoticeAttachDTO [noticeNo=" + noticeNo + ", attachNo=" + attachNo + "]";
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
	public NoticeAttachDTO(int noticeNo, int attachNo) {
		super();
		this.noticeNo = noticeNo;
		this.attachNo = attachNo;
	}
	public NoticeAttachDTO() {
		super();
	}
	
}
