package com.codingbamboo.finalproject.common.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.codingbamboo.finalproject.attach.dto.AttachDTO;

@Component
public class FileUploadUtils {

	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	public List<AttachDTO> getAttachListByMultiparts(MultipartFile[] boFileArray) throws IOException {
		List<AttachDTO> attachList = new ArrayList<>();

		for (MultipartFile boFile : boFileArray) {
			if (!boFile.isEmpty()) {
				AttachDTO attach = getAttachByMultipart(boFile);
				attachList.add(attach);
			}
		}

		return attachList;
	}

	public AttachDTO getAttachByMultipart(MultipartFile boFile) throws IOException {
		String fileName = UUID.randomUUID().toString();

		File uploadFolder = new File(uploadPath);
		uploadFolder.mkdir();

		String filePath = uploadPath + File.separatorChar + fileName;

		boFile.transferTo(new File(filePath));

		AttachDTO attach = new AttachDTO();
		attach.setAttachName(fileName);
		attach.setAttachOriginalName(boFile.getOriginalFilename());
		attach.setAttachSize(boFile.getSize());
		attach.setAttachFancySize(transferFancySize(boFile.getSize()));
		attach.setAttachType(boFile.getContentType());
		attach.setAttachPath(filePath);

		return attach;
	}

	private String transferFancySize(long size) {
		DecimalFormat df = new DecimalFormat("#,###.0");

		if (size < (long) (Math.pow(2.0, 10.0)))
			return df.format(size) + "Byte";
		else if (size < (long) (Math.pow(2.0, 20.0)))
			return df.format((size / (long) (Math.pow(2.0, 10.0)))) + "KB";
		else if (size < (long) (Math.pow(2.0, 30.0)))
			return df.format((size / (long) (Math.pow(2.0, 20.0)))) + "MB";
		else
			return df.format((size / (long) (Math.pow(2.0, 30.0)))) + "GB";
	}
}
