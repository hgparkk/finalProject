package com.codingbamboo.finalproject.usersg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.codingbamboo.finalproject.attach.dto.AttachDTO;
import com.codingbamboo.finalproject.usersg.dto.UserSgDTO;

@Mapper
public interface IUserSgDAO {

    // 상세 조회 (건의사항 번호 기반)
    UserSgDTO getSgDetail(int sgNo);

    // 삭제
    int deleteSg(int sgNo);

    // 건의사항 수정
    int updateSg(UserSgDTO suggestion);

    // 특정 건의사항의 첨부파일 개수 조회
    int getAttachCountBySgNo(int sgNo);

    // 목록 조회 (검색 키워드와 페이징 처리 - 개별 파라미터 방식)
    List<UserSgDTO> getSgList(@Param("userId") String userId, 
                                  @Param("offset") int offset, 
                                  @Param("size") int size);
    
    List<UserSgDTO> getAdminSgList( @Param("offset") int offset, 
            @Param("size") int size);

    
    // 총 개수 조회 (검색 키워드 기반)
    int getSgCount(String userId);
    
    int registSg(UserSgDTO sg);
    
    int getCurrentSgNo();

	int getSgNo();
	
	int getAdminSgCount();
	
	
	int insertAttach(AttachDTO attach);
	
	int deleteBySgNo(int sgNo);
	
	int deleteSgAttach(int sgNo);
	
	int getAttachNo(String attachName);
	
}
