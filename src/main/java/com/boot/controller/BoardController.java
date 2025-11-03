package com.boot.controller;

import com.boot.dto.BoardAttachDTO;
import com.boot.dto.BoardDTO;
import com.boot.dto.MemDTO;
import com.boot.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@Slf4j
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	//게시판 목록 조회
	@RequestMapping("/list_old")
//	public String list(Model model) {
	public String list(Model model, HttpServletRequest request) {
		log.info("@# list()");
		
		HttpSession session = request.getSession();
		MemDTO mDto = (MemDTO) session.getAttribute("LOGIN_MEMBER");
		log.info("@# mDto=>"+mDto);
		
//		세션 정보가 없으면 로그인 화면으로 이동
		if (mDto == null) {
			return "redirect:login";
		}
		
		ArrayList<BoardDTO> list = service.list();
		model.addAttribute("list", list);
		
		return "list";
	}
	
	@RequestMapping("/write")
	public String write(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# write()");
		log.info("@# param=>"+param);
		
		service.write(param);
		
		return "redirect:list";
	}
	
	@RequestMapping("/write_view")
	public String write_view() {
		log.info("@# write_view()");
		
		return "write_view";
	}
	
	@RequestMapping("/content_view")
	public String content_view(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# content_view()");
		
		BoardDTO dto = service.contentView(param);
		model.addAttribute("content_view", dto);

		
		//content_view jsp에서 pageMaker를 가지고 페이징 처리
		model.addAttribute("pageMaker", param);
		
		
		return "content_view";
	}
	
	@RequestMapping("/modify")
//	public String modify(@RequestParam HashMap<String, String> param, Model model) {
	public String modify(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		log.info("@# modify()");

		log.info("@# param =>" + param);
		service.modify(param);
		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));
		return "redirect:list";

	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
		log.info("@# delete()");
		log.info("@# boardNo=>"+param.get("boardNo"));


		//게시글 삭제
		service.delete(param);


		rttr.addAttribute("pageNum", param.get("pageNum"));
		rttr.addAttribute("amount", param.get("amount"));

		//테이블 삭제

		return "redirect:list";
	}
}









