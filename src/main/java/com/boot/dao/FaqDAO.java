package com.boot.dao;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.FaqDTO;

public interface FaqDAO {

    public ArrayList<FaqDTO> list();
    public void write(HashMap<String, String> param);
    public FaqDTO contentView(HashMap<String, String> param);
    public void modify(HashMap<String, String> param);
    public void delete(HashMap<String, String> param);
=======
import com.boot.dto.Criteria;
import com.boot.dto.FaqDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface FaqDAO {
    public ArrayList<FaqDTO> listWithPaging(Criteria cri);
    public int getTotalCount();
    public FaqDTO getFaq(long faq_id);
    public void write(FaqDTO faqDTO);
    public void modify(FaqDTO faqDTO);
    public void delete(long faq_id);
>>>>>>> ea43a775c9b39041c2c846933da45c1acbc879e0
}
