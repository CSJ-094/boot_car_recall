package com.boot.service;

import com.boot.dto.CarRecallDTO;
import com.boot.dao.StatsDAO;
import com.boot.dto.DailyStatsDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
@Slf4j
public class StatsServiceImpl implements StatsService {
    private final StatsDAO statsDAO;

    @Override
    public ArrayList<DailyStatsDTO> getDailyReportStats() {
        return statsDAO.getDailyReportStats();
    }

    @Override
    public ArrayList<CarRecallDTO> getRecentReports() {
        return statsDAO.getRecentReports();
    }
}