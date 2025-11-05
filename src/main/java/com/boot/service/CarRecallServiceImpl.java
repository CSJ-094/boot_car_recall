package com.boot.service;

import com.boot.dao.CarRecallDAO;
import com.boot.dto.CarRecallDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CarRecallServiceImpl implements CarRecallService {

    private final CarRecallDAO carRecallDAO;

    @Override
    public CarRecallDTO getReportById(long report_id) {
        return carRecallDAO.findById(report_id);
    }

    @Override
    public void updateReviewStatus(long report_id, boolean reviewed) {
        carRecallDAO.updateReviewStatus(report_id, reviewed);
    }
}