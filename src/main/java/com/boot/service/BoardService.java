package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.BoardDTO;

public interface BoardService {
    // 첫 번째 인터페이스에만 있던 목록 조회 메서드
    public ArrayList<BoardDTO> list();

    // 두 인터페이스 모두에 있던 작성 메서드 (동일)
    public void write(HashMap<String, String> param);

    // 두 인터페이스의 정의가 달랐던 상세 보기 메서드 (두 형태 모두 필요하다면 오버로딩)
    // 여기서는 두 형태를 모두 포함하여 오버로딩합니다.
    public BoardDTO contentView(HashMap<String, String> param);

    // 두 인터페이스 모두에 있던 수정 메서드 (동일)
    public void modify(HashMap<String, String> param);

    // 두 인터페이스 모두에 있던 삭제 메서드 (동일)
    public void delete(HashMap<String, String> param);
}