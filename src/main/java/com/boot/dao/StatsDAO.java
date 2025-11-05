package com.boot.dao;

import com.boot.dto.CarRecallDTO;
import com.boot.dto.DailyStatsDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface StatsDAO {
    public ArrayList<DailyStatsDTO> getDailyReportStats();
    public ArrayList<CarRecallDTO> getRecentReports();
}