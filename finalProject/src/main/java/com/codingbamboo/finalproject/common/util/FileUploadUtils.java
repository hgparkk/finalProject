package com.codingbamboo.finalproject.common.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.codingbamboo.finalproject.noticeattach.dto.NoticeAttachDTO;

@Component
public class FileUploadUtils {

    @Value("${util.file.upload.path}")
    private String uploadPath;

    /**
     * MultipartFile 배열을 처리하여 서버에 저장하고, 첨부파일 정보를 반환.
     * 
     * @param files MultipartFile 배열
     * @return 첨부파일 정보 리스트
     * @throws IOException
     */
    public List<NoticeAttachDTO> uploadFiles(List<MultipartFile> files) throws IOException {
        if (uploadPath == null || uploadPath.isEmpty()) {
            throw new IllegalStateException("파일 업로드 경로가 설정되지 않았습니다.");
        }

        List<NoticeAttachDTO> attachList = new ArrayList<>();

        for (MultipartFile file : files) {
            if (!file.isEmpty()) {
                // 저장 파일명 생성
                String originalFileName = file.getOriginalFilename();
                String savedFileName = System.currentTimeMillis() + "_" + originalFileName;

                // 저장 경로 설정
                String fullPath = uploadPath.endsWith(File.separator) 
                                  ? uploadPath + savedFileName 
                                  : uploadPath + File.separator + savedFileName;

                // 파일 저장
                File dest = new File(fullPath);
                if (!dest.getParentFile().exists()) {
                    dest.getParentFile().mkdirs(); // 디렉토리가 없으면 생성
                }
                file.transferTo(dest);

                // 첨부파일 정보 생성
                NoticeAttachDTO attach = new NoticeAttachDTO();
                attach.setAttachName(savedFileName);
                attach.setAttachOriginalName(originalFileName);
                attach.setAttachSize(file.getSize());
                attach.setAttachPath(fullPath);

                attachList.add(attach);
            }
        }

        return attachList;
    }

    /**
     * 파일 크기를 보기 좋은 형식으로 변환.
     * 
     * @param size 파일 크기 (byte)
     * @return 보기 좋은 파일 크기 문자열
     */
    public String transferFancySize(long size) {
        DecimalFormat df = new DecimalFormat("#,###.0");

        if (size < 1024) {
            return size + " B";
        } else if (size < 1024 * 1024) {
            return df.format(size / 1024.0) + " KB";
        } else if (size < 1024 * 1024 * 1024) {
            return df.format(size / (1024.0 * 1024.0)) + " MB";
        } else {
            return df.format(size / (1024.0 * 1024.0 * 1024.0)) + " GB";
        }
    }
}
