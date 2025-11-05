package com.boot.dao;

import java.util.HashMap;

import com.boot.dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
    void write(HashMap<String, String> param);
    BoardDTO contentView(int param);
    void modify(HashMap<String, String> param);
    void delete(int boardNo);

}






















