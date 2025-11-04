package com.boot.controller;

import com.boot.dto.AdminDTO;
import com.boot.service.AdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService service;

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

    @GetMapping("/main")
    public String adminMain() {
        log.info("@# Admin main page");
        return "admin_main";
    }
}
