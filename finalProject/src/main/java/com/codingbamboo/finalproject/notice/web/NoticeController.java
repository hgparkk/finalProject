package com.codingbamboo.finalproject.notice.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingbamboo.finalproject.notice.dto.NoticeDTO;
import com.codingbamboo.finalproject.notice.service.NoticeService;
import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    private static final String UPLOAD_DIR = "C:/uploads/"; // 파일 저장 경로

    @RequestMapping("/noticeView")
    public String noticeView(@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                              @RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "size", defaultValue = "10") int size, HttpSession session, Model model) {

        UserDTO loginUser = (UserDTO) session.getAttribute("login");

        if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
            searchKeyword = null;
        }

        if (page < 1) page = 1;
        if (size < 1) size = 10;

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("searchKeyword", searchKeyword);
        paramMap.put("offset", (page - 1) * size);
        paramMap.put("limit", size);

        List<NoticeDTO> noticeList = noticeService.getNoticeList(paramMap);
        int totalNotices = noticeService.getNoticeCount(paramMap);
        int totalPages = (int) Math.ceil((double) totalNotices / size);

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("size", size);

        model.addAttribute("ismaster", loginUser != null ? loginUser.getUserIsmaster() : 0);

        return "notice/noticeView";
    }

    @RequestMapping("/noticeDetailView")
    public String noticeDetailView(@RequestParam("noticeNo") int noticeNo, Model model) {
        // 공지사항 상세 정보 및 첨부파일 목록 가져오기
        NoticeDTO notice = noticeService.getNoticeDetail(noticeNo);

        // 디버깅: Notice와 AttachList 데이터 출력
        if (notice != null) {
            System.out.println("공지사항 데이터: " + notice);
            System.out.println("첨부파일 데이터: " + notice.getAttachList());
        }

        model.addAttribute("notice", notice);
        return "notice/noticeDetailView";
    }

    @RequestMapping("/noticeWriteView")
    public String noticeWriteView(HttpSession session, Model model) {
        UserDTO loginUser = (UserDTO) session.getAttribute("login");
        if (loginUser == null || loginUser.getUserIsmaster() != 1) {
            model.addAttribute("errorMsg", "권한이 없습니다.");
            return "redirect:/noticeView";
        }
        return "notice/noticeWriteView";
    }

    @RequestMapping("/noticeWriteDo")
    public String noticeWriteDo(@RequestParam("noticeTitle") String noticeTitle,
                                 @RequestParam("noticeContent") String noticeContent,
                                 @RequestParam(value = "attachFiles", required = false) List<MultipartFile> attachFiles,
                                 HttpSession session, RedirectAttributes redirectAttributes) {
        UserDTO loginUser = (UserDTO) session.getAttribute("login");

        if (loginUser == null || loginUser.getUserIsmaster() != 1) {
            redirectAttributes.addFlashAttribute("errorMsg", "권한이 없습니다.");
            return "redirect:/noticeView";
        }

        NoticeDTO notice = new NoticeDTO();
        notice.setNoticeTitle(noticeTitle);
        notice.setNoticeContent(noticeContent);

        List<NoticeAttachDTO> attachList = handleFileUpload(attachFiles, redirectAttributes);
        if (attachList == null) {
            return "redirect:/noticeView";
        }

        int result = noticeService.registNotice(notice, attachList);

        if (result > 0) {
            redirectAttributes.addFlashAttribute("successMsg", "공지사항이 등록되었습니다.");
        } else {
            redirectAttributes.addFlashAttribute("errorMsg", "공지사항 등록에 실패했습니다.");
        }

        return "redirect:/noticeView";
    }

    @RequestMapping("/notice/attachment/download")
    public ResponseEntity<Resource> downloadAttachment(@RequestParam("attachNo") int attachNo) throws IOException {
        NoticeAttachDTO attach = noticeService.getAttachByAttachNo(attachNo);

        if (attach == null) {
            throw new FileNotFoundException("파일 정보를 찾을 수 없습니다.");
        }

        String absolutePath = attach.getAttachPath();
        File file = new File(absolutePath);

        if (!file.exists()) {
            throw new FileNotFoundException("파일이 존재하지 않습니다: " + absolutePath);
        }

        Resource resource = new FileSystemResource(file);
        String encodedFileName = URLEncoder.encode(attach.getAttachOriginalName(), "UTF-8").replaceAll("\\+", "%20");

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + encodedFileName + "\"");
        headers.add(HttpHeaders.CONTENT_TYPE, attach.getAttachType());

        return ResponseEntity.ok()
                .headers(headers)
                .body(resource);
    }

    private List<NoticeAttachDTO> handleFileUpload(List<MultipartFile> files, RedirectAttributes redirectAttributes) {
        List<NoticeAttachDTO> attachList = new ArrayList<>();
        if (files != null) {
            for (MultipartFile file : files) {
                if (!file.isEmpty()) {
                    try {
                        String originalFileName = file.getOriginalFilename();
                        String savedFileName = System.currentTimeMillis() + "_" + originalFileName;
                        String filePath = UPLOAD_DIR + savedFileName;

                        File dest = new File(filePath);
                        if (!dest.getParentFile().exists()) {
                            dest.getParentFile().mkdirs();
                        }
                        file.transferTo(dest);

                        NoticeAttachDTO attach = new NoticeAttachDTO();
                        attach.setAttachName(savedFileName);
                        attach.setAttachOriginalName(originalFileName);
                        attach.setAttachSize(file.getSize());
                        attach.setAttachPath(filePath);
                        attachList.add(attach);

                    } catch (IOException e) {
                        e.printStackTrace();
                        redirectAttributes.addFlashAttribute("errorMsg", "파일 업로드 중 오류 발생: " + e.getMessage());
                        return null;
                    }
                }
            }
        }
        return attachList;
    }
}
