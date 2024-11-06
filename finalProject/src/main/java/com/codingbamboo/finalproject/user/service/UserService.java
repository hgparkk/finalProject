package com.codingbamboo.finalproject.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.user.dao.IUserDAO;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Service
public class UserService {

	@Autowired
	IUserDAO dao;

	public int insertUser(UserDTO user) {
		return dao.insertUser(user);
	}
}