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
}