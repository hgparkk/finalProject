package com.codingbamboo.finalproject.suggestionreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingbamboo.finalproject.suggestionreply.dao.ISuggestionReplyDAO;
import com.codingbamboo.finalproject.suggestionreply.dto.SuggestionReplyDTO;
import com.codingbamboo.finalproject.usersg.dao.IUserSgDAO;

@Service
public class SuggestionReplyService {

	@Autowired
	private IUserSgDAO usersgdao;
	
	@Autowired
	private ISuggestionReplyDAO replydao;
	
	public int registReply(SuggestionReplyDTO reply) {
		return replydao.registReply(reply);
	}
	
	public List<SuggestionReplyDTO> getReplyList(int sgNo) {
		return replydao.getReplyList(sgNo);
	}
	
//	public int getReply(int reNo) {
//		int result = replydao.getReply(reNo);
//		return result;
//	}
	
	public int delReply(int reNo) {
		int result = replydao.delReply(reNo);
		return result;
	}
	
	public int delSgAllReply(int sgNo) {
		int result = replydao.delSgAllReply(sgNo);
		return result;
	}

}
