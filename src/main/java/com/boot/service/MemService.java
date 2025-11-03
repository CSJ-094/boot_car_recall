package com.boot.service;

import com.boot.dto.MemDTO;

import java.util.ArrayList;
import java.util.HashMap;

public interface MemService {
	public ArrayList<MemDTO> loginYn(HashMap<String, String> param);
	public void write(HashMap<String, String> param);
}
