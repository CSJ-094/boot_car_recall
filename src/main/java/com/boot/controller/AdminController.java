package com.boot.controller;

import com.boot.dto.AdminDTO;
import com.boot.dto.BoardDTO;
import com.boot.dto.Criteria;
import com.boot.dto.DailyStatsDTO;
import com.boot.dto.DefectReportDTO;
import com.boot.dto.FaqDTO;
import com.boot.dto.NoticeDTO;
import com.boot.dto.PageDTO;
import com.boot.service.AdminService;
import com.boot.service.BoardService;
import com.boot.service.DefectReportService;
import com.boot.service.StatsService;
import com.boot.service.FaqService;
import com.boot.service.NoticeService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService service;

    @Autowired
    private StatsService statsService;

    @Autowired
    private DefectReportService defectReportService;

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private FaqService faqService;

    @Autowired
    private BoardService boardService;

    @GetMapping("/login")
    public String loginForm() {
        log.info("@# Admin login form");
        return "admin/login";
    }

    @PostMapping("/login")
    public String loginProcess(@RequestParam HashMap<String, String> param, HttpServletRequest request, RedirectAttributes rttr) {
        log.info("@# Admin login process");
        AdminDTO admin = service.login(param);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            return "redirect:/admin/main"; // 로그인 성공 시 관리자 메인 페이지로 이동
        } else {
            rttr.addFlashAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/admin/login"; // 로그인 실패 시 다시 로그인 폼으로
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        log.info("@# Admin logout");
        HttpSession session = request.getSession(false); // 세션이 없으면 새로 생성하지 않음
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }
        return "redirect:/"; // 로그아웃 후 사이트 메인 페이지로 리다이렉트
    }

    @GetMapping("/main")
    public String adminMain(Model model) {
        log.info("@# Admin main page");
        ArrayList<DailyStatsDTO> dailyStats = statsService.getDailyReportStats();
        // StatsService에서 DefectReportDTO를 반환하도록 수정되었다고 가정합니다.
        ArrayList<DefectReportDTO> recentReports = statsService.getRecentReports();
        model.addAttribute("dailyStats", dailyStats);
        model.addAttribute("recentReports", recentReports);
        return "admin/main";
    }

    // 결함 신고 상세 페이지
    @GetMapping("/defect_report/{id}")
    public String defectReportDetail(@PathVariable("id") Long id, Model model) {
        log.info("@# Get defect report detail: {}", id);
        DefectReportDTO report = defectReportService.getReportById(id);
        model.addAttribute("report", report);
        return "admin/defect_report_detail"; // 상세 페이지 뷰
    }

    // 공지사항 목록
    @GetMapping("/notice/list")
    public String noticeList(Criteria cri, Model model) {
        log.info("@# noticeList");
        List<NoticeDTO> list = noticeService.listWithPaging(cri);
        int total = noticeService.getTotalCount();

        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "admin/notice_list";
    }

    // 공지사항 상세
    @GetMapping("/notice/detail")
    public String noticeDetail(@RequestParam("notice_id") Long notice_id, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("@# noticeDetail, notice_id: {}", notice_id);
        NoticeDTO notice = noticeService.getNotice(notice_id);
        model.addAttribute("notice", notice);
        return "admin/notice_detail";
    }

    // 공지사항 작성 폼
    @GetMapping("/notice/write")
    public String noticeWriteForm() {
        log.info("@# noticeWriteForm");
        return "admin/notice_write";
    }

    // 공지사항 작성 처리
    @PostMapping("/notice/write")
    public String noticeWrite(NoticeDTO notice, RedirectAttributes rttr) {
        log.info("@# noticeWrite, notice: {}", notice);
        noticeService.write(notice);
        rttr.addFlashAttribute("result", "write_success");
        return "redirect:/admin/notice/list";
    }

    // 공지사항 수정 폼
    @GetMapping("/notice/modify")
    public String noticeModifyForm(@RequestParam("notice_id") Long notice_id, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("@# noticeModifyForm, notice_id: {}", notice_id);
        NoticeDTO notice = noticeService.getNoticeWithoutViews(notice_id); // 조회수 증가 없이 데이터 가져오기
        model.addAttribute("notice", notice);
        return "admin/notice_modify";
    }

    // 공지사항 수정 처리
    @PostMapping("/notice/modify")
    public String noticeModify(NoticeDTO notice, Criteria cri, RedirectAttributes rttr) {
        log.info("@# noticeModify, notice: {}", notice);
        noticeService.modify(notice);
        rttr.addFlashAttribute("result", "modify_success");
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        return "redirect:/admin/notice/list";
    }

    // 공지사항 삭제 처리
    @PostMapping("/notice/delete")
    public String noticeDelete(@RequestParam("notice_id") Long notice_id, Criteria cri, RedirectAttributes rttr) {
        log.info("@# noticeDelete, notice_id: {}", notice_id);
        noticeService.delete(notice_id);
        rttr.addFlashAttribute("result", "delete_success");
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        return "redirect:/admin/notice/list";
    }

    // FAQ 목록
    @GetMapping("/faq/list")
    public String faqList(Criteria cri, Model model) {
        log.info("@# faq list");
        ArrayList<FaqDTO> list = faqService.getFaqList(cri);
        int total = faqService.getTotal();

        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "admin/faq_list";
    }

    // FAQ 상세
    @GetMapping("/faq/detail")
    public String faqDetail(@RequestParam("faq_id") long faq_id, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("@# faq detail: {}", faq_id);
        FaqDTO faq = faqService.getFaq(faq_id);
        model.addAttribute("faq", faq);
        return "admin/faq_detail";
    }

    // FAQ 작성 폼
    @GetMapping("/faq/write")
    public String faqWriteForm() {
        log.info("@# faq write view");
        return "admin/faq_write";
    }

    // FAQ 작성 처리
    @PostMapping("/faq/write")
    public String faqWrite(FaqDTO faqDTO, RedirectAttributes rttr) {
        log.info("@# faq write process: {}", faqDTO);
        faqService.writeFaq(faqDTO);
        rttr.addFlashAttribute("result", "write_success");
        return "redirect:/admin/faq/list";
    }

    // FAQ 상세 및 수정 폼
    @GetMapping("/faq/modify")
    public String faqModifyForm(@RequestParam("faq_id") long faq_id, Model model) {
        log.info("@# faq detail/modify: {}", faq_id);
        FaqDTO faq = faqService.getFaq(faq_id);
        model.addAttribute("faq", faq);
        return "admin/faq_modify";
    }

    // FAQ 수정 처리
    @PostMapping("/faq/modify")
    public String faqModify(FaqDTO faqDTO, RedirectAttributes rttr) {
        log.info("@# faq modify process: {}", faqDTO);
        faqService.modifyFaq(faqDTO);
        rttr.addFlashAttribute("result", "modify_success");
        return "redirect:/admin/faq/list";
    }

    // FAQ 삭제 처리
    @PostMapping("/faq/delete")
    public String faqDelete(@RequestParam("faq_id") long faq_id, RedirectAttributes rttr) {
        log.info("@# faq delete: {}", faq_id);
        faqService.deleteFaq(faq_id);
        rttr.addFlashAttribute("result", "delete_success");
        return "redirect:/admin/faq/list";
    }

    // 보도자료 목록
    @GetMapping("/press/list")
    public String pressList(Criteria cri, Model model) {
        log.info("@# press list");
        ArrayList<BoardDTO> list = boardService.listWithPaging(cri);
        int total = boardService.getTotalCount(cri);

        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "admin/press_list";
    }

    // 보도자료 상세
    @GetMapping("/press/detail")
    public String pressDetail(@RequestParam("boardNo") int boardNo, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("@# press detail, boardNo: {}", boardNo);
        BoardDTO board = boardService.contentView(boardNo);
        model.addAttribute("board", board);
        return "admin/press_detail";
    }

    // 보도자료 작성 폼
    @GetMapping("/press/write")
    public String pressWriteForm() {
        log.info("@# press write view");
        return "admin/press_write";
    }

    // 보도자료 작성 처리
    @PostMapping("/press/write")
    public String pressWrite(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
        log.info("@# press write process: {}", param);
        boardService.write(param);
        rttr.addFlashAttribute("result", "write_success");
        return "redirect:/admin/press/list";
    }

    // 보도자료 수정 폼
    @GetMapping("/press/modify")
    public String pressModifyForm(@RequestParam("boardNo") int boardNo, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("@# press modify view, boardNo: {}", boardNo);
        BoardDTO board = boardService.contentView(boardNo);
        model.addAttribute("board", board);
        return "admin/press_modify";
    }

    // 보도자료 수정 처리
    @PostMapping("/press/modify")
    public String pressModify(@RequestParam HashMap<String, String> param, Criteria cri, RedirectAttributes rttr) {
        log.info("@# press modify process: {}", param);
        boardService.modify(param);
        rttr.addFlashAttribute("result", "modify_success");
        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        return "redirect:/admin/press/list";
    }

    // 보도자료 삭제 처리
    @PostMapping("/press/delete")
    public String pressDelete(@RequestParam HashMap<String, String> param, RedirectAttributes rttr) {
        log.info("@# press delete: {}", param);
        boardService.delete(param);
        rttr.addFlashAttribute("result", "delete_success");
        return "redirect:/admin/press/list";
    }
}
