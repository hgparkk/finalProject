package com.codingbamboo.finalproject.oauth.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingbamboo.finalproject.oauth.service.NaverService;
import com.codingbamboo.finalproject.user.dto.UserDTO;
import com.codingbamboo.finalproject.user.service.UserService;

@Controller
public class NaverCallbackController {

	@Autowired
	UserService userService;

	private final NaverService naverService;

	@Autowired
	public NaverCallbackController(NaverService naverService) {
		this.naverService = naverService;
	}

	// 콜백 처리 함수 (기존 계정과 네이버 아이디 연동)
	@RequestMapping(value = "/link/naver/callback", method = RequestMethod.GET)
	public String linkCallbackNaver(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = naverService.handleCallback(code, state, session);

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		loginUser.setUserProvider("Naver");
		loginUser.setUserProviderId((String) userInfo.get("id"));

		userService.updateUserForSnsLink(loginUser);

		session.setAttribute("login", loginUser);

		request.setAttribute("msg", "해당 계정에 소셜 계정이 연동되었습니다.");
		request.setAttribute("url", "/myPageSnsLinkManageView");
		return "alert";
	}

	// 콜백 처리 함수 (로그인한 네이버 아이디와 연동되어있는 계정 찾기)
	@RequestMapping(value = "/login/naver/callback", method = RequestMethod.GET)
	public String loginCallbackNaver(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = naverService.handleCallback(code, state, session);

		UserDTO loginUserInfo = new UserDTO();
		loginUserInfo.setUserProvider("Naver");
		loginUserInfo.setUserProviderId((String) userInfo.get("id"));
		UserDTO login = userService.selectUserForSnsLogin(loginUserInfo);

		if (login != null) {
			String fromUrl = request.getHeader("Referer");
			session.setAttribute("login", login);
			if (fromUrl == null || fromUrl.isEmpty() || fromUrl.contains("/login") || fromUrl.contains("/callback")) {
				return "redirect:/";
			} else {
				System.out.println(fromUrl);
				return "redirect:" + fromUrl;
			}
		} else {
			request.setAttribute("msg", "연동된 정보가 없습니다. 로그인 후 소셜 계정을 연동해서 사용해주세요.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}
}