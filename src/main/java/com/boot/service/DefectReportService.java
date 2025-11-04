package com.boot.service;

import com.boot.dto.Criteria;
import com.boot.dto.DefectReportDTO;

import java.util.List;

public interface DefectReportService {
    void saveReport(DefectReportDTO report);
    List<DefectReportDTO> getAllReports(Criteria cri);
    int getTotalCount();
    DefectReportDTO getReportById(Long id);
    void updateReport(DefectReportDTO report);
    void deleteReport(Long id);
}
