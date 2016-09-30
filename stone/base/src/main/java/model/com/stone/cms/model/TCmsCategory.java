package com.stone.cms.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


public class TCmsCategory implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * t_cms_category.ID (主键)
     * @ibatorgenerated 2015-12-20 11:16:19
     */
    private Integer id;

    /**
     * t_cms_category.NAME (类别名称)
     * @ibatorgenerated 2015-12-20 11:16:19
     */
    private String name;

    /**
     * t_cms_category.DESCRIPTION (类别描述)
     * @ibatorgenerated 2015-12-20 11:16:19
     */
    private String description;

    /**
     * t_cms_category.PARENT_ID (父类别)
     * @ibatorgenerated 2015-12-20 11:16:19
     */
    private Integer parentId;

    /**
     * t_cms_category.STATUS (1：启用   2：禁用)
     * @ibatorgenerated 2015-12-20 11:16:19
     */
    private Integer status;

    /**
     * t_cms_category.ORDER (显示顺序)
     * @ibatorgenerated 2015-12-20 11:16:19
     */
    private Integer order;

    /**
     * t_cms_category.ADMIN_ID (创建人)
     * @ibatorgenerated 2015-12-20 11:16:19
     */
    private Integer adminId;
    
    
    
    private List<TCmsCategory> sublist = new ArrayList<TCmsCategory>();


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

	public List<TCmsCategory> getSublist() {
		return sublist;
	}

	public void setSublist(List<TCmsCategory> sublist) {
		this.sublist = sublist;
	}
    
    
}