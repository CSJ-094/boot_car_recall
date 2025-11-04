package com.boot.util;

import com.boot.dto.RecallDTO;
import com.boot.service.RecallService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
//@Component // 스프링 빈으로 등록하지 않도록 주석 처리
@RequiredArgsConstructor
public class Init implements CommandLineRunner {
    private final CsvParser csvParser;
    private final RecallService recallService;

    @Override
    public void run(String... args) throws Exception {
        List<RecallDTO> recallList = csvParser.getRecallList();
        if(recallList.isEmpty()){
            log.info("csv파일 x");
            return;
        }
        // 아래 메소드는 존재하지 않으므로 주석 처리합니다.
        // recallService.insertRecallList(recallList);
        log.info("성공");
    }
}
