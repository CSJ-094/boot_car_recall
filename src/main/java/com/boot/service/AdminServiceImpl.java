package com.boot.service;

import com.boot.dao.AdminDAO;
import com.boot.dto.AdminDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminServiceImpl implements AdminService {

    private final AdminDAO adminDAO;

    @Override
    public AdminDTO login(HashMap<String, String> param) {
        log.info("@# login");
        log.info("@# param: {}", param);

        AdminDTO admin = adminDAO.login(param.get("admin_id"));

        if (admin != null && admin.getAdmin_pw().equals(param.get("admin_pw"))) {
            return admin;
        }
        return null;
    }
}
