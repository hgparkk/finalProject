package com.codingbamboo.finalproject.user.dao;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.user.dto.UserDTO;

@Mapper
public interface IUserDAO {
	public int insertUser(UserDTO user);
}