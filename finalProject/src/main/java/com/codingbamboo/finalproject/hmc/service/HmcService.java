package com.codingbamboo.finalproject.hmc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.hmc.dao.IHmcDAO;
import com.codingbamboo.finalproject.hmc.dto.HmcDTO;

@Service
public class HmcService {
	
	@Autowired
	IHmcDAO dao;
	public List<HmcDTO> getHmc(){
		return dao.getHmc();
	}

}
