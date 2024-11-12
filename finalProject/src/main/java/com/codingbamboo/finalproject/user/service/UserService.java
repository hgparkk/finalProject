package com.codingbamboo.finalproject.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.user.dao.IUserDAO;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Service
public class UserService {

	@Autowired
	IUserDAO dao;
	
	public UserDTO idDupCheck(UserDTO user) {
		return dao.idDupCheck(user);
	}
	
	public UserDTO emailDupCheck(UserDTO user) {
		return dao.emailDupCheck(user);
	}

	public int insertUser(UserDTO user) {
		return dao.insertUser(user);
	}
	
	public UserDTO loginUser(UserDTO user) {
		return dao.loginUser(user);
	}
	
	public UserDTO idFind(UserDTO user) {
		return dao.idFind(user);
	}
	
	public UserDTO pwFind(UserDTO user) {
		return dao.pwFind(user);
	}
	
	public int updateTemp(UserDTO user) {
		return dao.updateTemp(user);
	};
	
	public int updateUser(UserDTO user) {
		return dao.updateUser(user);
	}

	public int updateUserForSnsLink(UserDTO user) {
		return dao.updateUserForSnsLink(user);
	}
	
	public UserDTO selectUserForSnsLogin(UserDTO user) {
		return dao.selectUserForSnsLogin(user);
	}
	
	public int updateUserForDeleteSnsLink(String userId) {
		return dao.updateUserForDeleteSnsLink(userId);
	}
	
	public int deleteUser(String userId) {
		return dao.deleteUser(userId);
	}
}