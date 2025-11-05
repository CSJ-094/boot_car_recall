package com.boot.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.BoardDAO;
import com.boot.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private SqlSession sqlSession;


	@Override
	public void write(HashMap<String, String> param) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.write(param);
	}

	@Override
	public BoardDTO contentView(int boardNo) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		BoardDTO dto = dao.contentView(boardNo);

		return dto;
	}

	@Override
	public void modify(HashMap<String, String> param) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.modify(param);
	}

	@Override
	public void delete(HashMap<String, String> param) {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.delete(param);
	}

}






