package com.boot.service;

import com.boot.dto.CarRecallDTO;

public interface CarRecallService {
    public CarRecallDTO getReportById(long report_id);
    public void updateReviewStatus(long report_id, boolean reviewed);
}