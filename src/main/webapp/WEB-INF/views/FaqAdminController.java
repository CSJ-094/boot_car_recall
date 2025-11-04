package com.boot.controller;

import com.boot.dto.Criteria;
import com.boot.dto.FaqDTO;
import com.boot.dto.PageDTO;
import com.boot.service.FaqService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
@RequestMapping("/admin/faq")
@RequiredArgsConstructor
@Slf4j
public class FaqAdminController {

    private final FaqService faqService;

    @GetMapping("/list")
    public String faqList(Criteria cri, Model model) {
        log.info("@# faq list");
        ArrayList<FaqDTO> list = faqService.getFaqList(cri);
        int total = faqService.getTotal();

        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "faq_list";
    }

    @GetMapping("/write")
    public String faqWriteView() {
        log.info("@# faq write view");
        return "faq_write";
    }

    @PostMapping("/write")
    public String faqWrite(@ModelAttribute FaqDTO faqDTO) {
        log.info("@# faq write process: {}", faqDTO);
        faqService.writeFaq(faqDTO);
        return "redirect:/admin/faq/list";
    }

    @GetMapping("/{faq_id}")
    public String faqDetail(@PathVariable("faq_id") long faq_id, Model model) {
        log.info("@# faq detail: {}", faq_id);
        FaqDTO faq = faqService.getFaq(faq_id);
        model.addAttribute("faq", faq);
        return "faq_detail";
    }

    @PostMapping("/modify/{faq_id}")
    public String faqModify(@ModelAttribute FaqDTO faqDTO) {
        log.info("@# faq modify process: {}", faqDTO);
        faqService.modifyFaq(faqDTO);
        return "redirect:/admin/faq/" + faqDTO.getFaq_id();
    }

    @PostMapping("/delete")
    public String faqDelete(@RequestParam("faq_id") long faq_id) {
        log.info("@# faq delete: {}", faq_id);
        faqService.deleteFaq(faq_id);
        return "redirect:/admin/faq/list";
    }
}