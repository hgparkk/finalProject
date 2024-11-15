package com.codingbamboo.finalproject.carboncalculate.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codingbamboo.finalproject.carboncalculate.dao.ICarbonCalculateDAO;
import com.codingbamboo.finalproject.carboncalculate.dto.CarbonCalculateDTO;
import com.codingbamboo.finalproject.carboncalculate.service.CarbonCalculateService;

@Controller
public class CarbonCalculateController {

	@Autowired
	ICarbonCalculateDAO dao;
	
	@Autowired
	CarbonCalculateService carbonCalculateService;
	
	@RequestMapping("/testView")
	public String testView() {
		return "carbonCal/testView";
	}

	// ź�ҹ��ڱ� ���� ������ �̵�
	@RequestMapping("/carbonCalView")
	public String carbonCalView() {
		return "carbonCal/carbonCalView";
	}

	// ź�ҹ��ڱ� ��� ��� ������ �̵�
	@RequestMapping("/carbonCalResultView")
	public String carbonCalResultView() {
		return "carbonCal/carbonCalResultView";
	}

	// ź�ҹ��ڱ� ��� ��� ����
	@PostMapping("/carbonCalRegistDo")
	public String carbonCalRegistDo(CarbonCalculateDTO carbonCalculate, HttpServletRequest request, HttpSession session) {
		com.codingbamboo.finalproject.user.dto.UserDTO login = (com.codingbamboo.finalproject.user.dto.UserDTO)session.getAttribute("login");
		
		if(login == null) {
			return "redirect:/loginView";
		}
		carbonCalculate.getResultDate();
		System.out.println(carbonCalculate);
		
		carbonCalculateService.insertCal(carbonCalculate);

		request.setAttribute("msg", "����� ��ϵǾ����ϴ�.");
		request.setAttribute("url", "/carbonCalView");

		return "alert";
	}
	
	// ���� ź�ҹ��ڱ� ������ �̵�
	@RequestMapping("/myCarbonStepView")
	public String myCarbonStepView(HttpSession session, Date date) {
		com.codingbamboo.finalproject.user.dto.UserDTO login = (com.codingbamboo.finalproject.user.dto.UserDTO)session.getAttribute("login");
		
		System.out.println(login);
		
		if(login == null) {
			return "redirect:/loginView";
		}
		
		List<CarbonCalculateDTO> getCarbonCalList = carbonCalculateService.getCarbonCalList();
		
		CarbonCalculateDTO carbonCalculate = carbonCalculateService.getCal(date);
		
		return "user/myCarbonStepView";
	}
	
	// �ӽ�
	// ������ ���� �ش��ϴ� �����͸� �������� �޼���
	@ResponseBody
    @RequestMapping("/carbonCal/getCarbonData")
    public ResponseEntity<Map<String, Object>> getCarbonData(@RequestParam("year") int year, @RequestParam("month") int month) {
        // DB���� �ش� ������ ���� �´� ź�ҹ��ڱ� ��� ����� ��������
        List<CarbonCalculateDTO> results = carbonCalculateService.getCarbonDataByMonth(year, month);

        // ������ ���� (��: �� ���ⷮ ��� ��)
        Map<String, Object> response = new HashMap<>();
        response.put("results", results);

        // �ʿ��� ������ �߰��� ���� (��: �׷����� �ʿ��� �� ��)
        // ����: response.put("totalCo2", calculateTotalCo2(results));

        return ResponseEntity.ok(response);  // JSON �������� ����
    }
}
