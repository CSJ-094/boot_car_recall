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
        // 데이터베이스에 리콜 데이터가 이미 존재하는지 확인
        int recallCount = recallService.countAllRecalls();

        if (recallCount == 0) {
            List<RecallDTO> recallList = csvParser.getRecallList();

            if(recallList.isEmpty()){
                log.info("CSV 파일에서 읽을 데이터가 없습니다.");
                return;
            }

            // 데이터베이스 삽입 로직을 활성화합니다.
            recallService.insertRecallList(recallList);
            log.info("CSV 데이터가 성공적으로 데이터베이스에 삽입되었습니다.");
        } else {
            log.info("리콜 데이터가 이미 데이터베이스에 존재합니다. 삽입을 건너뜀.");
        }

        log.info("Init 작업 완료.");
    }
}