package com.codingbamboo.finalproject.notice.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.notice.dao.INoticeDAO;
import com.codingbamboo.finalproject.notice.dto.NoticeDTO;

@Service
public class NoticeService {

    @Autowired
    private INoticeDAO dao;

    // �������� ����Ʈ ��������
    public List<NoticeDTO> getNoticeList() {
        List<NoticeDTO> noticeList = dao.getNoticeList();
        return noticeList != null ? noticeList : Collections.emptyList();
    }

    // �������� ���
    public int registNotice(NoticeDTO notice) {
        return dao.registNotice(notice);
    }
    
    //�������� ������ ��������
    public NoticeDTO getNoticeDetail(int noticeNo) {
        return dao.getNoticeDetail(noticeNo);
    }
}
