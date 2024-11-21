package com.codingbamboo.finalproject.noticeattach.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;
import com.codingbamboo.finalproject.noticeattach.service.NoticeAttachService;

@Controller
public class NoticeAttachController {

    @Autowired
    private NoticeAttachService noticeAttachService;

    /**
     * 공지사항 번호로 첨부파일 목록 조회
     */
    @GetMapping("/notice/attachments")
    @ResponseBody
    public List<NoticeAttachDTO> getAttachmentsByNoticeNo(@RequestParam("noticeNo") int noticeNo) {
        return noticeAttachService.getAttachListByNoticeNo(noticeNo);
    }

    /**
     * 첨부파일 다운로드
     */
    @GetMapping("/notice/attachment/download")
    public void downloadAttachment(@RequestParam("attachNo") int attachNo, HttpServletResponse response) {
        try {
            // 첨부파일 정보 조회
            List<NoticeAttachDTO> attachList = noticeAttachService.getAttachListByNoticeNo(attachNo);
            if (attachList.isEmpty()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
                return;
            }

            NoticeAttachDTO attach = attachList.get(0); // 첫 번째 첨부파일 사용 (단일 첨부파일 기준)
            String filePath = attach.getAttachPath();
            String originalFileName = attach.getAttachOriginalName();

            // 파일 다운로드 설정
            File file = new File(filePath);
            if (!file.exists()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "파일을 찾을 수 없습니다.");
                return;
            }

            response.setContentType("application/octet-stream");
            response.setContentLength((int) file.length());
            response.setHeader("Content-Disposition", "attachment; filename=\"" 
                + new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

            // 파일 스트림 전송
            try (FileInputStream fis = new FileInputStream(file); OutputStream os = response.getOutputStream()) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fis.read(buffer)) != -1) {
                    os.write(buffer, 0, bytesRead);
                }
                os.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 공지사항 번호로 첨부파일 삭제
     */
    @PostMapping("/notice/attachments/delete")
    @ResponseBody
    public String deleteAttachmentsByNoticeNo(@RequestParam("noticeNo") int noticeNo) {
        int result = noticeAttachService.deleteAttachByNoticeNo(noticeNo);
        if (result > 0) {
            return "첨부파일이 성공적으로 삭제되었습니다.";
        } else {
            return "첨부파일 삭제에 실패했습니다.";
        }
    }
}
