package com.boot.dao;

import com.boot.dto.Criteria;
import com.boot.dto.RecallDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RecallDAO {
    void insertRecall(@Param("recall") RecallDTO recall);
    List<RecallDTO> selectAll(Criteria cri);
    int count(Criteria cri);
}
