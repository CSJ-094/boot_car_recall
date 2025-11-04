package com.boot.dao;

import com.boot.dto.RecallDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RecallDAO {
    void insertRecall(RecallDTO recallDTO);
    List<RecallDTO> selectAll(@Param("offset") int offset, @Param("amount") int amount, @Param("keyword") String keyword);
    int count(@Param("keyword") String keyword);
    List<RecallDTO> searchByModelName(@Param("modelName") String modelName);
}
