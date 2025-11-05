package com.boot.service;

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