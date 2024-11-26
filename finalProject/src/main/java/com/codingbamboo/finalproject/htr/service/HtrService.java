package com.codingbamboo.finalproject.htr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.htr.dao.IHtrDAO;
import com.codingbamboo.finalproject.htr.dto.HtrDTO;

@Service
public class HtrService {
	
	@Autowired
	IHtrDAO dao;
	
	public List<HtrDTO> getHtr(){
		return dao.getHtr();
	}
	
}
