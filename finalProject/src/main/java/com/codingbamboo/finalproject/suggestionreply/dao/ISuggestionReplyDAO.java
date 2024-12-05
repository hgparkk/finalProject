package com.codingbamboo.finalproject.suggestionreply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.codingbamboo.finalproject.suggestionreply.dto.SuggestionReplyDTO;

@Mapper
public interface ISuggestionReplyDAO {

	int registReply(SuggestionReplyDTO reply);
	
	SuggestionReplyDTO getReply(int replyNo);
	
	List<SuggestionReplyDTO> getReplyList(int sgNo);
	
	int delReply(int replyNo);
	
	int delSgAllReply(int sgNo);
	
}
