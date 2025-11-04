package com.boot.controller;

import com.boot.dto.RecallDTO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private ResourceLoader resourceLoader;

    @GetMapping("/")
    public String main() {
        return "main";
    }

    @GetMapping("/recall-status")
    public String recallStatus(Model model) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            Resource resource = resourceLoader.getResource("classpath:integrated_recall_data.json");
            InputStream inputStream = resource.getInputStream();
            List<RecallDTO> recallList = objectMapper.readValue(inputStream, new TypeReference<List<RecallDTO>>() {});
            model.addAttribute("recallList", recallList);
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("recallList", List.of());
            model.addAttribute("errorMessage", "리콜 데이터를 불러오는 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "recall_status";
    }
}
