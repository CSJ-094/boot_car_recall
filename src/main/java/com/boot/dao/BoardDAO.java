package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param; // int 타입을 사용할 경우 @Param 추가 권장

@Mapper
public interface BoardDAO {
    public ArrayList<BoardDTO> list();
    public void write(HashMap<String, String> param);

    // 이 부분을 수정합니다: HashMap 대신 int를 받도록 변경
    public BoardDTO contentView(@Param("boardNo") int boardNo);

    public void modify(HashMap<String, String> param);
    public void delete(HashMap<String, String> param);
}