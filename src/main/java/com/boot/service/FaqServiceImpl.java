package com.boot.service;

<<<<<<< HEAD
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
=======
import com.boot.dao.FaqDAO;
import com.boot.dto.Criteria;
import com.boot.dto.FaqDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class FaqServiceImpl implements FaqService {
    private final FaqDAO faqDAO;

    @Override
    public ArrayList<FaqDTO> getFaqList(Criteria cri) {
        return faqDAO.listWithPaging(cri);
    }

    @Override
    public int getTotal() {
        return faqDAO.getTotalCount();
    }

    @Override
    public FaqDTO getFaq(long faq_id) {
        return faqDAO.getFaq(faq_id);
    }

    @Override
    public void writeFaq(FaqDTO faqDTO) {
        faqDAO.write(faqDTO);
    }

    @Override
    public void modifyFaq(FaqDTO faqDTO) {
        faqDAO.modify(faqDTO);
    }

    @Override
    public void deleteFaq(long faq_id) {
        faqDAO.delete(faq_id);
>>>>>>> ea43a775c9b39041c2c846933da45c1acbc879e0
    }
}
