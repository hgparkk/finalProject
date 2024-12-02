package com.codingbamboo.finalproject.usersg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.codingbamboo.finalproject.usersg.dto.UserSgDTO;

@Mapper
public interface IUserSgDAO {

    // 목록 조회 (검색 키워드와 페이징 처리 - Map 방식)
    List<UserSgDTO> getSgList(Map<String, Object> paramMap);

    // 상세 조회 (공지사항 번호 기반)
    UserSgDTO getSgDetail(@Param("sgNo") int sgNo);

    // 삭제
    int deleteSg(@Param("sgNo") int sgNo);

    // 공지사항 총 개수 조회 (검색 키워드 기반 - Map 방식)
    int selectSgCount(Map<String, Object> paramMap);

    // 공지사항 수정
    int updateSg(UserSgDTO suggestion);

    // 특정 공지사항의 첨부파일 개수 조회
    int getAttachCountBySgNo(@Param("sgNo") int sgNo);

    // 목록 조회 (검색 키워드와 페이징 처리 - 개별 파라미터 방식)
    List<UserSgDTO> getSgList(@Param("searchKeyword") String searchKeyword, 
                                  @Param("offset") int offset, 
                                  @Param("size") int size);

    // 총 개수 조회 (검색 키워드 기반)
    int getSgCount(@Param("searchKeyword") String searchKeyword);
    
    int registSg(UserSgDTO sg);
    
    int getCurrentSgNo();

	int getSgNo();
}
