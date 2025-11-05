package com.boot.util;

import com.boot.dao.RecallDAO;
import com.boot.dto.RecallDTO;
import com.boot.service.RecallService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Slf4j
// 스프링 빈으로 등록하여 애플리케이션 시작 시 자동으로 실행되도록 합니다. (두 번째 코드의 결정)
@Component
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

        // 데이터베이스 삽입 로직을 활성화합니다. (두 번째 코드의 결정)
        // 이 메서드가 RecallService에 존재한다고 가정합니다.
        recallService.insertRecallList(recallList);

        log.info("성공");
    }
}