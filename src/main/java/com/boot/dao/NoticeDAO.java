package com.boot.dao;

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
