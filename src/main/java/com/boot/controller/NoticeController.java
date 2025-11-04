package com.boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boot.dto.NoticeDTO;
import com.boot.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
    // 목록 조회
	@GetMapping("/list")
	public String list(Model model) {
		List<NoticeDTO> noticeList = noticeService.list();
		model.addAttribute("noticeList", noticeList);
		return "notice/list";
	}
	
    // 상세 조회 (이전 단계에서 사용)
	@GetMapping("/view")
	public String contentView(@RequestParam Long noticeId, Model model) {
		NoticeDTO dto = noticeService.contentView(noticeId);
		model.addAttribute("noticeDto", dto);
		return "notice/view";
	}
	
	// 🚨 [추가] 등록 페이지 이동
	@GetMapping("/write")
	public String writeForm() {
		// 작성 폼만 보여줍니다.
		return "notice/write";
	}
	
	// 🚨 [추가] 등록 처리 (POST 요청)
	@PostMapping("/write")
	public String write(NoticeDTO dto, RedirectAttributes redirectAttributes) {
		// DTO에 title, content, writer, isUrgent가 바인딩됩니다.
		noticeService.write(dto);
		redirectAttributes.addFlashAttribute("msg", "공지사항이 등록되었습니다.");
		return "redirect:/notice/list";
	}
	
	// 🚨 [추가] 수정 페이지 이동 (기존 내용 불러오기)
	@GetMapping("/modify")
	public String modifyForm(@RequestParam Long noticeId, Model model) {
        // contentView를 재사용하여 조회수 증가는 피하고 싶다면, DAO를 직접 호출하는 별도의 메서드(getNotice)를 Service에 추가해야 합니다. 
        // 여기서는 편의상 조회수 증가를 감수하고 contentView를 사용합니다.
		NoticeDTO dto = noticeService.contentView(noticeId);
		model.addAttribute("noticeDto", dto);
		return "notice/modify";
	}
	
	// 🚨 [추가] 수정 처리 (POST 요청)
	@PostMapping("/modify")
	public String modify(NoticeDTO dto, RedirectAttributes redirectAttributes) {
        // DTO에 noticeId, title, content, writer, isUrgent가 바인딩됩니다.
		noticeService.modify(dto);
		redirectAttributes.addFlashAttribute("msg", dto.getNoticeId() + "번 공지사항이 수정되었습니다.");
		// 수정 후 상세 페이지로 이동
		return "redirect:/notice/view?noticeId=" + dto.getNoticeId(); 
	}
	
	// 🚨 [추가] 삭제 처리 (GET 또는 POST 요청, 여기서는 GET으로 간편 구현)
	@GetMapping("/delete")
	public String delete(@RequestParam Long noticeId, RedirectAttributes redirectAttributes) {
		noticeService.delete(noticeId);
		redirectAttributes.addFlashAttribute("msg", noticeId + "번 공지사항이 삭제되었습니다.");
		return "redirect:/notice/list";
	}
}
