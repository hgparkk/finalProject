package com.codingbamboo.finalproject.user.dto;

import javax.validation.constraints.Pattern;

public class UserDTO {
	
	@Pattern(regexp = "^[a-z][a-zA-Z0-9]{5,}$", message = "�ùٸ��� ���� ���̵� �Դϴ�.\\n���̵�� ����, �������θ� �̷���� 6���� �̻��̾�� �ϸ�, ���� �ҹ��ڷ� �����ؾ� �մϴ�.")
	private String userId;
	
    @Pattern(regexp = "^(?=.*[a-z])[a-zA-Z0-9!@#$%^&*]{8,}$", message = "�ùٸ��� ���� ��й�ȣ �Դϴ�.\\n����, ����, Ư�����ڷθ� �̷���� 8���� �̻��̾�� �ϸ�, ���� �ҹ��ڰ� �ݵ�� ���ԵǾ�� �մϴ�.")
	private String userPw;
    
    @Pattern(regexp = "^[��-�Ra-zA-Z]*$", message = "�ùٸ��� ���� �̸��Դϴ�.\\n�̸��� ���ڳ� Ư�����ڸ� �������� �ʾƾ� �մϴ�.")
	private String userName;
    
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", message = "�ùٸ��� ���� �̸��� �����Դϴ�.")
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