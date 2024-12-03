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

	// 네이버 로그인 연동
	@RequestMapping(value = "/link/naver/callback", method = RequestMethod.GET)
	public String linkCallbackNaver(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = oauthService.handleCallback(code, state, true, session, "Naver");

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		loginUser.setUserProvider("Naver");
		loginUser.setUserProviderId((String) userInfo.get("id"));

		userService.updateUserForSnsLink(loginUser);

		session.setAttribute("login", loginUser);

		request.setAttribute("msg", "해당 계정에 sns가 연동되었습니다.");
		request.setAttribute("url", "/myPageSnsLinkManageView");
		return "alert";
	}

	// 네이버 로그인
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
			if (fromUrl == null || fromUrl.isEmpty() || fromUrl.contains("/login") || fromUrl.contains("/callback") || fromUrl.contains("Do")) {
				return "redirect:/";
			} else {
				return "redirect:" + fromUrl;
			}
		} else {
			request.setAttribute("msg", "연동된 계정이 없습니다. 기존 계정에 연동 후 로그인해 주세요.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}

	// 카카오 로그인 연동
	@RequestMapping(value = "/link/kakao/callback", method = RequestMethod.GET)
	public String linkCallbackKakao(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = oauthService.handleCallback(code, state, true, session, "Kakao");

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		loginUser.setUserProvider("Kakao");
		loginUser.setUserProviderId((String) userInfo.get("id"));

		userService.updateUserForSnsLink(loginUser);

		session.setAttribute("login", loginUser);

		request.setAttribute("msg", "해당 계정에 sns가 연동되었습니다.");
		request.setAttribute("url", "/myPageSnsLinkManageView");
		return "alert";
	}

	// 카카오 로그인
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
			if (fromUrl == null || fromUrl.isEmpty() || fromUrl.contains("/login") || fromUrl.contains("/callback") || fromUrl.contains("Do")) {
				return "redirect:/";
			} else {
				return "redirect:" + fromUrl;
			}
		} else {
			request.setAttribute("msg", "연동된 계정이 없습니다. 기존 계정에 연동 후 로그인해 주세요.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}

	// 구글 로그인 연동
	@RequestMapping(value = "/link/google/callback", method = RequestMethod.GET)
	public String linkCallbackGoogle(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = oauthService.handleCallback(code, state, true, session, "Google");

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		loginUser.setUserProvider("Google");
		loginUser.setUserProviderId((String) userInfo.get("id"));

		userService.updateUserForSnsLink(loginUser);

		session.setAttribute("login", loginUser);

		request.setAttribute("msg", "해당 계정에 sns가 연동되었습니다.");
		request.setAttribute("url", "/myPageSnsLinkManageView");
		return "alert";
	}

	// 구글 로그인
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
			if (fromUrl == null || fromUrl.isEmpty() || fromUrl.contains("/login") || fromUrl.contains("/callback") || fromUrl.contains("Do")) {
				return "redirect:/";
			} else {
				return "redirect:" + fromUrl;
			}
		} else {
			request.setAttribute("msg", "연동된 계정이 없습니다. 기존 계정에 연동 후 로그인해 주세요.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}
}