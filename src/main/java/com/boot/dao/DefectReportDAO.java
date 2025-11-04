package com.boot.dao;

import com.boot.dto.DefectReportDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface DefectReportDAO {
    void insertReport(DefectReportDTO report);
    List<DefectReportDTO> selectAll(@Param("offset") int offset, @Param("amount") int amount, @Param("keyword") String keyword);
    int count(@Param("keyword") String keyword);
    DefectReportDTO selectById(Long id);
    void updateReport(DefectReportDTO report);
    void deleteReport(Long id);
    String selectPasswordById(Long id);
}
