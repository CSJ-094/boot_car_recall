package com.boot.service;

<<<<<<< HEAD
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
=======
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
>>>>>>> ea43a775c9b39041c2c846933da45c1acbc879e0
