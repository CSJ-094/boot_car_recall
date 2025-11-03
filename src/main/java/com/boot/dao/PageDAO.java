package com.boot.dao;

import com.boot.dto.BoardDTO;
import com.boot.dto.Criteria;

import java.util.ArrayList;

public interface PageDAO {
	//criteria 객체를 이용해서 페이징 처리
	public ArrayList<BoardDTO> listWithPaging(Criteria cri);
//	public int getTotalCount();
	public int getTotalCount(Criteria cri);

}






















