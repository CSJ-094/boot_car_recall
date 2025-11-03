package com.boot.service;

import com.boot.dto.BoardDTO;
import com.boot.dto.Criteria;

import java.util.ArrayList;

public interface PageService {
	public ArrayList<BoardDTO> listWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
}
