package com.boot.dto;

import lombok.Data;

@Data
public class CarRecallDTO {
    private long report_id;
    private String reporter_name;
    private String reporter_phone;
    private String car_reg_num;
    private String car_model;
    private String defect_detail;
    private boolean is_public;
    private boolean reviewed;
    private String reported_at;
}