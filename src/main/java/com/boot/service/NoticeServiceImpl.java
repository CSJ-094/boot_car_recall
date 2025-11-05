package com.boot.service;

<<<<<<< HEAD
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
=======
import com.boot.dao.NoticeDAO;
import com.boot.dto.Criteria;
import com.boot.dto.NoticeDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
    private final NoticeDAO noticeDAO;

    @Override
    public ArrayList<NoticeDTO> getNoticeList(Criteria cri) {
        return noticeDAO.listWithPaging(cri);
    }

    @Override
    public int getTotal() {
        return noticeDAO.getTotalCount();
    }

    @Override
    public void writeNotice(NoticeDTO noticeDTO) {
        noticeDAO.write(noticeDTO);
    }

    @Override
    public NoticeDTO getNotice(long notice_id) {
        noticeDAO.incrementViews(notice_id);
        return noticeDAO.getNotice(notice_id);
    }

    @Override
    public void modifyNotice(NoticeDTO noticeDTO) {
        noticeDAO.modify(noticeDTO);
    }

    @Override
    public void deleteNotice(long notice_id) {
        noticeDAO.delete(notice_id);
    }
}
>>>>>>> ea43a775c9b39041c2c846933da45c1acbc879e0
