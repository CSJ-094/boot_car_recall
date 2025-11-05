package com.boot.service;

import com.boot.dto.RecallDTO;
import org.springframework.stereotype.Service;

import java.util.List;


public interface RecallService {
    List<RecallDTO> getList();
    void insertRecallList(List<RecallDTO> list);
}
