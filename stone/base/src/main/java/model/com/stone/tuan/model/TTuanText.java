package com.stone.tuan.model;

import java.io.Serializable;

public class TTuanText implements Serializable {
    /**
     * t_tuan_text.tuan_id
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer tuanId;

    /**
     * t_tuan_text.description (团购副标题)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private String description;

    /**
     * t_tuan_text.detail (团购详情)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private String detail;

    private TTuan tTuanTuanId;

    public Integer getTuanId() {
        return tuanId;
    }

    public void setTuanId(Integer tuanId) {
        this.tuanId = tuanId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void settTuanTuanId(TTuan tTuanTuanId) {
        this.tTuanTuanId=tTuanTuanId;
    }

    public TTuan gettTuanTuanId() {
        return tTuanTuanId;
    }
}