package com.boot.service;

import com.boot.dao.RecallDAO;
import com.boot.dto.Criteria;
import com.boot.dto.RecallDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional; // 트랜잭션 관리를 위해 추가

import java.util.List;

@Service
@RequiredArgsConstructor
public class RecallServiceImpl implements RecallService {

    private final RecallDAO recallDAO;

    // -------------------------------------------------------------------
    // 1. 데이터 로드/저장 기능 (MainController에서 JSON 로드 후 호출)
    // -------------------------------------------------------------------
    @Override
    @Transactional // 대량의 데이터를 삽입하므로 트랜잭션을 적용합니다.
    public void saveRecallData(List<RecallDTO> recallList) {
        // 이 메서드는 외부 리스트를 받아 저장하는 역할입니다.
        // DAO의 insertRecallList를 호출하여 효율적인 배치를 사용하도록 로직을 변경합니다.
        // 첫 번째 코드의 for-loop 방식 대신 배치 삽입을 사용합니다.
        this.insertRecallList(recallList);
    }

    // -------------------------------------------------------------------
    // 2. 리스트 배치 삽입 (Init.java의 컴파일 오류 해결 및 효율적인 삽입)
    // -------------------------------------------------------------------
    @Override
    @Transactional // 트랜잭션을 명확히 적용합니다. (두 번째 코드의 결정)
    public void insertRecallList(List<RecallDTO> recallList) {
        // DAO의 배치 삽입 메서드(insertRecallList)를 호출합니다.
        // (RecallDAO XML에서 <foreach>로 구현된 쿼리를 사용한다고 가정)
        recallDAO.insertRecallList(recallList);

        // 참고: 두 번째 코드에서는 for-loop를 사용했지만,
        // 이미 recall.xml에 배치 쿼리를 구현했으므로, DAO 메서드를 직접 호출하는 것이 효율적입니다.
    }

    // -------------------------------------------------------------------
    // 3. 전체 목록 조회 (페이징 및 검색 기준 적용)
    // -------------------------------------------------------------------
    @Override
    public List<RecallDTO> getAllRecalls(Criteria cri) {
        // Criteria를 통해 offset, amount, keyword를 DAO에 전달
        return recallDAO.selectAll(cri.getOffset(), cri.getAmount(), cri.getKeyword());
    }

    // -------------------------------------------------------------------
    // 4. 전체 데이터 수 조회 (검색 기능 포함)
    // -------------------------------------------------------------------
    @Override
    public int getRecallCount(Criteria cri) {
        // Criteria에서 keyword를 추출하여 DAO에 전달
        return recallDAO.count(cri.getKeyword());
    }

    // -------------------------------------------------------------------
    // 5. 차량 모델명으로 검색 (메인 페이지 검색 기능)
    // -------------------------------------------------------------------
    @Override
    public List<RecallDTO> searchRecallsByModelName(String modelName) {
        return recallDAO.searchByModelName(modelName);
    }
}