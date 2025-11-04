package com.boot.dao;

import com.boot.dto.CarRecallDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CarRecallDAO {
    public CarRecallDTO findById(@Param("report_id") long report_id);
    public void updateReviewStatus(@Param("report_id") long report_id, @Param("reviewed") boolean reviewed);
}