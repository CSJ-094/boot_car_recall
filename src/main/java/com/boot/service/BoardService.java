package com.boot.service;

import java.util.HashMap;

import com.boot.dto.BoardDTO;

public interface BoardService {

	public void write(HashMap<String, String> param);
	public BoardDTO contentView(int boardNo);
	public void modify(HashMap<String, String> param);
	public void delete(int boardNo);
}
