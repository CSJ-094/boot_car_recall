package com.boot.dao;

import com.boot.dto.RecallDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RecallDAO {
    void insertRecall(RecallDTO recallDTO);
    // 페이징 및 검색 처리를 위해 offset, amount, keyword 파라미터 추가
    List<RecallDTO> selectAll(@Param("offset") int offset, @Param("amount") int amount, @Param("keyword") String keyword);
    // 검색 조건에 따른 전체 데이터 수 조회를 위해 keyword 파라미터 추가
    int count(@Param("keyword") String keyword);
}
