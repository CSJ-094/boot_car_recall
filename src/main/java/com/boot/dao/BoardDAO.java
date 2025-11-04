package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.boot.dto.BoardDTO;
import com.boot.dto.Criteria;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
    void write(HashMap<String, String> param);
    BoardDTO contentView(HashMap<String, String> param);
    void modify(HashMap<String, String> param);
    void delete(int boardNo);

}






















