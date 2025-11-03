package com.boot.dao;

import com.boot.dto.RecallDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecallDAO {
    void insertRecallList(List<RecallDTO> list);
    List<RecallDTO> selectAll();
    int count();
}
