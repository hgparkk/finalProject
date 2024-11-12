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

	// �ݹ� ó�� �Լ� (���� ������ ���̹� ���̵� ����)
	@RequestMapping(value = "/link/naver/callback", method = RequestMethod.GET)
	public String linkCallbackNaver(@RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> userInfo = naverService.handleCallback(code, state, session);

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		loginUser.setUserProvider("Naver");
		loginUser.setUserProviderId((String) userInfo.get("id"));

		userService.updateUserForSnsLink(loginUser);

		session.setAttribute("login", loginUser);

		request.setAttribute("msg", "�ش� ������ �Ҽ� ������ �����Ǿ����ϴ�.");
		request.setAttribute("url", "/myPageSnsLinkManageView");
		return "alert";
	}

	// �ݹ� ó�� �Լ� (�α����� ���̹� ���̵�� �����Ǿ��ִ� ���� ã��)
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
			request.setAttribute("msg", "������ ������ �����ϴ�. �α��� �� �Ҽ� ������ �����ؼ� ������ּ���.");
			request.setAttribute("url", "/loginView");
			return "alert";
		}
	}
}