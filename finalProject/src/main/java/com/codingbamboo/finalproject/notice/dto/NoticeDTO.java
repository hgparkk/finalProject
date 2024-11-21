package com.codingbamboo.finalproject.notice.dto;

import java.util.Date;
import java.util.List;

import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

import java.text.SimpleDateFormat;

public class NoticeDTO {
    private int noticeNo;                  // 공지 번호
    private String noticeTitle;            // 공지 제목
    private String noticeContent;          // 공지 내용
    private Date noticeDate;               // 공지 등록일
    private String formattedDate;          // 포맷된 날짜
    private List<NoticeAttachDTO> attachList; // 첨부파일 목록

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

        // noticeDate가 설정될 때 formattedDate 자동 생성
        if (noticeDate != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            this.formattedDate = sdf.format(noticeDate);
        }
    }

    public String getFormattedDate() {
        return formattedDate;
    }

    public void setFormattedDate(String formattedDate) {
        this.formattedDate = formattedDate;
    }

    public List<NoticeAttachDTO> getAttachList() {
        return attachList;
    }

    public void setAttachList(List<NoticeAttachDTO> attachList) {
        this.attachList = attachList;
    }

    @Override
    public String toString() {
        return "NoticeDTO [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle
                + ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate
                + ", formattedDate=" + formattedDate + ", attachList=" + attachList + "]";
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
        this.setNoticeDate(noticeDate); // noticeDate 설정 시 formattedDate 자동 생성
    }
}
