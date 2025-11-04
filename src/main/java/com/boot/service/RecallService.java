package com.boot.service;

import com.boot.dto.Criteria;
import com.boot.dto.RecallDTO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface RecallService {
    List<RecallDTO> getList(Criteria cri);
    void insertRecallList(List<RecallDTO> list);
    int getTotalCount(Criteria cri);
}
