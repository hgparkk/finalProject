package com.codingbamboo.finalproject.rae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.rae.dao.IRaeDAO;
import com.codingbamboo.finalproject.rae.dto.RaeDTO;

@Service
public class RaeService {
	
	@Autowired
	IRaeDAO dao;
	
	public List<RaeDTO> getRae(){
		return dao.getRae();
	}
}
