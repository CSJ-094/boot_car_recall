package com.boot.service;

import java.util.List;

import com.boot.dto.NoticeDTO;

public interface NoticeService {
	List<NoticeDTO> list();
    NoticeDTO contentView(Long noticeId);
    
    // 공지사항 등록
    void write(NoticeDTO dto);

    // 공지사항 수정
    void modify(NoticeDTO dto);

    // 공지사항 삭제
    void delete(Long noticeId);
}
