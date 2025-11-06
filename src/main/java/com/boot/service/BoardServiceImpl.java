package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.boot.dao.UploadDAO;
import com.boot.dto.BoardAttachDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boot.dao.BoardDAO;
import com.boot.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private SqlSession sqlSession;
    @Autowired
    private UploadService uploadService;

    // -------------------------------------------------------------------
    // 1. 목록 조회 메서드 (첫 번째 구현체에만 있었음)
    // -------------------------------------------------------------------
    @Override
    public ArrayList<BoardDTO> list() {
        BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
        ArrayList<BoardDTO> list = dao.list();
        return list;
    }

    // -------------------------------------------------------------------
    // 2. 작성 메서드 (두 구현체 모두에 있었음)
    // -------------------------------------------------------------------
    @Override
    public void write(HashMap<String, String> param) {
        BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
        dao.write(param);
    }

    // -------------------------------------------------------------------
    // 3. 상세 보기 메서드 (두 버전 오버로딩 구현)
    // -------------------------------------------------------------------

    // 3-1. HashMap 매개변수 버전 (첫 번째 구현체)
    @Override
    public BoardDTO contentView(HashMap<String, String> param) {
        BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
        // HashMap에서 "boardNo" 키의 값을 int로 변환하여 전달
        int boardNo = Integer.parseInt(param.get("boardNo"));
        BoardDTO dto = dao.contentView(boardNo);

        return dto;
    }

    // 3-2. int(boardNo) 매개변수 버전 (두 번째 구현체)
    @Override
    public BoardDTO contentView(int boardNo) {
        BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
        // BoardDAO의 메서드 이름과 매개변수 타입을 맞추어 호출
        // (DAO에도 int 타입의 contentView 메서드가 있다고 가정)
        // 이 메서드는 이미 int를 받으므로 그대로 전달
        BoardDTO dto = dao.contentView(boardNo);

        return dto;
    }

    // -------------------------------------------------------------------
    // 4. 수정 메서드 (두 구현체 모두에 있었음)
    // -------------------------------------------------------------------
    @Override
    public void modify(HashMap<String, String> param) {
        BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
        dao.modify(param);
    }

    // -------------------------------------------------------------------
    // 5. 삭제 메서드 (두 구현체 모두에 있었음)
    // -------------------------------------------------------------------
    @Override
    public void delete(HashMap<String, String> param) {


        BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
        UploadDAO uploadDao = sqlSession.getMapper(UploadDAO.class);
        int boardNo = Integer.parseInt(param.get("boardNo"));
        List<BoardAttachDTO> filePath = uploadDao.getFileList(boardNo);
        uploadService.deleteFile(filePath);

        uploadDao.deleteFile(boardNo);
        dao.delete(param);
    }

    @Override
    public void hitUp(int boardNo) {
        BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
        dao.hitUp(boardNo);
    }
}
