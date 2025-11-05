package com.boot.controller;

import com.boot.dto.BoardDTO;
import com.boot.dto.Criteria;
import com.boot.dto.PageDTO;
import com.boot.service.PageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
@Slf4j
public class pageController {
    @Autowired
    private PageService service;

    @RequestMapping("/recallInfo")
    public String recallInfo(Criteria cri, Model model) {
        log.info("@# recallInfo()");
        log.info("@# cri => " + cri);

        ArrayList<BoardDTO> list = service.listWithPaging(cri);
        int total = service.getTotalCount(cri);
        log.info("@# total => " + total);

        model.addAttribute("list", list);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "recallInfo";
    }
}
