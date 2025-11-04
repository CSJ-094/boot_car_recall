package com.boot.service;

import com.boot.dao.DefectReportDAO;
import com.boot.dto.Criteria;
import com.boot.dto.DefectReportDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DefectReportServiceImpl implements DefectReportService {

    private final DefectReportDAO defectReportDAO;

    @Override
    public void saveReport(DefectReportDTO report) {
        defectReportDAO.insertReport(report);
    }

    @Override
    public List<DefectReportDTO> getAllReports(Criteria cri) {
        return defectReportDAO.selectAll(cri.getOffset(), cri.getAmount());
    }

    @Override
    public int getTotalCount() {
        return defectReportDAO.count();
    }
}
