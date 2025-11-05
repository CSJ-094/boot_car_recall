package com.boot.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Slf4j
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Object admin = session.getAttribute("admin");

        // 세션에 'admin' 정보가 없으면 로그인 페이지로 리디렉션
        if (admin == null) {
            log.info("비로그인 사용자가 관리자 페이지 접근 시도: {}", request.getRequestURI());
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return false; // 컨트롤러 실행 중단
        }

        // 로그인된 사용자면 요청 계속 진행
        return true;
    }
}