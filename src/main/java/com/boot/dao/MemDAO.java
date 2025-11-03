package com.boot.dao;

import com.boot.dto.MemDTO;

import java.util.ArrayList;
import java.util.HashMap;

public interface MemDAO {
	public ArrayList<MemDTO> loginYn(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
}






















