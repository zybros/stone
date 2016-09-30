package com.stone.site.model;

import java.io.Serializable;

public class TNavigationField implements Serializable {
    /**
     * t_navigation_field.FIELD_ID
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer fieldId;

    /**
     * t_navigation_field.RECORD_ID (navigation_record 主键)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer recordId;

    /**
     * t_navigation_field.NAME (导航名称)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private String name;

    /**
     * t_navigation_field.URL (导航链接)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private String url;

    /**
     * t_navigation_field.ORDER (显示顺序)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer order;

    /**
     * t_navigation_field.HOT (1：正常  2：推荐)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer hot;

    /**
     * t_navigation_field.STATUS (状态： 1 启用 2禁用)
     * @ibatorgenerated 2015-12-22 20:53:29
     */
    private Integer status;

    private TNavigationRecord record;

    public Integer getFieldId() {
        return fieldId;
    }

    public void setFieldId(Integer fieldId) {
        this.fieldId = fieldId;
    }

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getHot() {
        return hot;
    }

    public void setHot(Integer hot) {
        this.hot = hot;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

	public TNavigationRecord getRecord() {
		return record;
	}

	public void setRecord(TNavigationRecord record) {
		this.record = record;
	}

  
}