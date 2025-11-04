package com.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boot.dao.NoticeDAO;
import com.boot.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService{
	private final NoticeDAO noticeDAO; 

	@Autowired
	public NoticeServiceImpl(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

    @Override
	public List<NoticeDTO> list() {
		return noticeDAO.list();
	}

    @Override
	@Transactional
	public NoticeDTO contentView(Long noticeId) {
        noticeDAO.upViews(noticeId);
		NoticeDTO dto = noticeDAO.contentView(noticeId);
		return dto;
	}

    //  등록 메서드
    @Override
    public void write(NoticeDTO dto) {
        noticeDAO.write(dto);
    }

    //  수정 메서드
    @Override
    @Transactional
    public void modify(NoticeDTO dto) {
        noticeDAO.modify(dto);
    }

    // 삭제 메서드
    @Override
    @Transactional
    public void delete(Long noticeId) {
        noticeDAO.delete(noticeId);
    }
}
