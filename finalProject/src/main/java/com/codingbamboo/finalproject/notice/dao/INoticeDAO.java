package com.codingbamboo.finalproject.notice.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;

@Mapper
public interface INoticeDAO {

    // �������� ���
    int registNotice(NoticeDTO notice);

    // �������� ��� ��ȸ
    List<NoticeDTO> getNoticeList();

    // �������� �� ��ȸ
    NoticeDTO getNoticeDetail(int noticeNo); // �� ��ȸ �޼��� �߰�
}
