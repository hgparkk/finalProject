package com.codingbamboo.finalproject.suggestionreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.suggestionreply.dao.ISuggestionReplyDAO;
import com.codingbamboo.finalproject.suggestionreply.dto.SuggestionReplyDTO;

@Service
public class SuggestionReplyService {
	
	@Autowired
	private ISuggestionReplyDAO replydao;
	
	public int registReply(SuggestionReplyDTO reply) {
		return replydao.registReply(reply);
	}
	
	public List<SuggestionReplyDTO> getReplyList(int sgNo) {
		return replydao.getReplyList(sgNo);
	}
	
	public int delReply(int reNo) {
		int result = replydao.delReply(reNo);
		return result;
	}
	
	public int readReply(int reNo) {
		return replydao.readReply(reNo);
	}
	
	public int delSgAllReply(int sgNo) {
		int result = replydao.delSgAllReply(sgNo);
		return result;
	}

}
