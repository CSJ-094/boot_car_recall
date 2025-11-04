package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.FaqDAO;
import com.boot.dto.FaqDTO;

@Service
public class FaqServiceImpl implements FaqService{
	@Autowired
    private SqlSession sqlSession;
    
    @Override
    public ArrayList<FaqDTO> list() {
        FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
        return dao.list();
    }

    @Override
    public void write(HashMap<String, String> param) {
        FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
        dao.write(param);
    }

    @Override
    public FaqDTO contentView(HashMap<String, String> param) {
        FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
        return dao.contentView(param);
    }

    @Override
    public void modify(HashMap<String, String> param) {
        FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
        dao.modify(param);
    }

    @Override
    public void delete(HashMap<String, String> param) {
        FaqDAO dao = sqlSession.getMapper(FaqDAO.class);
        dao.delete(param);
    }
}
