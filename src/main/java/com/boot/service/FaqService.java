package com.boot.service;

<<<<<<< HEAD
import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.FaqDTO;

public interface FaqService {
	public ArrayList<FaqDTO> list();
    public void write(HashMap<String, String> param);
    public FaqDTO contentView(HashMap<String, String> param);
    public void modify(HashMap<String, String> param);
    public void delete(HashMap<String, String> param);
=======
import com.boot.dto.Criteria;
import com.boot.dto.FaqDTO;

import java.util.ArrayList;

public interface FaqService {
    public ArrayList<FaqDTO> getFaqList(Criteria cri);
    public int getTotal();
    public FaqDTO getFaq(long faq_id);
    public void writeFaq(FaqDTO faqDTO);
    public void modifyFaq(FaqDTO faqDTO);
    public void deleteFaq(long faq_id);
>>>>>>> ea43a775c9b39041c2c846933da45c1acbc879e0
}
