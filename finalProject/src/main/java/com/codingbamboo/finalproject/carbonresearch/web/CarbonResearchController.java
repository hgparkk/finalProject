package com.codingbamboo.finalproject.carbonresearch.web;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingbamboo.finalproject.carbonresearch.dto.CarbonResearchDTO;
import com.codingbamboo.finalproject.carbonresearch.service.CarbonResearchService;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class CarbonResearchController {

	@Autowired
	CarbonResearchService techService;
		
	/**
	 * 연구동향  목록 페이지
	 */
	@RequestMapping("/carbonResearchView")
	public String carbonResearchView(
	        @RequestParam(value = "page", defaultValue = "1") int page,
	        @RequestParam(value = "size", defaultValue = "10") int size,
	        Model model, HttpSession session) {

	    String url = "http://192.168.0.49:5000/getNews";
	    RestTemplate restTemplate = new RestTemplate();
	    
	    // 뉴스 데이터를 가져오기
	    List<Map<String, Object>> newsList = restTemplate.getForObject(url, List.class);


	    
	    System.out.println(newsList.size());
	    // 전체 데이터의 개수
	    int totalRecords = newsList.size();		// newsList.size();
	    
	    // 전체 페이지 수 계산
	    int totalPages = (int) Math.ceil((double) totalRecords / size);
	    
	    
	    // 페이지 범위 검증하여 범위를 벗어나지 않도록 처리
	    if (page < 1) {
	        page = 1;
	    } else if (page > totalPages && totalPages != 0) {
	        page = totalPages;
	    }

	    // 페이지 시작 인덱스와 끝 인덱스 계산
	    int startIndex = (page - 1) * size;
	    int endIndex = Math.min(startIndex + size, totalRecords);
	    
	    // 페이징된 데이터 리스트
	    List<Map<String, Object>> paginatedList = newsList.subList(startIndex, endIndex);

	    // 모델에 데이터 추가
	    model.addAttribute("newsData", paginatedList);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", totalPages);
	    model.addAttribute("totalRecords", totalRecords);

	    
	    return "carbonresearch/carbonResearchView";
	}



}
