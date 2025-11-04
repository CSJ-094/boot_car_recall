package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.FaqDTO;

public interface FaqService {
	public ArrayList<FaqDTO> list();
    public void write(HashMap<String, String> param);
    public FaqDTO contentView(HashMap<String, String> param);
    public void modify(HashMap<String, String> param);
    public void delete(HashMap<String, String> param);
}
