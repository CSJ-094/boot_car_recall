package com.boot.dao;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.boot.dto.NoticeDTO;

@Mapper
public interface NoticeDAO {
	public ArrayList<NoticeDTO> list();
	public void write(NoticeDTO dto);
	public void upViews(@Param("noticeId") Long noticeId);
	public NoticeDTO contentView(@Param("noticeId") Long noticeId);
	public void modify(NoticeDTO dto);
	public void delete(@Param("noticeId") Long noticeId);
}
=======
import com.boot.dto.Criteria;
import com.boot.dto.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface NoticeDAO {
    public ArrayList<NoticeDTO> listWithPaging(Criteria cri);
    public int getTotalCount();
    public void write(NoticeDTO noticeDTO);
    public NoticeDTO getNotice(long notice_id);
    public void incrementViews(long notice_id);
    public void modify(NoticeDTO noticeDTO);
    public void delete(long notice_id);
}
>>>>>>> ea43a775c9b39041c2c846933da45c1acbc879e0
