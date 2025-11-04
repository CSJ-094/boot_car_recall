package com.boot.dao;

import com.boot.dto.RecallDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RecallDAO {
    void insertRecall(RecallDTO recallDTO);
    // 페이징 처리를 위해 offset과 amount 파라미터 추가
    List<RecallDTO> selectAll(@Param("offset") int offset, @Param("amount") int amount);
    int count();
}
