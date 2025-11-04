package com.boot.service;

import com.boot.dto.Criteria;
import com.boot.dto.RecallDTO;

import java.util.List;

public interface RecallService {
    void saveRecallData(List<RecallDTO> recallList);
    List<RecallDTO> getAllRecalls(Criteria cri);
    int getRecallCount(); // 기존 전체 카운트
    int getRecallCount(Criteria cri); // 검색 조건에 따른 카운트
}
