package com.boot.service;

import com.boot.dao.RecallDAO;
import com.boot.dto.Criteria;
import com.boot.dto.RecallDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RecallServiceImpl implements RecallService {

    private final RecallDAO recallDAO;

    @Override
    public void saveRecallData(List<RecallDTO> recallList) {
        for (RecallDTO recallDTO : recallList) {
            recallDAO.insertRecall(recallDTO);
        }
    }

    @Override
    public List<RecallDTO> getAllRecalls(Criteria cri) {
        return recallDAO.selectAll(cri.getOffset(), cri.getAmount(), cri.getKeyword());
    }

    @Override
    public int getRecallCount() {
        return recallDAO.count(null); 
    }

    @Override
    public int getRecallCount(Criteria cri) {
        return recallDAO.count(cri.getKeyword()); 
    }

    @Override
    public List<RecallDTO> searchRecallsByModelName(String modelName) {
        return recallDAO.searchByModelName(modelName);
    }
}
