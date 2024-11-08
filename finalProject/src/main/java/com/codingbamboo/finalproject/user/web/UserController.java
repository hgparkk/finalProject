package com.codingbamboo.finalproject.user.web;

import java.security.SecureRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
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
				return "redirect:/";
			} else {
				return "redirect:/" + fromUrl;
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

	// 인증메일 전송
	@RequestMapping(value = "/authEmailSend", method = RequestMethod.POST)
	@ResponseBody
	public String sendEmail(String inputEmail, HttpSession session) {
		// 랜덤 코드 생성
		int length = 6; // 생성할 코드의 길이
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder code = new StringBuilder();
		SecureRandom random = new SecureRandom();

		for (int i = 0; i < length; i++) {
			int randomIndex = random.nextInt(characters.length());
			code.append(characters.charAt(randomIndex));
		}

		String emailCheckCode = code.toString(); // 생성된 랜덤 코드

		inputEmail = inputEmail.replace("&#64;", "@");

		HtmlEmail email = new HtmlEmail();
		email.setHostName("smtp.naver.com");
		email.setSmtpPort(465);
		email.setAuthenticator(new DefaultAuthenticator("phg2559@naver.com", "C21RC6DK6H7B"));
		email.setSSL(true);
		String msg = "<!DOCTYPE html>\r\n" + "<html lang=\"ko\">\r\n" + "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
				+ "    <title>이메일 인증</title>\r\n" + "</head>\r\n"
				+ "<body style=\"font-family: Arial, sans-serif; background-color: #f4f4f4; color: #333;\">\r\n"
				+ "    <div style=\"max-width: 600px; margin: 0 auto; padding: 20px; background-color: #ffffff; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center;\" class=\"container\">\r\n"
				+ "        <div style=\"margin-bottom: 20px;\">\r\n"
				+ "            <img style=\"width: 100px; margin-bottom: 1px; margin-left: auto; margin-right: auto; display: block;\" \r\n"
				+ "                src=\"https://firebasestorage.googleapis.com/v0/b/study-6b60a.appspot.com/o/bamboo.png?alt=media&token=43c75a02-e6cb-43bd-8fe9-c743ecb224be\" alt=\"Logo\">\r\n"
				+ "        </div>\r\n" + "        <h1 style=\"color: #4CAF50; margin-bottom: 10px;\">이메일 인증</h1>\r\n"
				+ "        <p style=\"font-size: 16px; margin-bottom: 10px;\">안녕하세요! 아래의 인증 코드를 입력하여 이메일 인증을 완료해 주세요.</p>\r\n"
				+ "        <div style=\"font-size: 24px; font-weight: bold; color: #4CAF50; padding: 10px; background-color: #f9f9f9; border: 1px solid #ddd; border-radius: 5px; width: 200px; margin: 0 auto; margin-bottom: 20px;\">\r\n"
				+ emailCheckCode + "\r\n" // 인증 코드 삽입
				+ "        </div>\r\n" + "        <p style=\"font-size: 16px; margin-bottom: 10px;\">감사합니다!</p>\r\n"
				+ "        <div style=\"padding-top: 20px; font-size: 12px; color: #aaa; margin-top: 10px;\" class=\"footer\">© 2024 CodingBamboo. All rights reserved.</div>\r\n"
				+ "    </div>\r\n" + "</body>\r\n" + "</html>";

		try {
			email.setFrom("phg2559@naver.com", "CodingBamboo");
			email.setSubject("인증메일");
			email.setCharset("UTF-8");
			email.setMsg(msg); // 이메일 내용에 인증 코드를 포함
			email.addTo(inputEmail, "");
			email.send();
			return emailCheckCode;
		} catch (EmailException e) {
			e.printStackTrace();
		}
		return "fail";
	}

	// 회원가입
	@RequestMapping(value = "/registDo", method = RequestMethod.POST)
	public String registDo(@Valid UserDTO user, BindingResult result, HttpServletRequest request, HttpSession session) {

		// 유효성 검증에서 오류가 발생한 경우
		if (result.hasErrors()) {
			StringBuilder errorMessage = new StringBuilder();
			for (ObjectError error : result.getAllErrors()) {
				errorMessage.append(error.getDefaultMessage()).append("\\n");
			}

			// 에러 메시지를 request에 추가
			request.setAttribute("msg", errorMessage.toString());
			request.setAttribute("url", "/registView");
			return "alert"; // alert 페이지로 이동

		}

		// 비밀번호 암호화
		String encodePw = passwordEncoder.encode(user.getUserPw());
		user.setUserPw(encodePw);

		// 사용자 등록
		userService.insertUser(user);

		// 회원가입 성공 메시지 설정
		request.setAttribute("msg", "회원가입이 완료되었습니다");
		request.setAttribute("url", "/loginView");

		// 세션에서 인증 코드 제거 (선택 사항)
		session.removeAttribute("emailCheckCode");

		return "alert";
	}

	// 아이디 찾기 창
	@RequestMapping(value = "/idFindView", method = RequestMethod.GET)
	public String idFindView() {
		return "user/idFindView";
	}

	// 아이디 찾기
	@RequestMapping(value = "/idFindDo", method = RequestMethod.POST)
	public String idFindDo(UserDTO user, HttpServletRequest request, Model model) {
		UserDTO idFind = userService.idFind(user);
		if (idFind == null) {
			request.setAttribute("msg", "일치하는 정보가 없습니다.");
			request.setAttribute("url", "/idFindView");
			return "alert";
		} else {
			model.addAttribute("findId", idFind.getUserId());
			return "user/idFindResultView";
		}
	}

	// 비밀번호 찾기 창
	@RequestMapping(value = "/pwFindView", method = RequestMethod.GET)
	public String pwFindView() {
		return "user/pwFindView";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/pwFindDo", method = RequestMethod.POST)
	public String pwFindDo() {
		return "redirect:/loginView";
	}
}