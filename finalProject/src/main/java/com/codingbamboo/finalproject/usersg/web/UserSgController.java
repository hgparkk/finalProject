package com.codingbamboo.finalproject.usersg.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingbamboo.finalproject.attach.dto.AttachDTO;
import com.codingbamboo.finalproject.attach.service.AttachService;
import com.codingbamboo.finalproject.common.util.FileUploadUtils;
import com.codingbamboo.finalproject.suggestionattach.dto.SuggestionAttachDTO;
import com.codingbamboo.finalproject.suggestionattach.service.SuggestionAttachService;
import com.codingbamboo.finalproject.user.dto.UserDTO;
import com.codingbamboo.finalproject.usersg.dto.UserSgDTO;
import com.codingbamboo.finalproject.usersg.service.UserSgService;

@Controller
public class UserSgController {

	@Autowired
	private UserSgService userSgService;
	
	@Autowired
	private AttachService attachService;
	
	@Autowired
	private SuggestionAttachService suggestionAttachService;
	
	@Autowired
	private FileUploadUtils fileUploadUtils;
	
	/**
	 * 건의사항 등록 페이지
	 */
	@RequestMapping("/userSuggestionsView")
	public String noticeWriteView(HttpSession session, Model model) {
		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		if (loginUser == null) {
			return "redirect:/loginView";
		}

		return "user/userSuggestionsView";
	}
	
	/**
	 * 건의사항 등록 처리
	 */
	@RequestMapping(value = "/sgWriteDo", method = RequestMethod.POST)
	public String sgWriteDo(UserSgDTO sg, HttpSession session,
			RedirectAttributes redirectAttributes, MultipartFile[] boFile) {

		UserDTO loginUser = (UserDTO) session.getAttribute("login");

		if (loginUser == null || loginUser.getUserIsmaster() != 1) {
			redirectAttributes.addFlashAttribute("errorMsg", "권한이 없습니다.");
			return "redirect:/noticeView";
		}

		// 건의사항 DB 저장
		int isInserted = userSgService.registSg(sg);
		if (isInserted == 0) {
			redirectAttributes.addFlashAttribute("errorMsg", "건의사항 등록에 실패했습니다.");
			return "redirect:/sgWrite";
		}

		int sgNo = userSgService.getSgNo();
		// 파일첨부
		if (boFile != null && boFile.length > 0 && !boFile[0].isEmpty()) {
			try {
				List<AttachDTO> attachList = fileUploadUtils.getAttachListByMultiparts(boFile);
				for (int i = 0; i < attachList.size(); i++) {
					attachService.insertAttach(attachList.get(i));
					int attachNo = attachService.getAttachNo(attachList.get(i).getAttachName());
					SuggestionAttachDTO suggestionAttach = new SuggestionAttachDTO();
					suggestionAttach.setSgNo(sgNo);
					suggestionAttach.setAttachNo(attachNo);
					suggestionAttachService.insertSuggestionAttach(suggestionAttach);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		redirectAttributes.addFlashAttribute("successMsg", "건의사항이 등록되었습니다.");
		return "redirect:/myPageMySuggestionsView";
	}
}
