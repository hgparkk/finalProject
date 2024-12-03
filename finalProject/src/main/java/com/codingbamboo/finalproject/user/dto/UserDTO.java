package com.codingbamboo.finalproject.user.dto;

import javax.validation.constraints.Pattern;

public class UserDTO {
	
	@Pattern(regexp = "^[a-z][a-zA-Z0-9]{5,}$", message = "아이디는 소문자로 시작하는 영문, 숫자로만 이루어진 6글자 이상이어야 합니다.")
	private String userId;
	
    @Pattern(regexp = "^(?=.*[a-z])[a-zA-Z0-9!@#$%^&*]{8,}$", message = "비밀번호는 영문 소문자가 포함된 숫자,영문,특수문자로만 이루어진 8글자 이상여야 합니다.")
	private String userPw;
    
    @Pattern(regexp = "^[가-힣a-zA-Z]*$", message = "이름은 숫자, 특수문자를 포함하지 않습니다.")
	private String userName;
    
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", message = "올바르지 않은 이메일 형식입니다.")
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