package com.codingbamboo.finalproject.usersg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.usersg.dao.IUserSgDAO;

@Service
public class UserSgService {
	
	@Autowired
	IUserSgDAO dao;
}
