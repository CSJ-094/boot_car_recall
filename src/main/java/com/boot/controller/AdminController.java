package com.boot.controller;

import com.boot.dto.AdminDTO;
import com.boot.dto.CarRecallDTO;
import com.boot.dto.DailyStatsDTO;
import com.boot.service.CarRecallService;
import com.boot.service.AdminService;
import com.boot.service.StatsService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
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
    private CarRecallService carRecallService;

    @GetMapping("/login")
    public String loginForm() {
        log.info("@# Admin login form");
        return "admin_login";
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
        return "redirect:/admin/login"; // 로그인 페이지로 리디렉션
    }

    @GetMapping("/main")
    public String adminMain(Model model) {
        log.info("@# Admin main page");
        ArrayList<DailyStatsDTO> dailyStats = statsService.getDailyReportStats();
        ArrayList<CarRecallDTO> recentReports = statsService.getRecentReports();
        model.addAttribute("dailyStats", dailyStats);
        model.addAttribute("recentReports", recentReports);
        return "admin_main";
    }

    @GetMapping("/report/{report_id}")
    public String reportDetail(@PathVariable("report_id") long report_id, Model model) {
        log.info("@# Get report detail: {}", report_id);
        CarRecallDTO report = carRecallService.getReportById(report_id);
        model.addAttribute("report", report);
        return "admin_report_detail";
    }

    @PostMapping("/report/updateStatus")
    public String updateReviewStatus(@RequestParam("report_id") long report_id,
                                     @RequestParam("reviewed") boolean reviewed) {
        log.info("@# Update review status for report_id: {}, to: {}", report_id, reviewed);
        carRecallService.updateReviewStatus(report_id, reviewed);
        return "redirect:/admin/report/" + report_id;
    }
}
