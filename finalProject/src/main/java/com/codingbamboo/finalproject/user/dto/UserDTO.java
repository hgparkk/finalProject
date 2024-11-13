package com.codingbamboo.finalproject.user.dto;

import javax.validation.constraints.Pattern;

public class UserDTO {
	
	@Pattern(regexp = "^[a-z][a-zA-Z0-9]{5,}$", message = "¿Ã¹Ù¸£Áö ¾ÊÀº ¾ÆÀÌµğ ÀÔ´Ï´Ù.\\n¾ÆÀÌµğ´Â ¼ıÀÚ, ¿µ¹®À¸·Î¸¸ ÀÌ·ç¾îÁø 6±ÛÀÚ ÀÌ»óÀÌ¾î¾ß ÇÏ¸ç, ¿µ¹® ¼Ò¹®ÀÚ·Î ½ÃÀÛÇØ¾ß ÇÕ´Ï´Ù.")
	private String userId;
	
    @Pattern(regexp = "^(?=.*[a-z])[a-zA-Z0-9!@#$%^&*]{8,}$", message = "¿Ã¹Ù¸£Áö ¾ÊÀº ºñ¹Ğ¹øÈ£ ÀÔ´Ï´Ù.\\n¼ıÀÚ, ¿µ¹®, Æ¯¼ö¹®ÀÚ·Î¸¸ ÀÌ·ç¾îÁø 8±ÛÀÚ ÀÌ»óÀÌ¾î¾ß ÇÏ¸ç, ¿µ¹® ¼Ò¹®ÀÚ°¡ ¹İµå½Ã Æ÷ÇÔµÇ¾î¾ß ÇÕ´Ï´Ù.")
	private String userPw;
    
    @Pattern(regexp = "^[°¡-ÆRa-zA-Z]*$", message = "¿Ã¹Ù¸£Áö ¾ÊÀº ÀÌ¸§ÀÔ´Ï´Ù.\\nÀÌ¸§Àº ¼ıÀÚ³ª Æ¯¼ö¹®ÀÚ¸¦ Æ÷ÇÔÇÏÁö ¾Ê¾Æ¾ß ÇÕ´Ï´Ù.")
	private String userName;
    
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", message = "¿Ã¹Ù¸£Áö ¾ÊÀº ÀÌ¸ŞÀÏ Çü½ÄÀÔ´Ï´Ù.")
	private String userEmail;
    
	private int userIsmaster;
	private int userIstemp;
	private String userProvider;
	private String userProviderId;
	
	public UserDTO() {
		super();
	}

	public UserDTO(String userId, String userPw, String userName, String userEmail, int userIsmaster,
			int userIstemp, String userProvider, String userProviderId) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userIsmaster = userIsmaster;
		this.userIstemp = userIstemp;
		this.userProvider = userProvider;
		this.userProviderId = userProviderId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public int getUserIsmaster() {
		return userIsmaster;
	}

	public void setUserIsmaster(int userIsmaster) {
		this.userIsmaster = userIsmaster;
	}

	public int getUserIstemp() {
		return userIstemp;
	}

	public void setUserIstemp(int userIstemp) {
		this.userIstemp = userIstemp;
	}

	public String getUserProvider() {
		return userProvider;
	}

	public void setUserProvider(String userProvider) {
		this.userProvider = userProvider;
	}

	public String getUserProviderId() {
		return userProviderId;
	}

	public void setUserProviderId(String userProviderId) {
		this.userProviderId = userProviderId;
	}

	@Override
	public String toString() {
		return "UserDTO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userIsmaster=" + userIsmaster + ", userIstemp=" + userIstemp + ", userProvider="
				+ userProvider + ", userProviderId=" + userProviderId + "]";
	}
}