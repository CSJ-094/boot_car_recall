package com.boot.service;

import com.boot.dto.BoardDTO;
import com.boot.dto.Criteria;
import com.boot.dto.RecallDTO;

import java.util.ArrayList;

public interface PageService {
	public ArrayList<RecallDTO> listWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
}
