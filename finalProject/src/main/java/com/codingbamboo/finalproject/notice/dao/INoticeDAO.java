package com.codingbamboo.finalproject.notice.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {

    // 공지사항 등록
    int registNotice(NoticeDTO notice);

    // 공지사항 목록 조회
    List<NoticeDTO> getNoticeList();

    // 공지사항 상세 조회
    NoticeDTO getNoticeDetail(int noticeNo); // 상세 조회 메서드 추가
}
