package com.codingbamboo.finalproject.admincoefficient.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingbamboo.finalproject.admincoefficient.dao.IAdminCoefficientDAO;
import com.codingbamboo.finalproject.coefficient.dto.CoefficientDTO;
import com.codingbamboo.finalproject.coefficient.service.CoefficientService;
import com.codingbamboo.finalproject.user.dto.UserDTO;

@Controller
public class AdminCoefficientController {

	@Autowired
	IAdminCoefficientDAO dao;

	@Autowired
	CoefficientService service;

	@RequestMapping(value = "/adminCalculationView", method = RequestMethod.GET)
	public String adminCalView(Model model, HttpSession session) {
		UserDTO login = (UserDTO) session.getAttribute("login");
		if (login.getUserIsmaster() != 1) {
			return "redirect:/";
		}
		List<CoefficientDTO> coefficientList = service.getCoefficientValue();
		model.addAttribute("calculation", coefficientList);
		return "admin/adminCalculationView";
	}

	/**
	 * 계산 업데이트 추가
	 */
	@RequestMapping(value = "/updateCalculationDo", method = RequestMethod.POST)
	public String updateCalculationDo(@RequestParam("coefficientNo") List<Integer> coefficientNos,
			@RequestParam("coefficientValue") List<Double> coefficientValues, HttpServletRequest request) {
		List<CoefficientDTO> coefficientList = new ArrayList<>();
		for (int i = 0; i < coefficientNos.size(); i++) {
			coefficientList.add(new CoefficientDTO(coefficientNos.get(i), null, coefficientValues.get(i)));
		}
		service.updateCoefficients(coefficientList);
		request.setAttribute("msg", "계산식 수정이 완료되었습니다.");
		request.setAttribute("url", "/adminCalculationView");
		return "alert";
	}
}