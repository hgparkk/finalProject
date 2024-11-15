package com.codingbamboo.finalproject.oauth.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingbamboo.finalproject.oauth.service.OAuthService;
import com.codingbamboo.finalproject.user.dto.UserDTO;
import com.codingbamboo.finalproject.user.service.UserService;

@Controller
public class CallbackController {

	@Autowired
	UserService userService;

	private final OAuthService oauthService;

	@Autowired
	public CallbackController(OAuthService oauthService) {
		this.oauthService = oauthService;
	}

	// 콜백 처리 함수 (기존 계정과 네이버 아이디 연동)
	@RequestMapping(value = "/link/naver/callback", method = RequestMethod.GET)
	public String linkCallbackNaver(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = oauthService.handleCallback(code, state, true, session, "Naver");

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
		Map<String, Object> userInfo = oauthService.handleCallback(code, state, false, session, "Naver");

		UserDTO loginUserInfo = new UserDTO();
		loginUserInfo.setUserProvider("Naver");
		loginUserInfo.setUserProviderId((String) userInfo.get("id"));
		UserDTO login = userService.selectUserForSnsLogin(loginUserInfo);

		if (login != null) {
			String fromUrl = (String) session.getAttribute("fromUrl");
			session.setAttribute("login", login);
			if (fromUrl == null || fromUrl.isEmpty() || fromUrl.contains("/login") || fromUrl.contains("/callback")) {
				return "redirect:/";
			} else {
				return "redirect:" + fromUrl;
			}
		} else {
			request.setAttribute("msg", "연동된 정보가 없습니다. 로그인 후 소셜 계정을 연동해서 사용해주세요.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}

	// 콜백 처리 함수 (기존 계정과 카카오 아이디 연동)
	@RequestMapping(value = "/link/kakao/callback", method = RequestMethod.GET)
	public String linkCallbackKakao(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = oauthService.handleCallback(code, state, true, session, "Kakao");

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		loginUser.setUserProvider("Kakao");
		loginUser.setUserProviderId((String) userInfo.get("id"));

		userService.updateUserForSnsLink(loginUser);

		session.setAttribute("login", loginUser);

		request.setAttribute("msg", "해당 계정에 소셜 계정이 연동되었습니다.");
		request.setAttribute("url", "/myPageSnsLinkManageView");
		return "alert";
	}

	// 콜백 처리 함수 (로그인한 카카오 아이디와 연동되어있는 계정 찾기)
	@RequestMapping(value = "/login/kakao/callback", method = RequestMethod.GET)
	public String loginCallbackKakao(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = oauthService.handleCallback(code, state, false, session, "Kakao");

		UserDTO loginUserInfo = new UserDTO();
		loginUserInfo.setUserProvider("Kakao");
		loginUserInfo.setUserProviderId((String) userInfo.get("id"));
		UserDTO login = userService.selectUserForSnsLogin(loginUserInfo);

		if (login != null) {
			String fromUrl = (String) session.getAttribute("fromUrl");
			session.setAttribute("login", login);
			if (fromUrl == null || fromUrl.isEmpty() || fromUrl.contains("/login") || fromUrl.contains("/callback")) {
				return "redirect:/";
			} else {
				return "redirect:" + fromUrl;
			}
		} else {
			request.setAttribute("msg", "연동된 정보가 없습니다. 로그인 후 소셜 계정을 연동해서 사용해주세요.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}

	// 콜백 처리 함수 (기존 계정과 구글 아이디 연동)
	@RequestMapping(value = "/link/google/callback", method = RequestMethod.GET)
	public String linkCallbackGoogle(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = oauthService.handleCallback(code, state, true, session, "Google");

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		loginUser.setUserProvider("Google");
		loginUser.setUserProviderId((String) userInfo.get("id"));

		userService.updateUserForSnsLink(loginUser);

		session.setAttribute("login", loginUser);

		request.setAttribute("msg", "해당 계정에 소셜 계정이 연동되었습니다.");
		request.setAttribute("url", "/myPageSnsLinkManageView");
		return "alert";
	}

	// 콜백 처리 함수 (로그인한 구글 아이디와 연동되어있는 계정 찾기)
	@RequestMapping(value = "/login/google/callback", method = RequestMethod.GET)
	public String loginCallbackGoogle(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = oauthService.handleCallback(code, state, false, session, "Google");
		UserDTO loginUserInfo = new UserDTO();
		loginUserInfo.setUserProvider("Google");
		loginUserInfo.setUserProviderId((String) userInfo.get("id"));
		UserDTO login = userService.selectUserForSnsLogin(loginUserInfo);

		if (login != null) {
			String fromUrl = (String) session.getAttribute("fromUrl");
			session.setAttribute("login", login);
			if (fromUrl == null || fromUrl.isEmpty() || fromUrl.contains("/login") || fromUrl.contains("/callback")) {
				return "redirect:/";
			} else {
				return "redirect:" + fromUrl;
			}
		} else {
			request.setAttribute("msg", "연동된 정보가 없습니다. 로그인 후 소셜 계정을 연동해서 사용해주세요.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}
}