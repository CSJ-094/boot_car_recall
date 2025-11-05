package com.boot.service;

import com.boot.dto.RecallDTO;

import java.util.List;


public interface RecallService {
    List<RecallDTO> getList();
    void insertRecallList(List<RecallDTO> list);
}
