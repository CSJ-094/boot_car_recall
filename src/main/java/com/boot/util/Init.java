package com.boot.util;

import com.boot.dao.RecallDAO;
import com.boot.dto.RecallDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class Init implements CommandLineRunner {
    private final CsvParser csvParser;
    private final RecallDAO recallDAO;
    @Override
    public void run(String... args) throws Exception {
        if(recallDAO.count()>0){
            log.info("db에 데이터가 존재");
            return;
        }
        List<RecallDTO> recallList = csvParser.getRecallList();
        if(recallList.isEmpty()){
            log.info("csv파일 x");
            return;
        }
        recallDAO.insertRecallList(recallList);
        log.info("성공");
    }
}
