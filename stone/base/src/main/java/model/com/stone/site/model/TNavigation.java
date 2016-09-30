package com.stone.site.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TNavigation implements Serializable {
    /**
     * t_navigation.id
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    private Integer id;

    /**
     * t_navigation.name (导航名称)
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    private String name;

    /**
     * t_navigation.url (导航链接)
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    private String url;

    /**
     * t_navigation.parent_id (父级导航id)
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    private Integer parentId;

    /**
     * t_navigation.type (导航类型：1 纵向  2 横向)
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    private Integer type;

    /**
     * t_navigation.order (显示顺序)
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    private Integer order;

    /**
     * t_navigation.status (状态： 1 启用 2禁用)
     * @ibatorgenerated 2015-12-03 18:17:15
     */
    private Integer status;
    
    private List<TNavigation> sublist = new ArrayList<TNavigation>();

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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

	public List<TNavigation> getSublist() {
		return sublist;
	}

	public void setSublist(List<TNavigation> sublist) {
		this.sublist = sublist;
	}
    
    
}