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
	public UserDTO pwFind(UserDTO user);
	public int updateTemp(UserDTO user);
	public int updateUser(UserDTO user);
	public int updateUserForSnsLink(UserDTO user);
	public UserDTO selectUserForSnsLogin(UserDTO user);
	public int updateUserForDeleteSnsLink(String userId);
	public int deleteUser(String userId);
}