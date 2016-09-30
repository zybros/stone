package com.stone.ad.model;

import java.io.Serializable;
import java.util.List;

public class TAdLocationLink extends TAdLocationLinkKey implements Serializable {
    /**
     * t_ad_location_link.STATUS (状态：1 显示  2 隐藏)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer status;

    /**
     * t_ad_location_link.ORDER (显示顺序)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer order;

    /**
     * t_ad_location_link.CATEGORY_ID (商品分类id)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer categoryId;

    /**
     * t_ad_location_link.SITE_ID (分站ID)
     * @ibatorgenerated 2015-12-17 12:16:25
     */
    private Integer siteId;
    
    
    
    private List<Integer> adIds;

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

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getSiteId() {
        return siteId;
    }

    public void setSiteId(Integer siteId) {
        this.siteId = siteId;
    }

	public List<Integer> getAdIds() {
		return adIds;
	}

	public void setAdIds(List<Integer> adIds) {
		this.adIds = adIds;
	}
    
    
}