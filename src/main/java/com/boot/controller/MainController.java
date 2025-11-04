package com.boot.controller;

import com.boot.dto.Criteria;
import com.boot.dto.DefectReportDTO;
import com.boot.dto.PageDTO;
import com.boot.dto.RecallDTO;
import com.boot.service.DefectReportService;
import com.boot.service.RecallService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    private final ResourceLoader resourceLoader;
    private final RecallService recallService;
    private final DefectReportService defectReportService;

    @GetMapping("/")
    public String main() {
        return "main";
    }

    @GetMapping("/recall-status")
    public String recallStatus(Criteria cri, Model model) {
        List<RecallDTO> recallList = recallService.getAllRecalls(cri);
        model.addAttribute("recallList", recallList);

        int total = recallService.getRecallCount(cri); 

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

    @GetMapping("/defect-report")
    public String defectReportForm() {
        return "defect_report";
    }

    @PostMapping("/defect-report")
    public String defectReportSubmit(DefectReportDTO report, Model model) {
        try {
            defectReportService.saveReport(report);
            model.addAttribute("message", "결함 신고가 성공적으로 접수되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "오류가 발생하여 신고가 접수되지 않았습니다: " + e.getMessage());
        }
        return "report_result";
    }

    @GetMapping("/defect-report-list")
    public String defectReportList(Criteria cri, Model model) {
        List<DefectReportDTO> reportList = defectReportService.getAllReports(cri);
        model.addAttribute("reportList", reportList);

        int total = defectReportService.getTotalCount();
        PageDTO pageDTO = new PageDTO(cri, total);
        model.addAttribute("pageMaker", pageDTO);

        return "defect_report_list";
    }

    @GetMapping("/defect-report-detail")
    public String defectReportDetail(@RequestParam("id") Long id, Model model) {
        DefectReportDTO report = defectReportService.getReportById(id);
        model.addAttribute("report", report);
        return "defect_report_detail";
    }

    // 결함 신고 수정 폼 요청
    @GetMapping("/defect-report-edit")
    public String defectReportEditForm(@RequestParam("id") Long id, Model model) {
        DefectReportDTO report = defectReportService.getReportById(id);
        model.addAttribute("report", report);
        return "defect_report_edit";
    }

    // 결함 신고 수정 처리
    @PostMapping("/defect-report-edit")
    public String defectReportEditSubmit(DefectReportDTO report, RedirectAttributes rttr) {
        try {
            defectReportService.updateReport(report);
            rttr.addFlashAttribute("message", "결함 신고가 성공적으로 수정되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("message", "오류가 발생하여 신고 수정에 실패했습니다: " + e.getMessage());
        }
        return "redirect:/defect-report-detail?id=" + report.getId();
    }

    // 결함 신고 삭제 처리
    @PostMapping("/defect-report-delete")
    public String defectReportDelete(@RequestParam("id") Long id, RedirectAttributes rttr) {
        try {
            defectReportService.deleteReport(id);
            rttr.addFlashAttribute("message", "결함 신고가 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("message", "오류가 발생하여 신고 삭제에 실패했습니다: " + e.getMessage());
        }
        return "redirect:/defect-report-list";
    }
}
