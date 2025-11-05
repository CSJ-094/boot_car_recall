package com.boot.controller;

import com.boot.dto.BoardDTO;
import com.boot.dto.Criteria;
import com.boot.dto.PageDTO;
import com.boot.service.BoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Controller
public class BoardController {
    @Autowired
    private BoardService service;

    @RequestMapping("/write")
    public String write(@RequestParam HashMap<String, String> param, Model model) {
        log.info("@# write()");
        log.info("@# param=>"+param);

        service.write(param);

        return "redirect:report_recallInfo";
    }

    @RequestMapping("/write_view")
    public String write_view() {
        log.info("@# write_view()");
        //
        return "report_write_view";
    }
    @RequestMapping("/report_content_view")
    public String content_view(@RequestParam("boardNo") int boardNo,
                               @RequestParam("pageNum") int pageNum,
                               @RequestParam("amount") int amount,
                               Model model) {

        log.info("@# report_content_view()");

        BoardDTO dto = service.contentView(boardNo);
        model.addAttribute("content_view", dto);
        log.info("@# dto => " + dto);

        model.addAttribute("pageNum", pageNum);
        model.addAttribute("amount", amount);
        log.info("@# pn => " + pageNum);
        log.info("@# am => " + amount);
//
        return "report_content_view";
    }

}
