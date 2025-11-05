package com.boot.service;

import com.boot.dto.Criteria;
import com.boot.dto.NoticeDTO;

import java.util.ArrayList;

public interface NoticeService {
    public ArrayList<NoticeDTO> getNoticeList(Criteria cri);
    public int getTotal();
    public void writeNotice(NoticeDTO noticeDTO);
    public NoticeDTO getNotice(long notice_id);
    public void modifyNotice(NoticeDTO noticeDTO);
    public void deleteNotice(long notice_id);
}