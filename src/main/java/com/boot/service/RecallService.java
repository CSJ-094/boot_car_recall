package com.boot.service;

import com.boot.dto.Criteria;
import com.boot.dto.RecallDTO;

import java.util.List;

public interface RecallService {
    void saveRecallData(List<RecallDTO> recallList);
    List<RecallDTO> getAllRecalls(Criteria cri);
    int getRecallCount();
}
