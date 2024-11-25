package com.codingbamboo.finalproject.notice.dto;

import java.util.Date;

public class NoticeDTO {
    private int noticeNo;                  // 공지 번호
    private String noticeTitle;            // 공지 제목
    private String noticeContent;          // 공지 내용
    private Date noticeDate;               // 공지 등록일
 

    // Getter/Setter
    public int getNoticeNo() {
        return noticeNo;
    }

    public void setNoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
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

    @Override
    public String toString() {
        return "NoticeDTO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle
                + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate
                + ", formattedDate=" + "]";
    }

    // 기본 생성자
    public NoticeDTO() {
        super();
    }

    // 매개변수 생성자
    public NoticeDTO(int noticeNo, String noticeTitle, String noticeContent, Date noticeDate) {
        super();
        this.noticeNo = noticeNo;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeDate = noticeDate;
    }
}
