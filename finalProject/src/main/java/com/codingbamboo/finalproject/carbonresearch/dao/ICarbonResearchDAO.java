package com.codingbamboo.finalproject.carbonresearch.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.codingbamboo.finalproject.carbonresearch.dto.CarbonResearchDTO;

@Mapper
public interface ICarbonResearchDAO {
	
    // 연구동향 상세 조회 (연구동향 번호 기반)
	CarbonResearchDTO getTechDetail(int techNo);

    // 연구동향 삭제
    int deleteTech(int techNo);

    // 연구동향 미리보기 조회 (최신 공지사항 3개)
    List<CarbonResearchDTO> getTechPreviewList();

    // 연구동향 수정
    int updateTech(CarbonResearchDTO technology);

    // 연구동향 목록 조회 (검색 키워드와 페이징 처리 - 개별 파라미터 방식)
    List<CarbonResearchDTO> getTechList(@Param("searchKeyword") String searchKeyword, 
                                  @Param("offset") int offset, 
                                  @Param("size") int size);

    // 연구동향 총 개수 조회 (검색 키워드 기반)
    int getTechCount(String searchKeyword);
    
    int registTech(CarbonResearchDTO technology);
    
    int getCurrentTechNo();
    
	int getTechNo();
	
	
	
}
