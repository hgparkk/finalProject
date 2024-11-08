package com.codingbamboo.finalproject.user.dao;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.user.dto.UserDTO;

@Mapper
public interface IUserDAO {
	public UserDTO idDupCheck(UserDTO uesr);
	public UserDTO emailDupCheck(UserDTO user);
	public int insertUser(UserDTO user);
	public UserDTO loginUser(UserDTO user);
	public UserDTO idFind(UserDTO user);
}