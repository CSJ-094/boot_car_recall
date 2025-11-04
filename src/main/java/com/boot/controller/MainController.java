package com.boot.controller;

import com.boot.dto.Criteria;
import com.boot.dto.PageDTO;
import com.boot.dto.RecallDTO;
import com.boot.service.RecallService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final ResourceLoader resourceLoader;
    private final RecallService recallService;

    @GetMapping("/")
    public String main() {
        return "main";
    }

    @GetMapping("/recall-status")
    public String recallStatus(Criteria cri, Model model) {
        // 페이징된 데이터 조회
        List<RecallDTO> recallList = recallService.getAllRecalls(cri);
        model.addAttribute("recallList", recallList);

        // 전체 데이터 수 조회
        int total = recallService.getRecallCount();

        // 페이지 정보 생성 및 전달
        PageDTO pageDTO = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageDTO);

        if (total == 0) {
            model.addAttribute("errorMessage", "데이터베이스에 리콜 데이터가 없습니다. 먼저 데이터를 로드해주세요.");
        }
        return "recall_status";
    }

    @GetMapping("/load-data")
    public String loadData(Model model) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            Resource resource = resourceLoader.getResource("classpath:integrated_recall_data.json");
            InputStream inputStream = resource.getInputStream();
            List<RecallDTO> recallList = objectMapper.readValue(inputStream, new TypeReference<List<RecallDTO>>() {});

            recallService.saveRecallData(recallList);

            int count = recallService.getRecallCount();
            model.addAttribute("message", "성공적으로 " + count + "개의 리콜 데이터를 데이터베이스에 저장했습니다.");

        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "데이터 로드 및 저장 중 오류가 발생했습니다: " + e.getMessage());
        }
        return "load_result";
    }
}
