package com.boot.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.boot.dto.FaqDTO;
import com.boot.service.FaqService;

@Controller
@RequestMapping("/faq")
public class FaqController {
	@Autowired
    private FaqService faqService;

    @GetMapping("/list")
    public String list(Model model) {
        ArrayList<FaqDTO> faqList = faqService.list();
        model.addAttribute("faqList", faqList);
        return "faq/list"; 
    }
    
    @GetMapping("/write_view")
    public String writeView() {
        return "faq/write";
    }
    
    @PostMapping("/write")
    public String write(HttpServletRequest request) {
        HashMap<String, String> param = new HashMap<>();
        param.put("faqTitle", request.getParameter("faqTitle"));
        param.put("faqContent", request.getParameter("faqContent"));
        param.put("faqCategory", request.getParameter("faqCategory"));
        
        faqService.write(param);
        return "redirect:list";
    }
    
    @GetMapping("/content_view")
    public String contentView(HttpServletRequest request, Model model) {
        HashMap<String, String> param = new HashMap<>();
        param.put("faqNo", request.getParameter("faqNo"));
        FaqDTO dto = faqService.contentView(param);

        model.addAttribute("faqDto", dto); 
        return "faq/list"; 
    }
    
    @GetMapping("/modify_view")
    public String modifyView(@RequestParam("faqNo") String faqNo, Model model) {
        HashMap<String, String> param = new HashMap<>();
        param.put("faqNo", faqNo);
        FaqDTO dto = faqService.contentView(param);
        model.addAttribute("faqDto", dto);
        return "faq/modify";
    }

    @PostMapping("/modify")
    public String modify(HttpServletRequest request) {
        HashMap<String, String> param = new HashMap<>();
        param.put("faqNo", request.getParameter("faqNo"));
        param.put("faqTitle", request.getParameter("faqTitle"));
        param.put("faqContent", request.getParameter("faqContent"));
        param.put("faqCategory", request.getParameter("faqCategory"));
        
        faqService.modify(param);
        return "redirect:list";
    }
    
    @GetMapping("/delete")
    public String delete(@RequestParam("faqNo") String faqNo) {
        HashMap<String, String> param = new HashMap<>();
        param.put("faqNo", faqNo);
        faqService.delete(param);
        return "redirect:list";
    }
}
