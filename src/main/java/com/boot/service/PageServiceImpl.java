package com.boot.service;

import com.boot.dao.PageDAO;
import com.boot.dto.BoardDTO;
import com.boot.dto.Criteria;
import com.boot.dto.RecallDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@Slf4j
public class PageServiceImpl implements PageService {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public ArrayList<RecallDTO> listWithPaging(Criteria cri) {
        log.info("@# listWithPaging()");
        log.info("@# cri=>"+cri);

        PageDAO dao = sqlSession.getMapper(PageDAO.class);
        ArrayList<RecallDTO> list = dao.listWithPaging(cri);
        return list;
    }

    @Override
    public int getTotalCount(Criteria cri) {
        PageDAO dao = sqlSession.getMapper(PageDAO.class);
        int total = dao.getTotalCount(cri);

        return total;
    }
}
