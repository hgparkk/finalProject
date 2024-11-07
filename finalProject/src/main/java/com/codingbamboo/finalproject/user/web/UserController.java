package com.codingbamboo.finalproject.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingbamboo.finalproject.user.dto.UserDTO;
import com.codingbamboo.finalproject.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	UserService userService;

	// 로그인 창 이동
	@RequestMapping(value = "/loginView", method = RequestMethod.GET)
	public String loginView(HttpServletRequest request, Model model,
			@RequestParam(value = "fromUrl", required = false) String fromUrl) {
		if (fromUrl == null || fromUrl.isEmpty()) {
			fromUrl = request.getHeader("Referer");
		}
		model.addAttribute("fromUrl", fromUrl);
		return "user/loginView";
	}

	// 로그인
	@RequestMapping(value = "/loginDo", method = RequestMethod.POST)
	public String loginDo(String fromUrl, UserDTO userInfo, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, Model model, RedirectAttributes attr) {

		UserDTO login = userService.loginUser(userInfo);

		if (login != null && passwordEncoder.matches(userInfo.getUserPw(), login.getUserPw())) {
			session.setAttribute("login", login);
			if (fromUrl == null || fromUrl.isEmpty()) {
				return "redirect:" + fromUrl;
			} else {
				return "redirect:/";
			}
		} else {
			attr.addFlashAttribute("failMsg", "아이디 혹은 비밀번호가 올바르지 않습니다.");
			attr.addAttribute("fromUrl", fromUrl);
			return "redirect:/loginView";
		}
	}

	// 회원가입 창
	@RequestMapping(value = "/registView", method = RequestMethod.GET)
	public String registView() {
		return "user/registView";
	}

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/idDupCheck", method = RequestMethod.POST)
	public boolean idDupCheck(String inputId) {
		UserDTO idCheck = new UserDTO();
		idCheck.setUserId(inputId);

		UserDTO checked = userService.idDupCheck(idCheck);

		// null 체크 후 inputId와 조회된 ID를 비교
		return (checked != null && checked.getUserId().equals(inputId));
	}

	// 이메일 중복체크
	@RequestMapping(value = "/emailDupCheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean emailDupCheck(String inputEmail) {
		UserDTO emailCheck = new UserDTO();
		emailCheck.setUserEmail(inputEmail);

		UserDTO checked = userService.emailDupCheck(emailCheck);
		return (checked != null && checked.getUserEmail().equals(inputEmail));
	}
}