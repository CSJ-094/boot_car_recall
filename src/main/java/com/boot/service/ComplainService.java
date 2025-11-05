package com.boot.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.boot.dto.ComplainDTO;



public interface ComplainService {
	public ArrayList<ComplainDTO> complain_list();
	public void complain_write(HashMap<String, String> param);
	public ComplainDTO contentView(HashMap<String, String> param);
	public void complain_modify(HashMap<String, String> param);
	public void complain_delete(HashMap<String, String> param);
}
