package com.boot.controller;

import com.boot.dto.AdminDTO;
import com.boot.dto.Criteria;
import com.boot.dto.NoticeDTO;
import com.boot.dto.PageDTO;
import com.boot.service.NoticeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
@RequestMapping("/admin/notice")
@RequiredArgsConstructor
@Slf4j
public class NoticeAdminController {

    private final NoticeService noticeService;

    @GetMapping("/list")
    public String noticeList(Criteria cri, Model model) {
        log.info("@# notice list");
        ArrayList<NoticeDTO> list = noticeService.getNoticeList(cri);
        int total = noticeService.getTotal();

        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "notice_list";
    }

    @GetMapping("/write")
    public String noticeWriteView() {
        log.info("@# notice write view");
        return "notice_write";
    }

    @PostMapping("/write")
    public String noticeWrite(@ModelAttribute NoticeDTO noticeDTO, HttpSession session) {
        log.info("@# notice write process: {}", noticeDTO);
        noticeService.writeNotice(noticeDTO);
        return "redirect:/admin/notice/list";
    }

    @GetMapping("/{notice_id}")
    public String noticeDetail(@PathVariable("notice_id") long notice_id, Model model) {
        log.info("@# notice detail: {}", notice_id);
        NoticeDTO notice = noticeService.getNotice(notice_id);
        model.addAttribute("notice", notice);
        return "notice_detail";
    }

    @GetMapping("/modify/{notice_id}")
    public String noticeModifyView(@PathVariable("notice_id") long notice_id, Model model) {
        log.info("@# notice modify view: {}", notice_id);
        // 조회수 증가 없이 데이터만 가져오기 위해 DAO 직접 호출
        NoticeDTO notice = noticeService.getNotice(notice_id);
        model.addAttribute("notice", notice);
        return "notice_modify";
    }

    @PostMapping("/modify")
    public String noticeModify(@ModelAttribute NoticeDTO noticeDTO) {
        log.info("@# notice modify process: {}", noticeDTO);
        noticeService.modifyNotice(noticeDTO);
        return "redirect:/admin/notice/" + noticeDTO.getNotice_id();
    }

    @PostMapping("/delete")
    public String noticeDelete(@RequestParam("notice_id") long notice_id) {
        log.info("@# notice delete: {}", notice_id);
        noticeService.deleteNotice(notice_id);
        return "redirect:/admin/notice/list";
    }
}