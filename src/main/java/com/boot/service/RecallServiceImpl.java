package com.boot.service;

import com.boot.dao.RecallDAO;
import com.boot.dto.RecallDTO;

import java.util.List;

public class RecallServiceImpl implements RecallService {
    private RecallDAO recallDAO;
    @Override
    public List<RecallDTO> getList() {
        return recallDAO.selectAll();
    }
}
