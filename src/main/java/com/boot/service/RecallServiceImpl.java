package com.boot.service;

import com.boot.dao.RecallDAO;
import com.boot.dto.Criteria;
import com.boot.dto.RecallDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RecallServiceImpl implements RecallService {
    private final RecallDAO recallDAO;
    @Override
    public List<RecallDTO> getList(Criteria cri) {
        return recallDAO.selectAll(cri);
    }


    @Override
    @Transactional
    public void insertRecallList(List<RecallDTO> list) {
        for (RecallDTO dto : list) {
            recallDAO.insertRecall(dto);
        }
    }

    @Override
    public int getTotalCount(Criteria cri) {
        return recallDAO.count(cri);
    }
}
