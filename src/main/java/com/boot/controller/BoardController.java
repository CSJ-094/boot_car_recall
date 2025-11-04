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

        return "redirect:recallInfo";
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
        log.info("@# dto => " + dto);

        Criteria cri = new Criteria();

        return "content_view";
    }
}
