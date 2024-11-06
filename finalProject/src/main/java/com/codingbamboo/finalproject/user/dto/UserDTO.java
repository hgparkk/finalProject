package com.codingbamboo.finalproject.user.dto;

public class UserDTO {
	private String userId;
	private String userPw;
	private String userName;
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