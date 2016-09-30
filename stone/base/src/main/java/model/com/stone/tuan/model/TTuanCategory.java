package com.stone.tuan.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.stone.cms.model.TCmsCategory;

public class TTuanCategory implements Serializable {
    /**
     * t_tuan_category.ID (主键)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer id;

    /**
     * t_tuan_category.NAME (类别名称)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private String name;

    /**
     * t_tuan_category.DESCRIPTION (类别描述)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private String description;

    /**
     * t_tuan_category.PARENT_ID (父类别)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer parentId;

    /**
     * t_tuan_category.STATUS (1：启用   2：禁用)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer status;

    /**
     * t_tuan_category.ORDER (显示顺序)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer order;

    /**
     * t_tuan_category.ADMIN_ID (创建人)
     * @ibatorgenerated 2016-02-16 22:01:53
     */
    private Integer adminId;
    

    private List<TTuanCategory> sublist = new ArrayList<TTuanCategory>();


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

	public List<TTuanCategory> getSublist() {
		return sublist;
	}

	public void setSublist(List<TTuanCategory> sublist) {
		this.sublist = sublist;
	}
    
    
    
}