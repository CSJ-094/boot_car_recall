package com.boot.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDAO {
	public ArrayList<BoardDTO> list();
	public void write(HashMap<String, String> param);
	public BoardDTO contentView(int boardNo); // int 타입의 boardNo를 받는 메서드 추가
	public BoardDTO contentView(HashMap<String, String> param);
	public BoardDTO contentView(int boardNo);
	public void modify(HashMap<String, String> param);
	public void delete(HashMap<String, String> param);
}
<<<<<<< Updated upstream





































=======
>>>>>>> Stashed changes
