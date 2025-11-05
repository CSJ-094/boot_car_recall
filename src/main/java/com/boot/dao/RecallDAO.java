package com.boot.dao;

import com.boot.dto.RecallDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RecallDAO {

    // 1. 단일 리콜 정보 삽입 (Mapper XML과 일치하도록 @Param 제거)
    void insertRecall(RecallDTO recallDTO);

    // 2. 리콜 리스트 배치 삽입 (Init.java의 컴파일 오류 해결을 위해 추가)
    // List를 받으므로 @Param을 명시하여 XML의 <foreach collection="list">와 연결합니다.
    void insertRecallList(@Param("list") List<RecallDTO> recallList);

    // 3. 전체 목록 조회 (페이징 및 검색 기능 포함)
    List<RecallDTO> selectAll(@Param("offset") int offset, @Param("amount") int amount, @Param("keyword") String keyword);

    // 4. 전체 데이터 수 조회 (검색 기능 포함)
    int count(@Param("keyword") String keyword);

    // 5. 모델명으로 검색
    List<RecallDTO> searchByModelName(@Param("modelName") String modelName);
}