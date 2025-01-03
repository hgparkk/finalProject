package com.codingbamboo.finalproject.attach.dto;

public class AttachDTO {

	private int attachNo; // 첨부파일 고유 번호
	private String attachName; // 서버에 저장된 첨부파일 이름
	private String attachOriginalName; // 업로드된 파일의 원본 이름
	private long attachSize; // 첨부파일 크기 (byte 단위)
	private String attachFancySize; // 보기 좋은 파일 크기
	private String attachType; // 기본값
	private String attachPath; // 첨부파일이 저장된 경로

	// Getter and Setter
	public int getAttachNo() {
		return attachNo;
	}

	public void setAttachNo(int attachNo) {
		this.attachNo = attachNo;
	}

	public String getAttachName() {
		return attachName;
	}

	public void setAttachName(String attachName) {
		this.attachName = attachName;
	}

	public String getAttachOriginalName() {
		return attachOriginalName;
	}

	public void setAttachOriginalName(String attachOriginalName) {
		this.attachOriginalName = attachOriginalName;
	}

	public long getAttachSize() {
		return attachSize;
	}

	public void setAttachSize(long attachSize) {
		this.attachSize = attachSize;
	}

	public String getAttachType() {
		return attachType;
	}

	public void setAttachType(String attachType) {
		this.attachType = attachType;
	}

	public String getAttachPath() {
		return attachPath;
	}

	public void setAttachPath(String attachPath) {
		this.attachPath = attachPath;
	}

	public String getAttachFancySize() {
		return attachFancySize;
	}

	public void setAttachFancySize(String attachFancySize) {
		this.attachFancySize = attachFancySize;
	}



	@Override
	public String toString() {
		return "AttachDTO [attachNo=" + attachNo + ", attachName=" + attachName + ", attachOriginalName="
				+ attachOriginalName + ", attachSize=" + attachSize + ", attachFancySize=" + attachFancySize
				+ ", attachType=" + attachType + ", attachPath=" + attachPath + "]";
	}

	public AttachDTO() {
		super();
	}

	public AttachDTO(int attachNo, String attachName, String attachOriginalName, long attachSize, String attachType,
			String attachPath, int noticeNo, String attachFancySize) {
		super();
		this.attachNo = attachNo;
		this.attachName = attachName;
		this.attachOriginalName = attachOriginalName;
		this.attachSize = attachSize;
		this.attachType = attachType;
		this.attachPath = attachPath;
		this.attachFancySize = attachFancySize;
	}
}
