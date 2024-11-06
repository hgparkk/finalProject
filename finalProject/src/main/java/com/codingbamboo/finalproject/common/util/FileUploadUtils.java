package com.codingbamboo.finalproject.common.util;

import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class FileUploadUtils {
	
	@Value("{util['file.upload.path']}")
	private String uploadPath;
	
	private String transferFancySize(long size) {
		DecimalFormat df = new DecimalFormat("#,###.0");
		
		if(size < 1024) return size + "B";
		else if(size < 1024 * 1024) return df.format(size/1024.0) + "KB";
		else if(size < 1024 * 1024 * 1024) return df.format(size/(1024.0*1024.0)) + "MB";
		else return df.format(size/(1024.0*1024.0*1024.0)) + "GB";
	}
}