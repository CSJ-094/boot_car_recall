package com.boot.service;

import com.boot.dto.CarRecallDTO;
import com.boot.dto.DailyStatsDTO;
import java.util.ArrayList;

public interface StatsService {
    public ArrayList<DailyStatsDTO> getDailyReportStats();
    public ArrayList<CarRecallDTO> getRecentReports();
}